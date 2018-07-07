#!/usr/bin/env bash

export $(cat .env | xargs)

mvn clean package

java -cp target/prostokvashino-acceptance-1.0-SNAPSHOT-fat-tests.jar \
    -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver \
    -Dproject.host=https://prostokvashino-v2.demo.isobar.ru/ \
    com.adwatch.prostokvashino.Application com.adwatch.prostokvashino.scenario.QuizScenario
