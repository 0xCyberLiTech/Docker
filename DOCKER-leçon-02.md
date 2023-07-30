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

Maintenant que nous sommes dans notre conteneur, nous allons créer un fichier nommé test.sh dans /usr/local/bin.
```
root@9f75a4bd896f:/# cd /usr/local/bin/
root@9f75a4bd896f:/usr/local/bin# touch test.sh
root@9f75a4bd896f:/usr/local/bin# ls -l
total 0
-rw-r--r-- 1 root root 0 Jul 30 12:40 test.sh
root@9f75a4bd896f:/usr/local/bin#
```
Pour resortir du container exécuter la command exit.

À présent, ouvrons une autre fenêtre de notre terminal.

Cette fois-ci nous n'entrerons pas dans le conteneur, mais nous resterons dans notre machine locale. 
Via la commande cd, allons dans le dossier contenant notre dossier data/scripts et data/log.
```
cd ~/Containers/exercice-docker-compose
```
Avec la commande ls, vérifions le contenu de (data/scripts).

Nous avions créer un fichier sur le container vers /usr/local/bin nommé test.sh.
```
ls -l data/scripts/*
```
```
-rw-r--r-- 1 root root 0 30 juil. 14:40 data/scripts/test.sh
```
Le fichier créé dans notre conteneur apparaît bien.

C'est le cas parce que nous avons configuré notre docker-compose.yml de telle sorte que le dossier data.scripts en local soit lié avec le dossier /usr/local/bin de notre conteneur.

💡 D'ailleurs l'inverse est également vrai.

Si je crée un fichier dans data/scripts, il sera automatiquement /usr/local/bin.

## Volume managé.

Pour partir de zéro, nous allons supprimer le conteneur précédemment créé.

Mettons-nous dans le dossier qui contient notre docker-compose.yml et tapons la commande suivante.
```
truncate -s 0 docker-compose.yml
```
Ensuite nous allons nous occuper du docker-compose.yml et supprimer le volume créé précédemment.
```
sudo rm -rf data
```
Après, nous allons ajouter le volume managé. ℹ️ Les choses se feront un peu différemment.
```
version: '3.8'

services:
  my_debian:
    image: debian:latest
    container_name: OS-Debian
    stdin_open: true
    tty: true

volumes:
  test_volume:
```
Cette fois-ci il faut utiliser le mot clé (volumes:) et ensuite créer un volume. 

Par exemple test_volume: comme indiqué ci-dessus. Mais vous pouvez choisir un autre nom.

Quoi faire ensuite ?

Eh bien, tout simplement, la procédure qui suit est la même que pour les volumes mappés.

Nous allons juste changer le nom du dossier dans le conteneur.

```
version: '3.8'

services:
  my_debian:
    image: debian:latest
    container_name: OS-Debian
    stdin_open: true
    tty: true
    volumes:
      - test_volume:/test-volume-dans-le-conteneur

volumes:
  test_volume:
```
Tester le fonctionnement.

Pour tester, nous allons relancer notre conteneur.
```
docker compose up -d
```
Puis nous allons entrer dans le conteneur nouvellement créé, via docker exec -it <id du conteneur> bash.


