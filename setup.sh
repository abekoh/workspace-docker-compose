#!/bin/bash

# make jar
docker run --rm -v $PWD/webflux-todo:/app -v $HOME/.m2/repository:/root/.m2/repository -w /app maven:3-jdk-11 mvn install -DskipTests

# npm install
docker run --rm -v $PWD/workspace-front:/app -v $HOME/.npm:/root/.npm -w /app node:12.14.0 /bin/bash -c "yarn install ; yarn build:compose"

# copy initial sql
cp webflux-todo/src/main/resources/schema.sql mysql_init/
