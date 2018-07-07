#!/usr/bin/env bash

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    if [ -f /etc/redhat-release ]; then
        yum update
    fi

    if [ -f /etc/lsb-release ]; then
        sudo apt-get update
        sudo apt-get install -y gconf2 wget maven
        sudo apt install -y openjdk-8-jdk
        java --version
    fi

    wget -N https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip -P ./
    unzip ./chromedriver_linux64.zip -d ./
    chmod +x ./chromedriver
    sudo mv -f ./chromedriver /usr/local/share/chromedriver
    sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
    sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

elif [[ "$unamestr" == 'FreeBSD' ]]; then

   echo 'FreeBSD is not supported'

elif [[ "$unamestr" == 'Darwin' ]]; then

   echo 'MacOS is not supported'

elif [[ "$unamestr" == 'WindowsNT' ]]; then

   echo 'Windows is not supported'

fi




