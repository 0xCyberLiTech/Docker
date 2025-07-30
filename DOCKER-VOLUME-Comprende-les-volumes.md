<p align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="./images/Docker-logo-01.png" alt="Logo Docker" width="360">
  </a>
</p>

<div align="center">

  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=32&pause=1000&color=D14A4A&center=true&vCenter=true&width=700&lines=CONTENEURISATION+AVEC+DOCKER;Docker+•+Docker+Compose+•+Portainer;Tutoriels+et+Guides+Pratiques" alt="Typing SVG" />
  </a>

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
> 🎯 **Objectif :** proposer un contenu clair, structuré et accessible pour étudiants, curieux et professionnels de l’IT.  
> 🔗 [Mon GitHub principal](https://github.com/0xCyberLiTech)

<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim" alt="Skills" />
  </a>
</p>

---

### 🎯 **Objectif de ce dépôt.**

> Ce dépôt a pour vocation de centraliser un ensemble de notions clés autour de Docker. Il s’adresse aux passionnés, étudiants et professionnels souhaitant mieux comprendre les principes de la conteneurisation,
> apprendre à construire, déployer et gérer des applications avec Docker, et se familiariser avec les concepts et outils essentiels pour optimiser leurs flux de développement et leurs infrastructures.

---

## DOCKER VOLUME - Comprendre les volumes dans Docker.

Que sont les volumes dans Docker ?

Les volumes permettent de garder en mémoire des données de manière permanente.

Pour bien comprendre nous allons utiliser un exemple.

Imaginez que vous ayez un conteneur avec une distribution Linux. Par exemple Ubuntu.

Le conteneur servira à lancer un système d'exploitation Linux. Mais qu'en est-il de certaines données ? Par exemple celles présentes dans le répertoire personnel /home.

Elles sont enregistrées également dans le conteneur.

Mais si nous supprimons le conteneur, nous supprimons aussi les données.

Comment palier à ce problème ?

Grâce aux volumes.

Ils vous permettront de garder en mémoire des dossiers de votre choix de votre conteneur.

Grâce à cette technique, vous pouvez garder des informations de manière permanente.

![volume-docker.png](./images/volume-docker.png)

Pourquoi utiliser les volumes ?

Le volume est une fonctionnalité très intéressante dans Docker.

Elle rend l'utilisation des conteneurs encore plus attrayants.

En effet, sans celle-ci, dès lors que nous supprimons un conteneur, toutes les données sont supprimées.

Avec des volumes bien configurés, il est possible de réutiliser certaines données dans un autre conteneur, de les exporter ailleurs ou de les importer.

C'est particulièrement profitable pour les conteneurs de bases de données.

Mais pas seulement.

Pour les fichiers de configurations aussi (Nginx pour ne parler que de lui, mais c'est le cas pour n'importe quel autre serveur web ou programme qui nécessite des fichiers de configuration).

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
