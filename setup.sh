#!/bin/bash

# make jar
cd webflux-todo
mvn install -DskipTests
cd ../

# npm install
cd workspace-front
npm install
npm run build:compose
cd ../

# copy initial sql
cp webflux-todo/src/main/resources/schema.sql mysql_init/
