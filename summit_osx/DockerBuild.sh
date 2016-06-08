echo "Creating Hadoop Summit OS X Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/hadoopsummit:summit_osx .