echo "Creating Hadoop Summit RPI Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/summit_rpi .