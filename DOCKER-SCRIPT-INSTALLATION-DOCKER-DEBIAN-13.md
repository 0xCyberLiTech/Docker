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
# Installation totalement non-interactive de Docker sur Debian 13 (Trixie)

set -euo pipefail

# Garantit zéro interaction APT
export DEBIAN_FRONTEND=noninteractive
APT_OPTS="-o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold"

echo "[1/8] Mise à jour du système"
apt-get update -y
apt-get $APT_OPTS full-upgrade -y

echo "[2/8] Installation des dépendances"
apt-get install -y ca-certificates curl gnupg lsb-release

echo "[3/8] Création du dossier des clés GPG"
install -m 0755 -d /etc/apt/keyrings

echo "[4/8] Téléchargement des clés Docker"
curl -fsSL https://download.docker.com/linux/debian/gpg \
  | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "[5/8] Ajout du dépôt Docker"
CODENAME=$( . /etc/os-release && echo "$VERSION_CODENAME" )

cat <<EOF > /etc/apt/sources.list.d/docker.list
deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/debian $CODENAME stable
EOF

echo "[6/8] Mise à jour des dépôts"
apt-get update -y

echo "[7/8] Installation de Docker Engine + Compose (non-interactif)"
apt-get $APT_OPTS install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[8/8] Vérifications automatiques"

echo "[✓] Version Docker :"
docker --version || echo "ERREUR: Docker non trouvé"

echo "[✓] Version Docker Compose :"
docker compose version || echo "ERREUR: Compose non trouvé"

echo "[✓] Test : docker run hello-world"
docker run --rm hello-world || echo "ERREUR: hello-world ne s'est pas exécuté"

# Détermination automatique de l'utilisateur réel
REAL_USER="${SUDO_USER:-${USER:-root}}"

if id "$REAL_USER" >/dev/null 2>&1 && [ "$REAL_USER" != "root" ]; then
    echo "[✓] Ajout de l'utilisateur $REAL_USER au groupe docker"
    usermod -aG docker "$REAL_USER" || true
else
    echo "[i] Aucun utilisateur non-root détecté → pas d'ajout au groupe docker"
fi

echo "[✓] Activation du service Docker"
systemctl enable docker
systemctl start docker

echo "[✓] Nettoyage"
apt-get autoremove -y
apt-get clean

echo "=== Installation Docker (zéro interaction) terminée avec succès ==="
```
---

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

✔ Zéro interaction obligatoire
DEBIAN_FRONTEND=noninteractive
Dpkg::Options::=--force-confdef & --force-confold
Aucun sudo
Aucun prompt APT, même en cas de modification de fichiers de configuration

✔ Ajout automatique de l’utilisateur courant
Détecte SUDO_USER (SSH, sudo)
Sinon, utilise $USER
Ignore si root

✔ Tests automatisés
Affiche les versions installées
Lance docker run --rm hello-world sans bloquer le script en cas d’erreur

✔ Prêt pour :
cloud-init
Packer
Ansible (via shell module)
Terraform provisioners
Déploiement automatisé

---

<div align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim,python,markdown" alt="Skills" width="440">
  </a>
</div>

<div align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</div>

