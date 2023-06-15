#!/bin/sh

# --------------------------------------------------------
# CyberLiTech
# Script créé le 09-06-2023 
# Script modifié le 09-06-2023
#
# touch install-portainer.sh
# chmod +x install-portainer.sh
# sudo ./install-portainer.sh
# --------------------------------------------------------

# Installation automatisée de Portainer sur DEBIAN 11.x
# --------------------------------------------------------
# 

# Prérequis avoir installé au paravant sudo si celui-ci n'est pas présent

# su - root
# apt install sudo
# adduser mmalet sudo
# init 6

# Portainer est un conteneur Docker qui a pour but de faciliter l’installation et la gestion de vos autres conteneurs Docker. 
# Pour faire simple, il va nous permettre de nous affranchir totalement de la ligne de commande pour déployer des conteneurs, les mettre à jour et gérer leurs paramètres.

# Comme tous les conteneurs, son installation est particulièrement simple et ce sera le seul conteneur que nous aurons à créer depuis la ligne de commande. 
# Pour ce faire, il suffit simplement de lancer cette commande :

sudo docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

# Une fois le conteneur lancé, il suffit de se rendre sur http://@IPduserveur:9000 pour accéder à Portainer. 
# Les étapes de configuration sont ensuite limpides et vous devriez vous en sortir.
