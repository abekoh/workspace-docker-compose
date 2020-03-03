#!/bin/bash

# make jar
cd webflux-todo
mvn install -DskipTests
cd ../

# copy initial sql
cp webflux-todo/src/main/resources/schema.sql mysql_init/
