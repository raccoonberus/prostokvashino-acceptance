#!/usr/bin/env bash

export $(cat .env | xargs)

cd "$(dirname "$0")"

java -cp prostokvashino-acceptance.jar \
    -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver \
    -Dproject.host=https://prostokvashino-v2.demo.isobar.ru/ \
    com.adwatch.prostokvashino.Application com.adwatch.prostokvashino.scenario.QuizScenario
