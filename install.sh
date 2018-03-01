#!/bin/bash

# Get the IP address
IP=$(hostname -I)

echo -e "####################\nYour IP address is: \n# $IP\n####################"

sudo apt-get update

sudo apt-get install socat jq curl avahi-daemon apt-transport-https ca-certificates software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0eBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce

sudo apt-cache madison docker-ce

curl -sL https://raw.githubusercontent.com/home-assistant/hassio-build/master/install/hassio_install | bash -

sudo docker run hello-world

echo -e "\nYour new docker containers are:\n$(docker ps)\n"

echo -e "\nSuccess! go to\n\nhttp://$(IP):8123\n\n"
