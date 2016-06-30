#!/bin/bash

echo "Building latest Custom NiFi Processors and placing in mount location"
./pull_latest_workflow.sh
cd ../../NiFiCustomProcessors

# build NiFi OpenCV
cd nifi-opencv
mvn clean install package -DskipTests
mv ./nifi-opencv-nar/target/nifi-opencv-nar-0.6.1.nar ../../summit_server/nifi/lib/.

# Build NiFi Barcode
cd ../nifi-barcode
mvn clean install package -DskipTests
mv ./nifi-barcode-nar/target/nifi-barcode-nar-0.6.1.nar ../../summit_server/nifi/lib/.

# Rebuild the Docker Image
cd ../../summit_server
./DockerBuild.sh

# Kill the existing running processes.
CONTAINER_ID=$(docker ps | grep NIFI_HO | awk '{ print $1 }')
docker kill $CONTAINER_ID

# Start new processes
./DockerRun.sh
