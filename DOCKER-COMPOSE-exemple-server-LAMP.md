![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

## DOCKER COMPOSE mise en service d'un serveur LAMP par l'exemple :

Exemple :

Sur la machine hôte, créer un sous dossier pour y construire votre stack (Labo-02-Lamp).

```
cd ~
```
```
mkdir -p Containers/Labo-02-Lamp/
```
```
cd Containers/Labo-02-Lamp/
```
Il faut maintenant créer le fichier docker-compose.yml à l'interrieur de celui-ci.
```
touch docker-compose.yml
```
```
nano docker-compose.yml
```
Copier le code ci-dessous dans le fichier docker-compose.yml
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
      MYSQL_DATABASE: test
      MYSQL_USER: user 
      MYSQL_PASSWORD: user
      MYSQL_ALLOW_EMPTY_PASSWORD: 'no'
      MYSQL_ROOT_PASSWORD: root

  web:
    image: "php:latest"
    container_name: apache2
    restart: always
    depends_on: ['db']
    ports: ['80:80']
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
    ports: ['1200:80']
    links: ['db:db']

    environment:
      - MYSQL_DB_HOST=db
      - MYSQL_USER=user 
      - MYSQL_PASSWORD=user

volumes:
  db_data: {}
```
Je vous recommande de changer les identifiants et mots de passe de configuration MYSQL.
Ces identifiants ne sont qu'un exemple et ne reflètent pas du tout un accès sécurisé.

Puis toujours depuis votre dossier Lab-02-Lamp où se trouve votre fichier docker-compose.yml, exécuter la commande suivante :
```
docker-compose up -d
```
```
[+] Running 38/21
 ✔ phpmyadmin 18 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                                                                      
 ✔ db 8 layers [⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                                                                                            
 ✔ web 9 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled       
```
```
[+] Running 4/4
 ✔ Network labo-02-lamp_default  Created                                                                                                                                       
 ✔ Container mariadb             Started                                                                                                                                       
 ✔ Container phpmyadmin          Started                                                                                                                                       
 ✔ Container apache2             Started  
```
Sur notre machine hôte, nous retrouverons les dossier partagés suivant en provenance de notre stack Labo-02-Lamp.
```
ls -al
```
```
drwxr-xr-x 2 root   root   4096 29 juil. 11:36 backups
drwxr-xr-x 2 root   root   4096 29 juil. 11:36 www
```
```
- ./backups:/backups
```
Décomposition de cette ligne ci-dessus :

(./backup) - Point de motage sur la machine hôte (~Containers/Labo-02-Lamp/backup).
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

Se connecter au container (47f240eb783d) depuis la machine hôte.
```
docker exec -it 47f240eb783d bash
```
```
root@47f240eb783d:/#
```
Nous pouvons maintenant nous connecter à la console du serveur MySQL.
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
Lister les bases de données en place actuellement.
```
MariaDB [(none)]> show databases;
```
```
+--------------------+
| Database           |
+--------------------+
| test               |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.001 sec)

MariaDB [(none)]> exit;
```
Sortir du serveur MySQL.
```
mariadb -u user -p
```
Vous pouvez également vous connecter avec votre compte (user).
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
Lister les bases de données en place actuellement.
```
+--------------------+
| Database           |
+--------------------+
| test               |
| information_schema |
+--------------------+
2 rows in set (0.001 sec)

MariaDB [(none)]>exit;
```
Nous pouvons également accéder à PHPMYADMIN :

http://192.168.50.250:8181

![phpmyadmin.png](./images/phpmyadmin.png)

Si vous avez mis en place un firewall géré à l'aide de UFW

N'oubliez pas d'ouvrir les ports appropriés :
```
ufw status numbered
```
```
     To                         Action      From
     --                         ------      ----
[ 1] 80/tcp                     ALLOW IN    192.168.50.0/24
[ 2] 443/tcp                    ALLOW IN    192.168.50.0/24
[ 3] 10050/tcp                  ALLOW IN    192.168.50.0/24
[ 4] 9443/tcp                   ALLOW IN    192.168.50.0/24
[ 5] 9392/tcp                   ALLOW IN    192.168.0.0/16
[ 6] 8181/tcp                   ALLOW IN    192.168.50.0/24
```
