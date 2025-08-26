<div align="center">

  <br></br>
  
  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&size=50&duration=6000&pause=1000000000&color=FF0048&center=true&vCenter=true&width=1100&lines=%3EDOCKER_" alt="Titre dynamique DOCKER" />
  </a>
  
  <br></br>

  <p align="center">
    <em>Installation automatisée de Portainer.</em><br>
    <b>🐳 Conteneurs – 📦 Isolation – 🚀 Déploiement</b>
  </p>

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

---

### 👨‍💻 **À propos de moi**

> Bienvenue sur le dépôt <strong>0xCyberLiTech</strong>, votre laboratoire numérique pour l'<strong>apprentissage</strong> et la <strong>vulgarisation</strong> de la <strong>cybersécurité</strong>, de l'<strong>administration Linux Debian</strong> et de la <strong>sécurité informatique</strong>.
> Passionné par <strong>Linux</strong>, la <strong>cryptographie</strong>, la <strong>supervision réseau</strong> et les <strong>systèmes sécurisés</strong>, je partage ici des <strong>tutoriels</strong>, <strong>guides pratiques</strong>, <strong>fiches techniques</strong> et <strong>retours d'expérience</strong> pour renforcer vos compétences IT.
>
> 🎯 <strong>Objectif :</strong> Offrir un contenu structuré, accessible et optimisé pour le référencement naturel, destiné aux étudiants, professionnels, administrateurs système, experts en sécurité et curieux du monde numérique.

<p align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim,python,markdown" alt="Skills" width="420">
  </a>
</p>

---

### 🎯 **Objectif de ce dépôt.**

> Ce dépôt a pour vocation de centraliser un ensemble de notions clés autour de Docker. Il s’adresse aux passionnés, étudiants et professionnels souhaitant mieux comprendre les principes de la conteneurisation,
> apprendre à construire, déployer et gérer des applications avec Docker, et se familiariser avec les concepts et outils essentiels pour optimiser leurs flux de développement et leurs infrastructures.

---

## Script d'installation de Portainer dans sa dernière version.

Rappel sur la commande sudo, si celle-ci n'est pas installée et configurée :

```bash
su - root
apt install sudo
usermod -aG sudo cyberlitech
init 6
```

---

1 - Utilisation

Crée le fichier du script :

```bash
nano script-install-portainer-latest.sh
```

---

2 - Colle le contenu ci-dessous, enregistre (CTRL+O, CTRL+X).

```sh
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 25-08-2025
# Date de modification : le 25-08-2025
# script-install-portainer-latest.sh
# --------------------------------------------------------------------------
#!/bin/sh

set -eu

echo "=== Installation automatisée de Portainer CE ==="

# --- Variables (modifiables) ---
IMAGE="portainer/portainer-ce:latest"
CONTAINER="portainer"
VOLUME="portainer_data"
HTTPS_PORT="9443"

# --- Vérifs de base ---
# Le script est généralement lancé avec sudo, donc pas besoin de préfixer les commandes docker.
if ! command -v docker >/dev/null 2>&1; then
  echo "Erreur : Docker n'est pas installé. Installez Docker puis relancez."
  exit 1
fi

# Alerte si le port est déjà occupé
if command -v ss >/dev/null 2>&1 && ss -tulpen | grep -q ":${HTTPS_PORT} "; then
  echo "Erreur : le port ${HTTPS_PORT} est déjà utilisé. Libérez-le ou changez HTTPS_PORT."
  exit 1
fi

# --- Nettoyage éventuel d'une ancienne instance (nom exact) ---
if [ -n "$(docker ps -a -q --filter "name=^/${CONTAINER}$")" ]; then
  echo "Arrêt et suppression de l'ancien conteneur ${CONTAINER}..."
  docker stop "${CONTAINER}" || true
  docker rm   "${CONTAINER}" || true
fi

# --- Volume de données ---
if ! docker volume inspect "${VOLUME}" >/dev/null 2>&1; then
  echo "Création du volume Docker '${VOLUME}'..."
  docker volume create --label app=portainer "${VOLUME}" >/dev/null
fi

# --- Image ---
echo "Téléchargement/maj de l'image Portainer CE..."
docker pull "${IMAGE}"

# --- Lancement (HTTPS uniquement) ---
echo "Lancement du conteneur Portainer (HTTPS sur le port ${HTTPS_PORT})..."
docker run -d \
  --name "${CONTAINER}" \
  --restart=always \
  -p "${HTTPS_PORT}:9443" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "${VOLUME}":/data \
  --label app=portainer \
  --security-opt no-new-privileges:true \
  --log-opt max-size=10m --log-opt max-file=3 \
  "${IMAGE}" \
  --http-disabled

# NOTE : pour préconfigurer le mot de passe admin (recommandé),
# crée un hash bcrypt et utilise l’option ci-dessous :
#   ... "${IMAGE}" --admin-password-file /data/admin_password
# en plaçant le hash bcrypt dans /var/lib/docker/volumes/${VOLUME}/_data/admin_password
# (à générer via 'mkpasswd -m bcrypt' ou 'htpasswd -bnBC 12 "" "TonMotDePasse" | tr -d :')

echo "Installation terminée !"
echo "Accédez à Portainer via : https://<IP_de_votre_serveur>:${HTTPS_PORT}"
```

---

3 - Rends le script exécutable :

```bash
chmod +x script-install-portainer-latest.sh
```

---

4 - Lance-le (en root ou via sudo) :

```bash
sudo ./script-install-portainer-latest.sh
```

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
