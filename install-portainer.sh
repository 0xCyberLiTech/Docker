#!/bin/sh

# --------------------------------------------------------
# 0xCyberLiTech
# Script créé le 09-06-2023 
# Script modifié le 15-06-2023
#
# touch install-portainer.sh
# chmod +x install-portainer.sh
# sudo ./install-portainer.sh
# --------------------------------------------------------
sudo docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

