#!/bin/sh

java -Dspring.profiles.active=dubbo,dev -Ddubbo.registry.register=false -jar dubbo-bookwarehouse-20880/bookwarehouse-0.0.1-SNAPSHOT.jar > logs/bookwarehouse.log &


