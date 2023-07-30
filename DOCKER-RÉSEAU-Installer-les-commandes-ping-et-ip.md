![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

## DOCKER Réseau - Installer les commandes ping et ip

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
