echo "Creating Hadoop Summit WiNiFi Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/hadoopsummit:summit_winifi .