

##Comprendre les volumes dans Docker.

Que sont les volumes dans Docker ?

Les volumes permettent de garder en mémoire des données de manière permanente.

Pour bien comprendre nous allons utiliser un exemple. Imaginez que vous ayez un conteneur avec une distribution Linux. Par exemple Ubuntu.

Le conteneur servira à lancer un système d'exploitation Linux. Mais qu'en est-il de certaines données ? Par exemple celles présentes dans répertoire personnel /home.

Elles sont enregistrées également dans le conteneur. Mais si nous supprimons le conteneur, nous supprimons aussi les données.

Comment palier à ce problème ?

Grâce aux volumes.

Ils vous permettront de garder en mémoire des dossiers de votre choix de votre conteneur. Grâce à cette technique, vous pouvez garder des informations de manière permanente.

![volume-docker.png](./images/volume-docker.png)



