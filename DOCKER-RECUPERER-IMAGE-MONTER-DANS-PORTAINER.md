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

## Récupérer une image Docker & Lancer un conteneur à partir de cette image dans Portainer

------------------------------------------------------------------------

### 🔹 1. Récupérer une image Docker

Depuis ton terminal (ou via l'interface **Portainer → Images**), tu peux
télécharger une image depuis **Docker Hub** (ou un registre privé).

Exemple : récupérer **Nginx** :

``` bash
docker pull nginx:latest
```

------------------------------------------------------------------------

### 🔹 2. Vérifier l'image téléchargée

Tu peux voir toutes les images disponibles sur ton hôte avec :

``` bash
docker images
```

------------------------------------------------------------------------

### 🔹 3. Créer un conteneur depuis Portainer

👉 Connecte-toi à **Portainer** (souvent via :
`http://<IP_SERVEUR>:9443`).

#### Étapes dans l'interface :

1.  Dans le menu gauche → clique sur **Containers**\
2.  Clique sur **+ Add container**\
3.  Remplis les champs :
    -   **Name** : un nom pour ton conteneur (ex. `nginx-test`)\

    -   **Image** : le nom de l'image (ex. `nginx:latest`)\

    -   **Network ports configuration** : mappe le port du conteneur
        vers ta machine

        Exemple :

            host: 8080 → container: 80
4.  Clique sur **Deploy the container**

------------------------------------------------------------------------

### 🔹 4. Vérifier que ça tourne

Une fois lancé, tu peux tester dans ton navigateur :

    http://<IP_SERVEUR>:8080

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>

