#!/bin/bash

# --------------------------------------------------------
# 0xCyberLiTech
# Script créé le 08-07-2023
# Script modifié le 10-07-2023
#
# touch installation-automatisée-de-docker-compose.sh
# chmod +x installation-automatisée-de-docker-compose.sh
# sh ./installation-automatisée-de-docker-compose.sh
# --------------------------------------------------------
sudo apt update
sudo apt install -y curl wget
curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -
chmod +x docker-compose-linux-x86_64
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
docker-compose version
sudo usermod -aG docker $USER
newgrp docker
exit 0
