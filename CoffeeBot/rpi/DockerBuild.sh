echo "Creating CoffeeBot Scale Docker Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/coffeebot:scale .