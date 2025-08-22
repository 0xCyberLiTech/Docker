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

## PORTAINER, mise à jour automatisée.

```
nano update-portainer-latest.sh
```

```
#!/bin/sh
# --------------------------------------------------------
# 0xCyberLiTech
# Créé  : 22-08-2025
# Objet : Mise à jour de Portainer CE vers la dernière image "latest"
#
# Usage :
#   nano update-portainer-latest.sh
#   chmod +x update-portainer-latest.sh
#   sudo ./update-portainer-latest.sh
# --------------------------------------------------------

set -eu

echo "=== Mise à jour automatisée de Portainer CE (latest) ==="

# --- Variables ---
IMAGE="portainer/portainer-ce:latest"
CONTAINER="portainer"
VOLUME="portainer_data"
HTTPS_PORT="9443"

# Vérif Docker
if ! command -v docker >/dev/null 2>&1; then
  echo "Erreur : Docker n'est pas installé."
  exit 1
fi

# Vérif si conteneur existe
if ! docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
  echo "Erreur : aucun conteneur '${CONTAINER}' trouvé."
  echo "Lance d'abord le script d'installation."
  exit 1
fi

# Pull dernière image
echo "Téléchargement de la nouvelle image Portainer CE (latest)..."
docker pull "${IMAGE}"

# Arrêt + suppression ancien conteneur
echo "Arrêt et suppression de l'ancien conteneur ${CONTAINER}..."
docker stop "${CONTAINER}" || true
docker rm   "${CONTAINER}" || true

# Relance avec la nouvelle image
echo "Redémarrage de Portainer avec la nouvelle image..."
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

echo "=== Mise à jour terminée ! ==="
echo "Accédez à Portainer via : https://<IP_de_votre_serveur>:${HTTPS_PORT}"
```

```
chmod +x update-portainer-latest.sh
```

```
sudo ./update-portainer-latest.sh
```

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
