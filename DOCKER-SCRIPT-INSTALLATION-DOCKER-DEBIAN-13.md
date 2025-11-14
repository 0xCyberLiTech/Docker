<div align="center">

  <br></br>
  
  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&size=50&duration=6000&pause=1000000000&color=FF0048&center=true&vCenter=true&width=1100&lines=%3EDOCKER_" alt="Titre dynamique DOCKER" />
  </a>
  
  <br></br>

  <h2>Laboratoire numérique pour la cybersécurité, Linux & IT.</h2>

  <p align="center">
    <p align="center">
      <a href="https://0xcyberlitech.github.io/">
        <img src="https://img.shields.io/badge/Portfolio-0xCyberLiTech-181717?logo=github&style=flat-square" alt="🌐 Portfolio" />
      </a>
      <a href="https://github.com/0xCyberLiTech">
        <img src="https://img.shields.io/badge/Profil-GitHub-181717?logo=github&style=flat-square" alt="🔗 Profil GitHub" />
      </a>
      <a href="https://github.com/0xCyberLiTech/Docker/releases/latest">
        <img src="https://img.shields.io/github/v/release/0xCyberLiTech/Docker?label=version&style=flat-square&color=blue" alt="📦 Dernière version" />
      </a>
      <a href="https://github.com/0xCyberLiTech/Docker/blob/main/CHANGELOG.md">
        <img src="https://img.shields.io/badge/📄%20Changelog-Docker-blue?style=flat-square" alt="📄 CHANGELOG Docker" />
      </a>
      <a href="https://github.com/0xCyberLiTech?tab=repositories">
        <img src="https://img.shields.io/badge/Dépôts-publics-blue?style=flat-square" alt="📂 Dépôts publics" />
      </a>
      <a href="https://github.com/0xCyberLiTech/Docker/graphs/contributors">
        <img src="https://img.shields.io/badge/👥%20Contributeurs-cliquez%20ici-007ec6?style=flat-square" alt="👥 Contributeurs Docker" />
      </a>
    </p>
  </p>

</div>

<div align="center">
  <img src="https://img.icons8.com/fluency/96/000000/cyber-security.png" alt="CyberSec" width="80"/>
</div>

<div align="center">
  <p>
    <strong>Cybersécurité</strong> <img src="https://img.icons8.com/color/24/000000/lock--v1.png"/> • <strong>Linux Debian</strong> <img src="https://img.icons8.com/color/24/000000/linux.png"/> • <strong>Sécurité informatique</strong> <img src="https://img.icons8.com/color/24/000000/shield-security.png"/>
  </p>
</div>

---

<div align="center">
  
## À propos & Objectifs.

</div>

Ce projet propose des solutions innovantes et accessibles en cybersécurité, avec une approche centrée sur la simplicité d’utilisation et l’efficacité. Il vise à accompagner les utilisateurs dans la protection de leurs données et systèmes, tout en favorisant l’apprentissage et le partage des connaissances.

Le contenu est structuré, accessible et optimisé SEO pour répondre aux besoins de :
- 🎓 Étudiants : approfondir les connaissances
- 👨‍💻 Professionnels IT : outils et pratiques
- 🖥️ Administrateurs système : sécuriser l’infrastructure
- 🛡️ Experts cybersécurité : ressources techniques
- 🚀 Passionnés du numérique : explorer les bonnes pratiques

---

## Script d’installation automatique :
### Rappel sur la commande sudo, si celle-ci n'est pas installée et configurée :

```bash
su - root
apt install sudo
usermod -aG sudo cyberlitech
init 6
```

📜 Script Docker + Docker Compose (plugin officiel) pour Debian 13 (Trixie).

📜 Script : install-docker-debian-13.sh

---

Version totalement non-interactive, adaptée pour des automatisations (CI/CD, cloud-init, scripts distants, etc.).
Elle n’utilise aucune interaction utilisateur et force les actions nécessaires.

1 - Utilisation

Script Docker Debian 13 — 100% non-interactif

Crée le fichier du script :

```bash
nano install-docker-debian-13.sh
```

---

2 - Colle le contenu ci-dessous, enregistre (CTRL+O, CTRL+X).

```bash
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 14-11-2025
# Date de modification : le 14-11-2025
# install-docker-debian-13.sh
# --------------------------------------------------------------------------

#!/bin/bash
# Installation non interactive de Docker sur Debian 13 (Trixie)

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

echo "=== Mise à jour du système ==="
apt-get update -y
apt-get full-upgrade -y
apt-get install -y ca-certificates curl gnupg lsb-release

echo "=== Création du dossier des clés GPG ==="
install -m 0755 -d /etc/apt/keyrings

echo "=== Téléchargement de la clé GPG Docker ==="
curl -fsSL https://download.docker.com/linux/debian/gpg \
  | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

chmod a+r /etc/apt/keyrings/docker.gpg

echo "=== Ajout du dépôt Docker ==="
CODENAME=$( . /etc/os-release && echo "$VERSION_CODENAME" )

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/debian $CODENAME stable" \
  > /etc/apt/sources.list.d/docker.list

echo "=== Mise à jour des dépôts ==="
apt-get update -y

echo "=== Installation de Docker Engine + Compose ==="
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "=== Test des versions ==="
docker --version || echo "Docker non trouvé"
docker compose version || echo "Docker Compose non trouvé"

echo "=== Test du conteneur hello-world ==="
docker run --rm hello-world || true

echo "=== Ajout de l’utilisateur au groupe docker ==="
usermod -aG docker "$SUDO_USER" 2>/dev/null || usermod -aG docker "$USER" || true

echo "=== Activation du service Docker ==="
systemctl enable docker
systemctl start docker

echo "=== Nettoyage ==="
apt-get autoremove -y
apt-get clean

echo "=== Installation terminée (mode non-interactif) ==="

```

3 - Rends le script exécutable :

```bash
chmod +x install-docker-debian-13.sh
```

---

4 - Lance-le (en root ou via sudo) :

```bash
sudo ./install-docker-debian-13.sh
```

---

Points clés :

- Zéro interaction (même pour APT → DEBIAN_FRONTEND=noninteractive).
- Ajoute automatiquement l’utilisateur courant au groupe docker si détecté.
- Teste automatiquement docker run hello-world.
- Tout logué en clair avec ✔ / ⚠ / ✘.

---

<div align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim,python,markdown" alt="Skills" width="440">
  </a>
</div>

<div align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</div>

