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

## Mise à jour de Portainer CE (Debian 12 & 13)

Prérequis avoir installé auparavant sudo si celui-ci n'est pas présent.

```
# su - root
# apt install sudo
# usermod -aG sudo cyberlitech
# init 6
```

Portainer permettant de mettre à jour facilement nos conteneurs, il peut être tentant de l’utiliser également pour le mettre à jour lui-même. 

Spoiler : c’est une mauvaise idée qui va tout simplement casser votre Portainer. 

Nous allons tout d’abord arrêter le conteneur puis le supprimer. 

Comme nous utilisons un volume, les données importantes du conteneur ne seront pas supprimées.

On télécharge ensuite la dernière image de Portainer, puis nous relançons le conteneur avec les mêmes réglages qu’à l’origine.

```bash
sudo docker stop portainer
```

```bash
sudo docker rm portainer
```

Quand une nouvelle version sort :

Télécharger la dernière image.

```bash
sudo docker pull portainer/portainer-ce:latest
```

Stopper et supprimer l'ancien conteneur

```bash
sudo docker stop portainer
```

```bash
sudo docker rm portainer
```

Relancer avec la nouvelle image (volume conservé) :

```bash
sudo docker run -d \
  -p 9443:9443 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest \
  --http-disabled
```

Accéder à Portainer :

Après le redémarrage, accéder à nouveau à.

👉 https://<IP_de_votre_serveur>:9443

Le volume portainer_data conserve toutes les configurations, utilisateurs et stacks existants.

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
