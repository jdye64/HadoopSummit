echo "Creating Hadoop Summit Baseline Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/hadoopsummit:summit_baseline .