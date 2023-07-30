![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

## DOCKER Comprendre les volumes dans Docker.

Que sont les volumes dans Docker ?

Les volumes permettent de garder en mémoire des données de manière permanente.

Pour bien comprendre nous allons utiliser un exemple. Imaginez que vous ayez un conteneur avec une distribution Linux. Par exemple Ubuntu.

Le conteneur servira à lancer un système d'exploitation Linux. Mais qu'en est-il de certaines données ? Par exemple celles présentes dans répertoire personnel /home.

Elles sont enregistrées également dans le conteneur. Mais si nous supprimons le conteneur, nous supprimons aussi les données.

Comment palier à ce problème ?

Grâce aux volumes.

Ils vous permettront de garder en mémoire des dossiers de votre choix de votre conteneur. Grâce à cette technique, vous pouvez garder des informations de manière permanente.

![volume-docker.png](./images/volume-docker.png)

Pourquoi utiliser les volumes ?

Le volume est une fonctionnalité très intéressante dans Docker.

Elle rend l'utilisation des conteneurs encore plus attrayants.

En effet, sans celle-ci, dès lors que nous supprimons un conteneur, toutes les données sont supprimées.

Avec des volumes bien configurés, il est possible de réutiliser certaines données dans un autre conteneur, de les exporter ailleurs ou de les importer.

C'est particulièrement profitable pour les conteneurs de bases de données.

Mais pas seulement.

Pour les fichiers de configurations aussi (Nginx pour ne parler que de lui, mais c'est le cas pour n'importe quel autre serveur web ou programme qui nécessite des fichiers de configuration).

