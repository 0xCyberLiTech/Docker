<div align="center">

  <br></br>
  
  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&size=50&duration=6000&pause=1000000000&color=FF0048&center=true&vCenter=true&width=1100&lines=%3EDOCKER_" alt="Titre dynamique DOCKER" />
  </a>
  
  <br></br>

  <p align="center">
    <em>Guides et tutoriels sur la conteneurisation avec Docker.</em><br>
    <b>🐳 Conteneurs – 📦 Isolation – 🚀 Déploiement</b>
  </p>

  [![🔗 Profil GitHub](https://img.shields.io/badge/Profil-GitHub-181717?logo=github&style=flat-square)](https://github.com/0xCyberLiTech)
  [![📦 Dernière version](https://img.shields.io/github/v/release/0xCyberLiTech/Docker?label=version&style=flat-square&color=blue)](https://github.com/0xCyberLiTech/Docker/releases/latest)
  [![📄 CHANGELOG](https://img.shields.io/badge/📄%20Changelog-Docker-blue?style=flat-square)](https://github.com/0xCyberLiTech/Docker/blob/main/CHANGELOG.md)
  [![📂 Dépôts publics](https://img.shields.io/badge/Dépôts-publics-blue?style=flat-square)](https://github.com/0xCyberLiTech?tab=repositories)
  [![👥 Contributeurs](https://img.shields.io/badge/👥%20Contributeurs-cliquez%20ici-007ec6?style=flat-square)](https://github.com/0xCyberLiTech/Docker/graphs/contributors)

</div>

---

### 👨‍💻 **À propos de moi.**

> Bienvenue dans mon **laboratoire numérique personnel** dédié à l’apprentissage et à la vulgarisation de la cybersécurité.  
> Passionné par **Linux**, la **cryptographie** et les **systèmes sécurisés**, je partage ici mes notes, expérimentations et fiches pratiques.  
>  
> Pproposer un contenu clair, structuré et accessible pour étudiants, curieux et professionnels de l’IT.  

<p align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim" alt="Skills" alt="Logo techno" width="300">
  </a>
</p>

---

### 🎯 **Objectif de ce dépôt.**

> Ce dépôt a pour vocation de centraliser un ensemble de notions clés autour de Docker. Il s’adresse aux passionnés, étudiants et professionnels souhaitant mieux comprendre les principes de la conteneurisation,
> apprendre à construire, déployer et gérer des applications avec Docker, et se familiariser avec les concepts et outils essentiels pour optimiser leurs flux de développement et leurs infrastructures.

---

### Installation de docker sur DEBIAN 13

1. Prépare ton système :

sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg

Cela te permet de télécharger des paquets via HTTPS et d’ajouter la clé GPG de Docker en toute confiance.

---

2. Ajoute la clé GPG officielle de Docker :

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg

Ou selon la doc Docker

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

Ces commandes importent et sécurisent la clé GPG pour vérifier les paquets APT

---

3. Ajoute le dépôt Docker pour Trixie :

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian trixie stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

Cela active le dépôt Docker stable pour Debian 13 Trixie.

---

4. Installe Docker Engine et les composants essentiels :

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

Cela installe Docker, le CLI, containerd, le plugin buildx et le plugin Docker Compose (version 2+ intégrée à Docker).

---

5. Vérifie que Docker fonctionne correctement :

sudo systemctl is-active docker
sudo docker run hello-world

Ça teste si le service tourne et si un conteneur simple fonctionne.

---

6. Exécuter Docker sans sudo :

Pour une utilisation simplifiée :

sudo groupadd docker      # si le groupe n’existe pas encore
sudo usermod -aG docker $USER

Ensuite, déconnecte-toi/reconnecte-toi ou exécute newgrp docker.

---

7. Utiliser Docker Compose

Avec Docker 2.x, le plugin s’utilise via :

docker compose version
docker compose up -d

Le binaire docker-compose (1.x) est désormais obsolète 
- Reddit > https://www.reddit.com/r/debian/comments/1hwq1d7/dockercompose_on_trixie/?utm_source=chatgpt.com
- Docker Documentation > https://docs.docker.com/compose/install/linux/?utm_source=chatgpt.com

. Bien que certains utilisateurs parlent de difficultés à trouver docker-compose dans les dépôts Trixie, l’approche recommandée est bien le plugin intégré

Récapitulatif des commandes :

sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian trixie stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl is-active docker && echo "Docker est actif"
sudo docker run hello-world
sudo usermod -aG docker $USER
docker compose version

A venir configurer un docker-compose.yaml, des alias pratiques
Script d’installation automatique :

Script d’installation automatique de Docker + Docker Compose (plugin officiel) pour Debian 13 (Trixie).

📜 Script : install-docker-trixie.sh

#!/bin/bash
# ============================================================
# Script d'installation automatique de Docker & Docker Compose
# pour Debian 13 (Trixie)
# Auteur : 0xCyberLiTech
# ============================================================

set -e

echo "[INFO] Mise à jour du système..."
apt update -y && apt upgrade -y

echo "[INFO] Installation des dépendances..."
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

echo "[INFO] Ajout de la clé GPG Docker..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "[INFO] Ajout du dépôt Docker (Trixie)..."
CODENAME=$(lsb_release -cs)  # doit renvoyer 'trixie'
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $CODENAME stable" \
    > /etc/apt/sources.list.d/docker.list

echo "[INFO] Mise à jour des dépôts..."
apt update -y

echo "[INFO] Installation de Docker et Docker Compose (plugin)..."
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[INFO] Activation et démarrage de Docker..."
systemctl enable docker
systemctl start docker

echo "[INFO] Ajout de l'utilisateur $SUDO_USER au groupe docker..."
if [ -n "$SUDO_USER" ]; then
    usermod -aG docker $SUDO_USER
else
    echo "[WARN] Script exécuté en root directement. Pense à ajouter ton utilisateur au groupe docker manuellement."
fi

echo "[INFO] Vérification de l'installation..."
docker --version
docker compose version

echo "============================================================"
echo "[SUCCESS] Docker & Docker Compose ont été installés avec succès !"
echo "Déconnecte-toi / reconnecte-toi pour utiliser Docker sans sudo."
echo "Test : docker run hello-world"
echo "============================================================"

---

1 - Utilisation

Crée le fichier du script :

nano install-docker-trixie.sh

---

2 - Colle le contenu ci-dessus, enregistre (CTRL+O, CTRL+X).

---

3 - Rends le script exécutable :

chmod +x install-docker-trixie.sh

---

4 - Lance-le (en root ou via sudo) :

sudo ./install-docker-trixie.sh

👉 Résultat :

- Docker CE + CLI + containerd + buildx + docker compose plugin installés.
- Service docker actif au démarrage.
- Ton utilisateur ajouté au groupe docker.
- Vérification de version effectuée automatiquement.

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
