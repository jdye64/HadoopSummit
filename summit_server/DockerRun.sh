#!/bin/bash
SLEEP_SEC="40"
HDP_IMAGE_NAME="jdye64/hadoopsummit:summit_server"
eval "$(docker-machine env docker-hwx)"

DOCKER_MACHINE_NAME=env | grep docker | grep DOCKER_MACHINE_NAME | cut -f2 -d'='
echo "Current Docker Machine '$DOCKER_MACHINE_NAME'"

# Checks to see if MySQL is already running.
MYSQL_CONTAINER_ID=$(docker ps | grep mysql:5.6 | awk '{ print $1 }')
if [ -n "$MYSQL_CONTAINER_ID" ]; 
then
	echo "There is already an instance of MySQL:5.6 running in container $MYSQL_CONTAINER_ID"
else
	echo "Starting required mysql:5.6 Docker container"
	# Removes any already existing containers
	EXISTING_CONTAINER=$(docker ps -a | grep mysql:5.6 | awk '{ print $1 }')
	docker rm -f $EXISTING_CONTAINER
	docker run --name mysql -p 3306:3306 --privileged -v /var/lib/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=hadoopsummit -d mysql:5.6
	echo "Sleep for 10 seconds to give MySQL time to startup and be available for linking"
	sleep 10
fi

# Checks for an instance of $NIFI_IMAGE_NAME already running
CONTAINER_ID=$(docker ps | grep jdye64/hadoopsummit:summit_server | awk '{ print $1 }')
if [ -n "$CONTAINER_ID" ]; then
	echo "There is already an instance of $HDP_IMAGE_NAME running as container $CONTAINER_ID"
	while true; do
    	read -p "Would you like to kill the already running $HDP_IMAGE_NAME container?" yn
    	case $yn in
        	[Yy]* ) echo "killing Docker container $CONTAINER_ID"; docker kill $CONTAINER_ID; break;;
        	[Nn]* ) exit;;
        	* ) echo "Please answer yes or no.";;
    	esac
	done
fi

echo "Launching latest $HDP_IMAGE_NAME instance"
CONTAINER_ID=$(docker run -t -d -p 9090:9090 -p 9091:9091 --privileged --link mysql:mysql -h docker.dev $HDP_IMAGE_NAME)

IP_ADDR=$(docker-machine inspect $DOCKER_MACHINE_NAME | grep IPAddress | cut -f2 -d':' | cut -f2 -d'"')
echo "IPAddress: $IP_ADDR"
#NIFI_PORT=$(docker ps | grep $HDP_IMAGE_NAME | tr "," "\n" | grep 8080/tcp | cut -f2 -d ':' | cut -f1 -d '-')
NIFI_URL="http://$IP_ADDR:9090/nifi"
echo "Opening $HDP_IMAGE_NAME WebUI at $NIFI_URL"
echo "Sleeping for $SLEEP_SEC seconds before opening browser to give $HDP_IMAGE_NAME time to launch WebUI"
sleep $SLEEP_SEC
open $NIFI_URL
