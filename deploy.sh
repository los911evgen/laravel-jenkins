#!/bin/sh

sed -i 's/latest/'$BUILD_NUMBER'/' docker-compose.yaml
cat docker-compose.yaml
cp env.docker .env
ls -lah
/usr/local/bin/docker-compose up -d --force-recreate
