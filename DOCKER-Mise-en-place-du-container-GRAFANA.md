![grafana-dashboard-1.png](./images/grafana-dashboard-1.png)

## DOCKER - Mise en place du container GRAFANA :

Intégration de Zabbix à Grafana :

Le plugin Grafana-Zabbix peut être installé sur Grafana pour visualiser les données de Zabbix avec Grafana.

Vous pouvez également l’utiliser pour créer des tableaux de bord Grafana étonnants en utilisant les données de Zabbix.

Je vais également vous montrer comment ajouter un serveur Zabbix comme source de données sur Grafana.

Je vais également vous montrer comment démarrer avec la visualisation de données Grafana avec la source de données Zabbix.

Alors, commençons.

Notre serveur Grafana est issu d'un container en production depuis Docker.

Je joins donc le fichier docker-compose.yml.
```
version: '3.8'
services:
  grafana:
    image: grafana/grafana-enterprise:latest
    container_name: grafana
    restart: unless-stopped
    environment:
      # increases the log level from info to debug
      - GF_LOG_LEVEL=debug
    ports:
      - '3000:3000'
    volumes:
      - 'grafana_storage:/var/lib/grafana'
volumes:
  grafana_storage: {}
```
Exécuter la commande suivante :
```
docker compose up -d
```
L'accès l'interface de Grafana se fait depuis l'url http://192.168.50.250:3000/

Passons à l'installation du plugin Grafana Zabbix.

Pour ajouter Zabbix en tant que source de données Grafana, vous devez avoir le plugin Grafana-Zabbix installé sur l’ordinateur sur lequel Grafana est installé.

Pour installer le plugin Grafana-Zabbix sur l’ordinateur sur lequel Grafana est installé, exécutez la commande suivante :

```
sudo grafana-cli plugins install alexanderzobnin-zabbix-app     
```
Le plugin Grafana-Zabbix doit être installé.

Pour que les modifications prennent effet, redémarrez le service systemd grafana-server avec la commande suivante :
```
sudo systemctl restart grafana-server.service
```
Activation du plugin Grafana-Zabbix.

Une fois le plugin Grafana Zabbix installé, vous devez l’activer à partir de l’interface Web du tableau de bord Grafana.

Pour accéder à l’interface Web de Grafana, vous devez connaître l’adresse IP de l’ordinateur sur lequel Grafana est installé. Dans mon cas, l’adresse IP de l’ordinateur sur lequel j’ai installé Grafana est 192.168.50.250.

Ce sera différent pour vous. Alors, assurez-vous de le remplacer par le vôtre à partir de maintenant.
```
hosname -I
```
Pour accéder à l’interface Web de Grafana, visitez http://192.168.50.250:3000 depuis votre navigateur Web préféré.

Identifiants par défaut admin / admin.

Depuis l’interface Web de Grafana, cliquez sur Paramètres > Plugins comme indiqué dans la capture d’écran ci-dessous.

![grapfana-02.png](./images/grafana-02.png)

Recherchez le plugin Zabbix et cliquez sur le plugin Zabbix à partir du résultat de la recherche comme indiqué dans la capture d’écran ci-dessous.

![grapfana-03.png](./images/grafana-03.png)

Cliquez sur Activer.

![grapfana-04.png](./images/grafana-04.png)

Le plugin Grafana Zabbix doit être activé.

![grapfana-05.png](./images/grafana-05.png)

Ajout de la source de données Zabbix sur Grafana.

Une fois le plugin Grafana Zabbix activé, vous pouvez ajouter votre serveur Zabbix en tant que source de données sur Grafana.

Pour ajouter votre serveur Zabbix en tant que source de données sur Grafana, cliquez sur Configuration > Sources de données de l’interface Web de Grafana comme indiqué dans la capture d’écran ci-dessous.

![grapfana-06.png](./images/grafana-06.png)

Cliquez sur Ajouter une source de données.

![grapfana-07.png](./images/grafana-07.png)

Recherchez la source de données Zabbix et cliquez dessus comme indiqué dans la capture d’écran ci-dessous.

![grapfana-08.png](./images/grafana-08.png)

Vous devriez voir la page suivante.

Vous devez ajouter les informations de votre serveur Zabbix ( Admin / zabbix), si vous n'avez pas changé le mot de passe par défaut.

Concernant cette installation via ce container, saisir : http://192.168.50.250:8080/api_jsonrpc.php

![grapfana-2023.png](./images/grafana-2023.png)

Pour ajouter votre serveur Zabbix en tant que source de données sur Grafana, vous devez connaître l’adresse IP de votre serveur Zabbix.

Dans mon cas, l’adresse IP de mon serveur Zabbix est 192.168.50.250. 

Ce sera différent pour vous.

Alors, assurez-vous de le remplacer par le vôtre à partir de maintenant.
```
hostanme -I
```
Une fois que vous connaissez l’adresse IP de votre serveur Zabbix, tapez l’URL suivante dans la section URL de l’assistant de source de données Grafana Zabbix.

![grapfana-10.png](./images/grafana-10.png)

Faites défiler un peu vers le bas et tapez le nom d’utilisateur de connexion et le mot de passe de votre serveur Zabbix dans la section Nom d’utilisateur et Mot de passe respectivement.

![grapfana-11.png](./images/grafana-11.png)

Une fois que vous avez terminé, cliquez sur Enregistrer et tester comme indiqué dans la capture d’écran ci-dessous.

![grapfana-12.png](./images/grafana-12.png)

Votre serveur Zabbix doit être ajouté à Grafana en tant que source de données.

![grapfana-13.png](./images/grafana-13.png)

Prochaine étape, surveillance de Zabbix avec Grafana.

Il faut se rendre vers : 

Noubliez pas de mettre en place vos règles de firewall ( UFW ).

```
[ 1] 80/tcp                     ALLOW IN    192.168.50.0/24
[ 2] 443/tcp                    ALLOW IN    192.168.50.0/24
[ 3] 2234/tcp                   ALLOW IN    192.168.50.0/24
[ 4] 10050/tcp                  ALLOW IN    192.168.50.0/24 # Zabbix
[ 5] 9443/tcp                   ALLOW IN    192.168.50.0/24 # Portainer
[ 6] 9392/tcp                   ALLOW IN    192.168.0.0/16
[ 7] 8181/tcp                   ALLOW IN    192.168.50.0/24
[ 8] 8585/tcp                   ALLOW IN    192.168.50.0/24
[ 9] 8086/tcp                   ALLOW IN    192.168.50.0/24
[10] 1883/tcp                   ALLOW IN    192.168.50.0/24
[11] 25/tcp                     ALLOW IN    192.168.50.0/24
[12] Anywhere                   ALLOW IN    172.21.0.0/16 # Docker
[13] Anywhere                   ALLOW IN    172.22.0.0/16 # Docker
[14] 3000/tcp                   ALLOW IN    192.168.0.0/16 # Grafana
```
Il faut ouvrir le port 3000 pourGrafana, mais cela ne suffit pas si Grafana est installé dans un container.
```
[12] Anywhere                   ALLOW IN    172.21.0.0/16 # Docker
[13] Anywhere                   ALLOW IN    172.22.0.0/16 # Docker
```
