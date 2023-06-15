#!/bin/sh

# --------------------------------------------------------
# CyberLiTech
# Script créé le 09-06-2023 
# Script modifié le 15-06-2023
#
# touch upgrade-portainer.sh
# chmod +x upgrade-portainer.sh
# sudo ./upgrade-portainer.sh
# --------------------------------------------------------

# Mise à jour automatisée de Portainer sur DEBIAN 11.x
# --------------------------------------------------------
# 

# Portainer permettant de mettre à jour facilement nos conteneurs, il peut être tentant de l’utiliser également pour le mettre à jour lui-même. 
# Spoiler : c’est une mauvaise idée qui va tout simplement casser votre Portainer. 

# Nous allons tout d’abord arrêter le conteneur puis le supprimer. 
# Comme nous utilisons un volume, les données importantes du conteneur ne seront pas supprimées.
# On télécharge ensuite la dernière image de Portainer, puis nous relançons le conteneur avec les mêmes réglages qu’à l’origine.

sudo docker stop portainer
sudo docker rm portainer
sudo docker pull portainer/portainer-ce:latest

sudo docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

# Portainer est maintenant à jour et tous ses réglages ont été conservés.
