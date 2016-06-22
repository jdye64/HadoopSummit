#!/bin/bash
docker run --name mysql -p 3306:3306 -v /var/lib/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=hadoopsummit -d mysql:5.6

docker rm -f $(docker ps -a -q)
docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")

mysql --local-infile=1  -h mysql -P 3306 -u root -p


# Example of how to load csv data
load data local infile 'Data.csv' into table attendees
fields terminated by ','
lines terminated by '\n';

insert into attendees(ID, FirstName, LastName, Company) VALUES(0123, 'Melissa', 'Park', 'Hortonworks');