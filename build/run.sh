#!/usr/bin/env bash

cd "$(dirname "$0")"

wget -N https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip -P ./
unzip -f ./chromedriver_linux64.zip -d ./
chmod +x ./chromedriver

#exit

export $(cat .env | xargs)

java -cp prostokvashino-acceptance.jar \
    -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver \
    -Dproject.host=https://prostokvashino-v2.demo.isobar.ru/ \
    com.adwatch.prostokvashino.Application com.adwatch.prostokvashino.scenario.QuizScenario
