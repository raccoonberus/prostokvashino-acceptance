#!/usr/bin/env bash

mvn clean package
cp target/prostokvashino-acceptance-1.0-SNAPSHOT-fat-tests.jar \
    ./build/prostokvashino-acceptance.jar