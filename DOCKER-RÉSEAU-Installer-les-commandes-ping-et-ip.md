<div align="center">

  ![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

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

##  DOCKER RÉSEAU - Installer les commandes ping et ip

Avant de commencer, il est important d'annoncer les commandes que nous utiliserons.

Celles-ci ne sont pas forcément propres à Docker, mais au système du système d'exploitation Linux.

Pour nos conteneurs, nous allons installer et utiliser deux commandes.

Pour quel objectif ? Faire des tests et vérifier que nos conteneurs soient bien connectés et réussissent à bien communiquer via le réseau.

- ping
- ip
- Ping

La commande ping permet de vérifier s'il est possible d'envoyer et de recevoir des informations à et d'une autre machine (ou d'un autre conteneur).

Pour l'installer, copiez la commande qui suit.

```
apt-get update && apt-get install -y iputils-ping
```

## IP
La commande ip affiche, entre autres choses, l'adresse IP de notre machine (ou conteneur).

Avant de l'utiliser, il faut l'installer.

```
apt-get update && apt-get install -y iproute2
```

Pour information cette commande remplace ifconfig.

🔴 Les conteneurs Ubuntu que nous nous servons sont minimalistes.

Cela signifie qu'ils ne contiennent que les programmes nécessaires à leur bon fonctionnement.

Pour bien comprendre les réseaux, il nous faudra lancer plusieurs conteneurs.

Pour chacun d'entre eux, il faut absolument installer ping et ip.

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
