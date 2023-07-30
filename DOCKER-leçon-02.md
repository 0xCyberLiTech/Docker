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
version: '3.8'

services:
  my_debian:
    image: debian:latest
    container_name: OS-Debian
    stdin_open: true
    tty: true
```
