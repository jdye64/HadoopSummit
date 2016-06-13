Goals
=====
* Track amount of Coffee left in coffee pot in an office environment.
* Alert interested users when the level of Coffee drops below a threshold. Users should take turn making more Coffee.
* Store metrics and data about when Coffee is consumed to understand drinking patterns around time.
* Utilize BLE and iBeacon technology to understand when people are nearby the coffee maker and understand who is drinking the most coffee.
* Handle multiple units with a centralized server architecture that allows analytics to occur on the server side

Architecture
============


Docker Images
=============

| Docker Image Name | DockerHub Link | Purpose |
| ----------------- | -------------- | ------- |
| jdye64/coffeebot:baseline | https://hub.docker.com/r/jdye64/coffeebot/tags/ | Baseline container extended by all other images |