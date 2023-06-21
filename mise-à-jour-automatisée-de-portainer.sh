#!/bin/sh

# --------------------------------------------------------
# 0xCyberLiTech
# Script créé le 09-06-2023 
# Script modifié le 21-06-2023
#
# touch mise-à-jour-automatisée-de-portainer.sh
# chmod +x mise-à-jour-automatisée-de-portainer.sh
# sudo ./mise-à-jour-automatisée-de-portainer.sh
# --------------------------------------------------------

# su - root
# apt install sudo
# adduser 'user' sudo
# init 6

sudo docker stop portainer
sudo docker rm portainer
sudo docker pull portainer/portainer-ce:latest

sudo docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

