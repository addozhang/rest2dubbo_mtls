#!/bin/sh

export WAREHOUSE_ADDRESS=127.0.0.1:7701

java -Dspring.profiles.active=dubbo,dev -Ddubbo.registry.register=false -jar dubbo-bookstore-20881/bookstore-0.0.1-SNAPSHOT.jar > logs/bookstore.log &


