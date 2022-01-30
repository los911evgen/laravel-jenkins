#!/bin/sh

sed -i 's/latest/'$BUILD_NUMBER'/' docker-compose.yaml
cat docker-compose.yaml
cp env.docker .env
ls
#docker-compose up -d --force-recreate
