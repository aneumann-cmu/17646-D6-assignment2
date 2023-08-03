#!/bin/sh
nohup java -jar /root/spring-petclinic-3.1.0-SNAPSHOT.jar --server.port=8085 > /dev/null 2>&1 &
