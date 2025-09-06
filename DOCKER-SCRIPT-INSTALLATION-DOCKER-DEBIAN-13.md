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

📜 Script : install-docker-trixie-noninteractive.sh

---

1 - Utilisation

Crée le fichier du script :

```bash
nano install-docker-trixie-noninteractive.sh
```

---

2 - Colle le contenu ci-dessous, enregistre (CTRL+O, CTRL+X).

```bash
# --------------------------------------------------------------------------
# 0xCyberLiTech
# Date de création : le 25-08-2025
# Date de modification : le 25-08-2025
# install-docker-trixie-noninteractive.sh
# --------------------------------------------------------------------------

#!/usr/bin/env bash
# install-docker-trixie-noninteractive.sh
# Installation non-interactive de Docker Engine + Compose (plugin officiel) sur Debian 13 (Trixie)

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
if [[ "${ID:-}" != "debian" || "${VERSION_CODENAME:-}" != "trixie" ]]; then
  warn "OS détecté: ${PRETTY_NAME:-inconnu}. Ce script vise Debian 13 (Trixie)."
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
"deb [arch=${ARCH} signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian trixie stable" \
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

ok "Installation Docker + Compose sur Debian Trixie terminée 🎉"
```

3 - Rends le script exécutable :

```bash
chmod +x install-docker-trixie-noninteractive.sh
```

---

4 - Lance-le (en root ou via sudo) :

```bash
sudo ./install-docker-trixie-noninteractive.sh
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

