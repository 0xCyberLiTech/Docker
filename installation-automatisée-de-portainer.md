#!/bin/sh

# --------------------------------------------------------
# 0xCyberLiTech
# Script créé le 09-06-2023 
# Script modifié le 22-08-2025
#
# Usage :
#   touch installation-automatisée-de-portainer.sh
#   chmod +x installation-automatisée-de-portainer.sh
#   sudo ./installation-automatisée-de-portainer.sh
# --------------------------------------------------------

set -e

echo "=== Installation automatisée de Portainer CE ==="

# Vérification de Docker
if ! command -v docker >/dev/null 2>&1; then
  echo "Erreur : Docker n'est pas installé. Veuillez installer Docker avant de lancer ce script."
  exit 1
fi

# Arrêt et suppression d'un ancien conteneur Portainer si présent
if [ "$(sudo docker ps -a -q -f name=portainer)" ]; then
  echo "Arrêt et suppression de l'ancien conteneur Portainer..."
  sudo docker stop portainer || true
  sudo docker rm portainer || true
fi

# Création du volume de données si absent
if ! sudo docker volume ls | grep -q portainer_data; then
  echo "Création du volume Docker 'portainer_data'..."
  sudo docker volume create portainer_data
fi

# Téléchargement de la dernière image
echo "Téléchargement de l'image Portainer CE..."
sudo docker pull portainer/portainer-ce:latest

# Lancement du conteneur Portainer en HTTPS uniquement
echo "Lancement du conteneur Portainer (HTTPS sur le port 9443)..."
sudo docker run -d -p 9443:9443 --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest \
  --http-disabled

echo "Installation terminée !"
echo "Accédez à Portainer via : https://<IP_de_votre_serveur>:9443"
