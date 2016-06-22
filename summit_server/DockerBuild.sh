echo "Creating Hadoop Summit Server Image"
eval "$(docker-machine env docker-hwx)"
docker build --no-cache -t jdye64/hadoopsummit:server .