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

## Installation manuelle de Docker Engine & Docker compose (docker-compose-plugin v2).

## Important.

À partir de juillet 2023, Docker-compose V1 a cessé de recevoir des mises à jour.

Il n’est également plus disponible dans les nouvelles versions de Docker Desktop.

Docker compose V2 est inclus dans toutes les versions actuellement prises en charge de Docker Desktop.

Nouvelle syntaxe concerant Docker compose :

- Avant - docker-compose
- Après - docker compose

## Installation de Docker Engine & Docker-compose-plugin v2.

Installation de Docker sur Debian 12.

Il existe plusieurs façons d’installer Docker sur votre système Debian 12.

Il est disponible dans les dépôts officiels de Debian, où il peut être facilement installé avec une seule commande APT.

Cependant, un inconvénient de cette approche est que la version disponible n’est pas toujours la plus récente.

Pour cette raison, je vais vous montrer comment installer Docker sur Debian 12 à partir du dépôt officiel de Docker.

Cette approche garantit que vous obtenez toujours la dernière version à jour et que vous recevrez automatiquement toutes les futures mises à jour logicielles dès qu’elles seront disponibles.

Rappel sur la commande sudo, si celle-ci n'est pas installée :

```
su - root
apt install sudo
usermod -aG sudo cyberlitech
init 6
```

## Étape 1 : Installer les composants requis.

Tout d’abord, exécutez les deux commandes ci-dessous pour mettre à jour l’index du package et installer les composants requis nécessaires pour ajouter et utiliser un nouveau référentiel HTTPS.

```
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg
```
## Étape 2: Ajouter la clé GPG Repo de Docker.
Ensuite, importez la clé du dépôt Docker GPG dans votre système Debian.

Cette fonction de sécurité garantit l’authenticité du logiciel que vous installez.

```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
```
## Étape 3 : Ajouter le dépôt Docker à Debian 12.

Après avoir importé les clés GPG, nous ajouterons le dépôt officiel Docker à notre système Debian 12.

Cela implique que le package de mise à jour sera disponible avec le reste des mises à jour régulières de votre système si une nouvelle version est publiée.
```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
Comme pour la commande précédente, son exécution ne produit aucune sortie.

Ensuite, actualisez la liste des packages.
```
sudo apt update
```
```
Réception de :2 https://download.docker.com/linux/debian bookworm InRelease [43,3 kB]
Réception de :5 https://download.docker.com/linux/debian bookworm/stable amd64 Packages [11,9 kB]
```
Nous pouvons voir que notre nouveau référentiel Docker est maintenant disponible et prêt à être utilisé.

## Étape 4 : Installer Docker sur Debian 12 (Bookworm).

Pour installer la dernière version de Docker sur Debian, exécutez la commande ci-dessous.
```
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin
```
Cela installe les composants Docker suivants :

- docker-ce : Le moteur Docker lui-même.
- docker-ce-cli : Un outil de ligne de commande qui vous permet de parler au démon Docker.
- containerd.io : runtime de conteneur qui gère le cycle de vie du conteneur.
- docker-buildx-plugin : Un plugin CLI qui étend la version Docker avec de nombreuses nouvelles fonctionnalités.

C’est tout! Docker devrait maintenant être installé; Le service a démarré et activé pour démarrer automatiquement au démarrage.

En outre, vous pouvez vérifier l’état du service Docker à l’aide des éléments suivants :
```
sudo systemctl is-active docker
```
## Étape 5 : Vérifier l’installation de Docker.

Vérifions maintenant si tout fonctionne correctement avec notre nouvelle installation Docker.
```
sudo docker version
```
```
sudo docker compose version
```
Nous allons exécuter une application simple appelée « hello-world ».
```
sudo docker run hello-world
```
Activation des utilisateurs non root pour exécuter des commandes Docker.

Jusqu’à présent, nous avons installé avec succès Docker sur votre système Debian 12.

Toutefois, seuls les utilisateurs root et sudo disposant de privilèges sudo qui peuvent exécuter des commandes Docker par défaut.

Ainsi, pour exécuter des commandes Docker en tant qu’utilisateur non root, vous devez ajouter votre utilisateur au groupe « docker ».

Pour ce faire, tapez ce qui suit :

```
sudo usermod -aG docker ${USER}
```
Dans la commande ci-dessus, ${USER} est une variable d’environnement qui contient votre nom d’utilisateur.

Pour demander la nouvelle adhésion au groupe, redémarrez votre système Debian.

Vous pouvez ensuite exécuter des commandes Docker sans les préfixer avec 'sudo'.

## Conclusion :

Nous avons exploré le processus étape par étape d’installation de Docker sur Debian 12 (Bookworm).

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
