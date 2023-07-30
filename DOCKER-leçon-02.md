![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

## DOCKER leçon 02 - Volume.

- Volume mappé
- Volume managé

Exploiter les volumes dans le docker-compose.yml.

Utiliser les volumes dans le fichier docker-compose.yml.

Il est possible d'utiliser des volumes mappés et/ou managés.

## Volume mappé :

Partons de notre docker-compose.yml initial.
```
cd ~/Containers/exercice-docker-compose
```
```
version: '3.8'

services:
  my_debian:
    image: debian:latest
    container_name: OS-Debian
    stdin_open: true
    tty: true
```
Ajoutons des instructions correspondant au volume mappé.
```
version: '3.8'

services:
  my_debian:
    image: debian:latest
    container_name: OS-Debian
    stdin_open: true
    tty: true

    volumes:
      - ./data/scripts:/usr/local/bin
      - ./data/log:/var/log
```
💡 Expliquons ce que nous avons ajouté.

C'est-à-dire volumes et - ./data/scripts:/usr/local/bin
C'est-à-dire volumes et - ./data/log:/var/log

L'indication (./data/scripts) et (./data/log) correspond au nom du dossier local et (:/usr/local/bin) et (:/var/log) au nom du dossier dans le conteneur. 

Ces deux seront liés.

(- ./data/scripts:/usr/local/bin)
(- ./data/log:/var/log)

Le : est un séparateur.

💡 Notez que dans notre docker-compose.yml, ./data/scripts et ./data/log est précédé d'un (./) alors que (/usr/local/bin) et (/var/log) juste d'un (/). 

Cela signifie que (data/scripts) et (data/log) se trouveront dans le même dossier que docker-compose.yml dans notre machine locale et (/usr/local/bin) et (/var/log) seront placés à la racine du conteneur. 

Bien entendu, si nous le désirons, nous pouvons changer l'emplacement et le nom des dossiers. 

Il faudra juste adapter notre docker-compose.yml.

Avant de lancer notre docker-compose.yml, nous allons créer le dossier (data/scripts) et (data/log) dans notre machine locale. Il faudra les placer dans le même dossier ou adapté le chemin.
```
cd ~/Containers/exercice-docker-compose
```
```
mkdir -p data/scripts
mkdir -p data/log
```
![Docker Banner](./images/leçon_01_0E.png)

Nous allons ensuite exécuter le docker-compose.yml.
```
docker compose up -d
```
![Docker Banner](./images/leçon_01_0F.png)

Pour entrer dans le conteneur créé grâce à la commande docker exec -it <id du conteneur> bash.

Vous pouvez trouver cet id grâce au docker ps.

Maintenant que nous sommes dans notre conteneur, nous allons vérifier le conteneur de celui-ci.

