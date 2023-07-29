![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

## Installer un serveur LAMP avec Docker Compose :

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
Je vous recommande de changer les identifiants et mots de passe de configuration MYSQL.

Puis toujours depuis votre dossier Lab-02-Lamp où se trouve votre fichier docker-compose.yml, exécuter la commande suivante :
```
docker-compose up -d
```
```
[+] Running 38/21
 ✔ phpmyadmin 18 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                                                                             7.7s
 ✔ db 8 layers [⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                                                                                               14.5s
 ✔ web 9 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled       
```
```
[+] Running 4/4
 ✔ Network labo-02-lamp_default  Created                                                                                                                                        0.1s
 ✔ Container mariadb             Started                                                                                                                                        0.6s
 ✔ Container phpmyadmin          Started                                                                                                                                        0.7s
 ✔ Container apache2             Started  
```
Sur notre machine hôte, nous retrouverons les dossier partagés suivant en provenance de notre stack Labo-02-Lamp.
```
ls -al
```
```
drwxr-xr-x 2 root   root   4096 29 juil. 11:36 backups
-rw-r--r-- 1 mmalet mmalet  949 29 juil. 11:34 docker-compose.yml
drwxr-xr-x 2 root   root   4096 29 juil. 11:36 www
```
```
- ./backups:/backups
```
Décomposition de cette ligne ci-dessus :

(./backup) - Point de motage sur la ma chine hôte (~Containers/Labo-02-Lamp/backup).
(/backups) - Dossier se trouvant dans le container mariadb à la racine.

Identifions notre stack qui se compose de trois containers.
```
✔ Network labo-02-lamp_default     Created 

✔ Container mariadb                Started                                                                                                                                     
✔ Container phpmyadmin             Started                                                                                                                                     
✔ Container apache2                Started
```
```
docker ps
```
```
abc2bad8dbc6   phpmyadmin/phpmyadmin:latest     "/docker-entrypoint.…"                  phpmyadmin
773142035e14   php:latest                       "docker-php-entrypoi…"                  apache2
47f240eb783d   mariadb:latest                   "docker-entrypoint.s…"                  mariadb
```
Récupérer l'ID du container mariadb, (47f240eb783d).

Se connecter au container (47f240eb783d).
```
docker exec -it 47f240eb783d bash
```
```
root@47f240eb783d:/#
```
Nous pouvons maintenant nous connecter à la console MySQL.
```
mariadb -u root -p
```
```
root@47f240eb783d:/# mariadb -u root -p
Enter password:
```
```
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 11.0.2-MariaDB-1:11.0.2+maria~ubu2204 mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```
```
MariaDB [(none)]> show databases;
```
```
+--------------------+
| Database           |
+--------------------+
| db_test            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.001 sec)

MariaDB [(none)]> exit;
```
```
mariadb -u user -p
```
```
root@47f240eb783d:/# mariadb -u user -p
Enter password:
```
```
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 4
Server version: 11.0.2-MariaDB-1:11.0.2+maria~ubu2204 mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```
```
MariaDB [(none)]> show databases;
```
```
MariaDB [(none)]> show databases;
```
```
+--------------------+
| Database           |
+--------------------+
| db_test            |
| information_schema |
+--------------------+
2 rows in set (0.001 sec)

MariaDB [(none)]>exit;
```
Nous pouvons également accéder à PHPMYADMIN :

http://192.168.50.250:8181

![phpmyadmin.png](phpmyadmin.png)
