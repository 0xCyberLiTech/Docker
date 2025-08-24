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
> Pproposer un contenu clair, structuré et accessible pour étudiants, curieux et professionnels de l’IT.  

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

## Script d’installation automatique :

📜 Script Docker + Docker Compose (plugin officiel) pour Debian 12 (Bookworm).

📜 Script : install-docker-bookworm-noninteractive.sh

```bash
#!/usr/bin/env bash
# install-docker-bookworm-noninteractive.sh
# Installation non-interactive de Docker Engine + Compose (plugin officiel) sur Debian 12

set -euo pipefail

# ---------- Couleurs ----------
BOLD="\e[1m"; GREEN="\e[32m"; RED="\e[31m"; YELLOW="\e[33m"; RESET="\e[0m"
log(){ echo -e "${BOLD}👉 $*${RESET}"; }
ok(){ echo -e "${GREEN}✔${RESET} $*"; }
warn(){ echo -e "${YELLOW}⚠${RESET} $*"; }
err(){ echo -e "${RED}✘${RESET} $*"; }

# ---------- Vérif root ----------
if [[ $EUID -ne 0 ]]; then
  err "Ce script doit être exécuté en root (sudo)."
  exit 1
fi

# ---------- OS ----------
. /etc/os-release
if [[ "${ID:-}" != "debian" || "${VERSION_CODENAME:-}" != "bookworm" ]]; then
  warn "OS détecté: ${PRETTY_NAME:-inconnu}. Ce script vise Debian 12 (Bookworm)."
fi
ARCH="$(dpkg --print-architecture)"
log "Arch: ${ARCH}, Distro: ${PRETTY_NAME}"

# ---------- Dépendances ----------
log "Installation dépendances..."
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y \
  ca-certificates curl gnupg lsb-release apt-transport-https

# ---------- GPG & dépôt ----------
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg \
  | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=${ARCH} signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian ${VERSION_CODENAME} stable" \
  > /etc/apt/sources.list.d/docker.list

# ---------- Installation ----------
log "Installation Docker Engine + CLI + plugins..."
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y \
  docker-ce docker-ce-cli containerd.io \
  docker-buildx-plugin docker-compose-plugin

# ---------- Service ----------
systemctl enable --now docker

# ---------- Groupe docker ----------
CURRENT_USER="${SUDO_USER:-$(logname 2>/dev/null || echo "")}"
if [[ -n "$CURRENT_USER" ]]; then
  if id -nG "$CURRENT_USER" | grep -qw docker; then
    ok "Utilisateur ${CURRENT_USER} déjà dans le groupe docker."
  else
    usermod -aG docker "$CURRENT_USER"
    warn "Ajout de ${CURRENT_USER} au groupe docker. Déconnectez-vous/reconnectez-vous pour activer."
  fi
fi

# ---------- Vérifications ----------
if docker --version >/dev/null 2>&1; then
  ok "Docker CLI: $(docker --version)"
else
  err "Docker CLI non détecté"
fi

if docker compose version >/dev/null 2>&1; then
  ok "Docker Compose plugin: $(docker compose version)"
else
  err "Compose plugin non détecté"
fi

# ---------- Test auto ----------
log "Exécution test hello-world..."
docker run --rm hello-world && ok "Test hello-world OK."

ok "Installation Docker + Compose terminée 🎉"
```

---

1 - Utilisation

Crée le fichier du script :

```bash
nano install-docker-bookworm-noninteractive.sh
```

---

2 - Colle le contenu ci-dessus, enregistre (CTRL+O, CTRL+X).

---

3 - Rends le script exécutable :

```bash
chmod +x install-docker-bookworm-noninteractive.sh
```

---

4 - Lance-le (en root ou via sudo) :

```bash
sudo ./install-docker-bookworm-noninteractive.sh
```

---

Points clés :

- Zéro interaction (même pour APT → DEBIAN_FRONTEND=noninteractive).
- Ajoute automatiquement l’utilisateur courant au groupe docker si détecté.
- Teste automatiquement docker run hello-world.
- Tout logué en clair avec ✔ / ⚠ / ✘.

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
