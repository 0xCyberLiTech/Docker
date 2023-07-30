
![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

## DOCKER Réseaux Mapper des ports.

- A) Comment mapper un port dans Docker ?
- B) Explication de "-p 9000:80"

Relier des ports grâce au mappage de ports.

Dans certains conteneurs, il est possible d'accéder à des services grâce au numéro d'un port.

Par exemple, c'est le cas du conteneur Nginx qui est un serveur web.

Comme vous le savez peut-être, nous sommes capables d'atteindre une page web via le port 80 du conteneur (ou de manière générale, le port 80 d'un serveur).

ℹ️ Si vous n'êtes pas familiarisé avec les serveurs web, ce n'est pas grave.

Laissez vous guider et essayez juste de comprendre cette notion de mappage de port.

Cependant, un conteneur est indépendant et nous ne pouvons pas l'atteindre via l'extérieur.

En l'état, il n'est donc possible d'y accéder.

Pour vérifier ce que nous avons dit, tapez la commande suivante (les options -it sont inutiles, car nous ne cherchons pas à interagir avec le conteneur, mais juste à la lancer).
```
docker run --rm nginx
```
Puis ouvrez votre navigateur préféré (par exemple Chrome ou Opéra) et tapez dans la barre d'adresse localhost:80 (ou localhost qui revient au même, car dans ce cas le port 80 est utilisé implicitement).

Nous tombons sur une page qui nous indique que le "site est inaccessible".

Comment remédier à ce problème ?

Comment mapper un port dans Docker ?

L'objectif ici est de mapper un port Docker avec un port de la machine locale.

Qu'est-ce que cela signifie ?

Nous allons relier un port du conteneur vers un port de la machine.

Ainsi dans le cas de Nginx, nous pourrions accéder directement à la page web.

Comment procéder ?

C'est très simple. La façon de faire ressemble au mappage de volume.

Pour l'exemple, nous allons mapper le port 80 du conteneur avec le port 9001 de la machine locale.

ℹ️ Il faut obligatoirement utilisé le port 80 pour le conteneur Nginx, car c'est via ce port qu'il fonctionne.

Par contre, on peut le relier à n'importe quel autre port libre de la machine locale.

Nous avons décidé d'utiliser le port 9001, mais il est possible de faire un autre choix.

Pour atteindre ce but, il faut taper la commande suivante.
```
docker run --rm -p 9001:80 nginx
```
Accéder à présent au serveur NGINX via votre navigateur/

http://192.168.50.250:9001

![nginx.png](./images/nginx.png)
