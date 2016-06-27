#!/bin/bash
echo "Retrieving the latest NiFi workflow from the running Docker container"
CONTAINER_ID=$(docker ps | grep jdye64/hadoopsummit:summit_server | awk '{ print $1 }')

docker cp $CONTAINER_ID:/nifi-0.6.1/conf/flow.xml.gz ../nifi/conf/.