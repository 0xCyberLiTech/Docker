#!/bin/sh

# --------------------------------------------------------
# 0xCyberLiTech
# Script créé le 09-06-2023 
# Script modifié le 14-07-2023
#
# touch installation-automatisée-de-portainer.sh
# chmod +x installation-automatisée-de-portainer.sh
# sudo ./installation-automatisée-de-portainer.sh
# --------------------------------------------------------

# su - root
# apt install sudo
# adduser 'user' sudo
# init 6

#sudo docker run -d -p 9000:9000 --name portainer \
#  --restart=always \
#  -v /var/run/docker.sock:/var/run/docker.sock \
#  -v portainer_data:/data \
#  portainer/portainer-ce:latest

sudo docker run -d -p 9443:9443 --name portainer \
   --restart=always \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v portainer_data:/data \
   portainer/portainer-ce:latest \
   --http-disabled
