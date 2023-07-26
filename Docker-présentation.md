## DOCKER Présentation.

Dans ce tutoriel, nous allons voir comment installer Docker Engine sur Debian 12 afin d'utiliser ses premiers containers sous Linux !
Cette installation pas-à-pas repose sur la méthode officielle décrite dans la documentation de Docker Engine.
Au-delà des dépendances que nous allons installer et de Docker Engine en lui-même, les ressources de votre machine seront déterminantes pour exécuter plus ou moins de containers Docker.

L'utilisation d'un container reste très pratique pour tester rapidement un logiciel sans affecter la machine hôte, en phase de développement, etc.
Un container Docker Engine va permettre d'empaqueter facilement des applications afin de les rendre utilisables sur différentes plateformes.
De nos jours, c'est une technologie populaire et appréciée et que l'on utilise aussi bien on-premise que sur les environnements Cloud.

Pour fonctionner, Docker Engine s'appuie sur différents composants qu'il est important de connaître :

- Docker Engine ou Docker Daemon correspondant au processus qui fait tourner Docker sur le système, en charge de la génération et l'exécution des containers.
- Docker Registry est un emplacement de stockage pour héberger les images de containers Docker. (il peut être public ou privé).
- Docker Image correspondant à un fichier qui contient la définition d'un container Docker (dépendances, configuration, etc).
- Docker Client correspondant à l'utilitaire en ligne de commande qui va permettre de gérer les containers (commande "docker").
- Docker Container correspondant aux containers en eux-mêmes, tout en sachant qu'une image peut permettre de créer plusieurs containers avec chacun un identifiant unique.

La documentation de Docker Engine est disponible à cette adresse : docs.docker.com
[ La documentation de Docker Engine est disponible ici.](https://docs.docker.com/)
