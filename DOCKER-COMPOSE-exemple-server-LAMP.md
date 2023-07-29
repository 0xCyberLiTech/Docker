Installer Lamp avec Docker Compose :

Exemple :

Sur la machine hôte, créer un sous dossier pour y construire votre stack (Labo-02-Lamp).

```
cd ~
mkdir -p Containers/Labo-02-Lamp/
cd Containers/Labo-02-Lamp/
```

Il faut maintenant créer le fichier docker-compose.yml à l'interrieur du sous dossier (Labo-02-Lamp).

```
version: '3.9'

services:
  db:
    image: mariadb:latest
    container_name: mariadb
    restart: always

    volumes:
      - db_data:/var/lib/mysql
      - ./backups:/backups

    environment:
      MYSQL_DATABASE: db_test
      MYSQL_USER: user
      MYSQL_PASSWORD: user
      MYSQL_ALLOW_EMPTY_PASSWORD: 'no'
      MYSQL_ROOT_PASSWORD: root

  web:
    image: "php:latest"
    container_name: apache2
    restart: always
    depends_on: ['db']
    ports: ['8585:80']
    links: ['db:db']

    volumes:
      - './www:/var/www/html'

    environment:
      MYSQL_DB_HOST: db
      MYSQL_DATABASE: test
      MYSQL_USER: user
      MYSQL_PASSWORD: user

  phpmyadmin:
    image: phpmyadmin/phpmyadmin:latest
    container_name: phpmyadmin
    restart: always
    depends_on: ['db']
    ports: ['8181:80']
    links: ['db:db']

    environment:
      - MYSQL_DB_HOST=db
      - MYSQL_USER=user
      - MYSQL_PASSWORD=user

volumes:
  db_data: {}
```


Sur notre machine hôte nous retrouverons les dossier partagés suivant en provenance de notre stack Labo-02-Lamp.
```
ls -al
```
```
drwxr-xr-x 2 root   root   4096 29 juil. 11:36 backups
-rw-r--r-- 1 mmalet mmalet  949 29 juil. 11:34 docker-compose.yml
drwxr-xr-x 2 root   root   4096 29 juil. 11:36 www

```
