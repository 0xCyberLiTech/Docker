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

## Installation manuelle de Docker Engine & Docker compose (docker-compose-plugin v2+) sur DEBIAN 13.

Rappel sur la commande sudo, si celle-ci n'est pas installée et configurée :

```bash
su - root
apt install sudo
usermod -aG sudo cyberlitech
init 6
```

1. Prépare système :

```bash
sudo apt update
```

```bash
sudo apt install apt-transport-https ca-certificates curl gnupg
```

Cela te permet de télécharger des paquets via HTTPS et d’ajouter la clé GPG de Docker en toute confiance.

---

2. Ajoute la clé GPG officielle de Docker :

```bash
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
```

Ou selon la doc Docker

```bash
sudo install -m 0755 -d /etc/apt/keyrings
```

```bash
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
```

```bash
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

Ces commandes importent et sécurisent la clé GPG pour vérifier les paquets APT

---

3. Ajoute le dépôt Docker pour Trixie :

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian trixie stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
```

Cela active le dépôt Docker stable pour Debian 13 Trixie.

---

4. Installe Docker Engine et les composants essentiels :

```bash
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Cela installe Docker, le CLI, containerd, le plugin buildx et le plugin Docker Compose (version 2+ intégrée à Docker).

---

5. Vérifie que Docker fonctionne correctement :

```bash
sudo systemctl is-active docker
```

```bash
sudo docker run hello-world
```

Ça teste si le service tourne et si un conteneur simple fonctionne.

---

6. Exécuter Docker sans sudo :

Pour une utilisation simplifiée :

```bash
sudo usermod -aG docker $USER
```

Ensuite, déconnecte-toi/reconnecte-toi ou exécute newgrp docker.

---

7. Utiliser Docker Compose

Avec Docker 2.x, le plugin s’utilise via :

```bash
docker compose version
```

```bash
docker compose up -d
```

Le binaire docker-compose (1.x) est désormais obsolète :
- Reddit > https://www.reddit.com/r/debian/comments/1hwq1d7/dockercompose_on_trixie/?utm_source=chatgpt.com
- Docker Documentation > https://docs.docker.com/compose/install/linux/?utm_source=chatgpt.com

. Bien que certains utilisateurs parlent de difficultés à trouver docker-compose dans les dépôts Trixie, l’approche recommandée est bien le plugin intégré

Récapitulatif des commandes :

```bash
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
```

---

👉 Résultat :

- Docker CE + CLI + containerd + buildx + docker compose plugin installés.
- Service docker actif au démarrage.
- Ton utilisateur ajouté au groupe docker.
- Vérification de version effectuée automatiquement.

---

<div align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim,python,markdown" alt="Skills" width="440">
  </a>
</div>

<div align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</div>

