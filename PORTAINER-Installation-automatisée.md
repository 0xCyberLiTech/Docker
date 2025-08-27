<div align="center">

  <br></br>
  
  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&size=50&duration=6000&pause=1000000000&color=FF0048&center=true&vCenter=true&width=1100&lines=%3EDOCKER_" alt="Titre dynamique DOCKER" />
  </a>
  
  <br></br>

  <h2>Laboratoire numérique pour la cybersécurité, Linux & IT</h2>

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

<!--
Optimisation SEO : mots-clés cybersécurité, Linux, administration système, sécurité informatique, tutoriels, guides, expertise, formation, supervision, Docker, OpenVAS, firewall, proxy, DNS, SSH, Debian, IT, réseau, cryptographie, open source, ressources techniques, étudiants, professionnels, passionnés.
-->

<div align="center">
  <img src="https://img.icons8.com/fluency/96/000000/cyber-security.png" alt="CyberSec" width="80"/>
</div>

<div align="center">
  <p>
    <strong>Cybersécurité</strong> <img src="https://img.icons8.com/color/24/000000/lock--v1.png"/> • <strong>Linux Debian</strong> <img src="https://img.icons8.com/color/24/000000/linux.png"/> • <strong>Sécurité informatique</strong> <img src="https://img.icons8.com/color/24/000000/shield-security.png"/>
  </p>
</div>

---

## 🚀 À propos & Objectifs

Ce projet propose des solutions innovantes et accessibles en cybersécurité, avec une approche centrée sur la simplicité d’utilisation et l’efficacité. Il vise à accompagner les utilisateurs dans la protection de leurs données et systèmes, tout en favorisant l’apprentissage et le partage des connaissances.

Le contenu est structuré, accessible et optimisé SEO pour répondre aux besoins de :
- 🎓 Étudiants : approfondir les connaissances
- 👨‍💻 Professionnels IT : outils et pratiques
- 🖥️ Administrateurs système : sécuriser l’infrastructure
- 🛡️ Experts cybersécurité : ressources techniques
- 🚀 Passionnés du numérique : explorer les bonnes pratiques

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

<div align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim,python,markdown" alt="Skills" width="440">
  </a>
</div>

<div align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</div>
