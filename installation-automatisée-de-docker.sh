#!/bin/sh

# --------------------------------------------------------
# 0xCyberLiTech
# Script créé le 09-06-2023
# Script modifié le 21-06-2023
#
# touch installation-automatisée-de-docker.sh
# chmod +x installation-automatisée-de-docker.sh
# sudo ./installation-automatisée-de-docker.sh
# --------------------------------------------------------

# su - root
# apt install sudo
# adduser 'user' sudo
# init 6

sudo apt-get update && sudo apt upgrade -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo systemctl enable docker
sudo systemctl status docker.service
