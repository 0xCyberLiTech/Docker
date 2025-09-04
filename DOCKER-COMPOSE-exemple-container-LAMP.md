<div align="center">

  <br></br>
  
  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&size=50&duration=6000&pause=1000000000&color=FF0048&center=true&vCenter=true&width=1100&lines=%3EDOCKER_" alt="Titre dynamique DOCKER" />
  </a>
  
  <br></br>

  <h2>Laboratoire numérique pour la cybersécurité, Linux & IT</h2>

  <p align="center">
    <p align="center">
      <a href="https://0xcyberlitech.github.io/">
        <img src="https://img.shields.io/badge/Portfolio-0xCyberLiTech-181717?logo=github&style=flat-square" alt="🌐 Portfolio" />
      </a>
      <a href="https://github.com/0xCyberLiTech">
        <img src="https://img.shields.io/badge/Profil-GitHub-181717?logo=github&style=flat-square" alt="🔗 Profil GitHub" />
      </a>
      <a href="https://github.com/0xCyberLiTech/Docker/releases/latest">
        <img src="https://img.shields.io/github/v/release/0xCyberLiTech/Docker?label=version&style=flat-square&color=blue" alt="📦 Dernière version" />
      </a>
      <a href="https://github.com/0xCyberLiTech/Docker/blob/main/CHANGELOG.md">
        <img src="https://img.shields.io/badge/📄%20Changelog-Docker-blue?style=flat-square" alt="📄 CHANGELOG Docker" />
      </a>
      <a href="https://github.com/0xCyberLiTech?tab=repositories">
        <img src="https://img.shields.io/badge/Dépôts-publics-blue?style=flat-square" alt="📂 Dépôts publics" />
      </a>
      <a href="https://github.com/0xCyberLiTech/Docker/graphs/contributors">
        <img src="https://img.shields.io/badge/👥%20Contributeurs-cliquez%20ici-007ec6?style=flat-square" alt="👥 Contributeurs Docker" />
      </a>
    </p>
  </p>

</div>

<div align="center">
  <img src="https://img.icons8.com/fluency/96/000000/cyber-security.png" alt="CyberSec" width="80"/>
</div>

<div align="center">
  <p>
    <strong>Cybersécurité</strong> <img src="https://img.icons8.com/color/24/000000/lock--v1.png"/> • <strong>Linux Debian</strong> <img src="https://img.icons8.com/color/24/000000/linux.png"/> • <strong>Sécurité informatique</strong> <img src="https://img.icons8.com/color/24/000000/shield-security.png"/>
  </p>
</div>

---

## 🚀 À propos & Objectifs

Ce projet propose des solutions innovantes et accessibles en cybersécurité, avec une approche centrée sur la simplicité d’utilisation et l’efficacité. Il vise à accompagner les utilisateurs dans la protection de leurs données et systèmes, tout en favorisant l’apprentissage et le partage des connaissances.

Le contenu est structuré, accessible et optimisé SEO pour répondre aux besoins de :
- 🎓 Étudiants : approfondir les connaissances
- 👨‍💻 Professionnels IT : outils et pratiques
- 🖥️ Administrateurs système : sécuriser l’infrastructure
- 🛡️ Experts cybersécurité : ressources techniques
- 🚀 Passionnés du numérique : explorer les bonnes pratiques

---

## DOCKER COMPOSE mise en service d'un container LAMP par l'exemple :

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

---

<div align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim,python,markdown" alt="Skills" width="440">
  </a>
</div>

<div align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</div>

