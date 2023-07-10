
# Docker-compose c'est quoi ?

Introduction

Docker Compose est un outil permettant de définir le comportement de vos conteneurs et d’exécuter des applications Docker à conteneurs multiples. La config se fait à partir d’un fichier YAML, et ensuite, avec une seule commande, vous créez et démarrez tous vos conteneurs de votre configuration.
Installation du docker-compose

Docker Compose n’est pas installé par défaut et s’appuie sur le moteur Docker pour fonctionner.

| Cat | Sommaire |
|------|------| 
| - A. | [Installation manuelle de Docker.](README.md) |




docker-compose --version
docker-compose version 1.24.0, build 0aa59064

Si vous n’avez pas d’erreur, alors vous pouvez poursuivre la lecture de ce chapitre.

Docker Compose et Dockerfile

Le but de cet article est d’améliorer notre ancienne application LAMP. Par la suite nous allons séparer le conteneur de notre application web par rapport au conteneur de notre base de données.

Au préalable, commencez par télécharger les sources du projet en cliquant ici et désarchivez ensuite le projet.

Amélioration du Dockerfile

Profitons de cet article pour améliorer le Dockerfile de notre stack LAMP en réduisant son nombre d’instructions. Pour cela, on se basera sur une nouvelle image.

    Si vous souhaitez conteneuriser une application assez connue, alors je vous conseille de toujours fouiller dans le Hub Docker, afin de savoir si une image officielle de l’application existe déjà.

En cherchant dans le Hub Docker, j’ai pu dénicher les images adéquates, notamment :

    Une image officielle php avec le tag 7-apache
    Une image officielle mysql

Une fois que j’ai trouvé les bonnes images, je peux alors m’attaquer à la modification du Dockerfile.

Pour le moment, nous utiliserons ce Dockerfile seulement pour construire une image avec une couche OS, Apache et Php sans implémenter aucun service de base de données. Cette image se basera sur l’image officielle php avec le tag 7-apache qui vient déjà avec un OS (distribution Debian). Concernant l’image mysql nous l’utiliserons plus tard dans notre docker-compose.yml.

Dans le même dossier que vous avez désarchivé, créez un fichier Dockerfile et mettez dedans le contenu suivant :

FROM php:7-apache

LABEL version="1.0" maintainer="AJDAINI Hatim &tl;ajdaini.hatim@gmail.com>"

# Activation des modules php
RUN docker-php-ext-install pdo pdo_mysql

WORKDIR  /var/www/html

Buildez ensuite votre image avec la commande suivante :

docker build -t myapp .
