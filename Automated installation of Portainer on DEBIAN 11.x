#!/bin/sh

# --------------------------------------------------------
# Marc MALET
# Script créé le 09-06-2023 
# Script modifié le 09-06-2023
#
# Automated_installation_of_Portainer_on_DEBIAN_11_x.sh
# chmod +x Automated_installation_of_Portainer_on_DEBIAN_11_x.sh
#
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

# Comme tous les conteneurs, son installation est particulièrement simple et ce sera le seul conteneur que nous aurons à créer depuis la ligne de commande. Pour ce faire, il suffit simplement de lancer cette commande :

sudo docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

# Une fois le conteneur lancé, il suffit de se rendre sur http://@IPduserveur:9000 pour accéder à Portainer. 
# Les étapes de configuration sont ensuite limpides et vous devriez vous en sortir.

# Mettre à jour Portainer
# Portainer permettant de mettre à jour facilement nos conteneurs, il peut être tentant de l’utiliser également pour le mettre à jour lui-même. 
# Spoiler : c’est une mauvaise idée qui va tout simplement casser votre Portainer. 

# Nous allons tout d’abord arrêter le conteneur puis le supprimer. Comme nous utilisons un volume, les données importantes du conteneur ne seront pas supprimées.
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
