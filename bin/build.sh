#!/usr/bin/env bash

cd "$(dirname "$0")"
cd ./../

mvn clean package
cp target/prostokvashino-acceptance-1.0-SNAPSHOT-fat-tests.jar \
    build/prostokvashino-acceptance.jar

cd build/


if [[ ! -f ./chromedriver_linux64.zip ]]; then
    wget -N https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip -P ./
fi
unzip -o chromedriver_linux64.zip -d ./
chmod +x ./chromedriver


if [[ ! -f ./chromedriver_win32.zip ]]; then
    wget -N https://chromedriver.storage.googleapis.com/2.38/chromedriver_win32.zip -P ./
fi
unzip -o ./chromedriver_win32.zip -d ./
chmod +x ./chromedriver.exe


zip ./prostokvashino-acceptance-build.zip \
    chromedriver.exe \
    chromedriver \
    .env.dist \
    prostokvashino-acceptance.jar \
    run.bat \
    run.sh