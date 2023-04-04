#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"



VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2.... $R FAILURE $N"
        exit 1 
    else
        echo -e "$2... $G SUCESS anoooo $N" 
    fi
}


sudo apt update 

VALIDATE $? "apt updateted"

sudo apt install apt-transport-https ca-certificates curl software-properties-common

VALIDATE $? "cert sucesss"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
