![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

## 08 - DOCKER Superviser à l'aide de Zabbix.

Je vais vous expliquer comment superviser un serveur Docker avec Zabbix à l’aide de l’agent 2.

L’agent2 de Zabbix permet de superviser Docker sans avoir besoin d’ajouter de template ou de plugin à l’agent, car il le fait nativement.

Mon environnement :

Un serveur Zabbix installé physiquement (zabbix server).
Un serveur Docker installé physiquement (zabbix server).
Un container Grafana déployé sur Docker (zabbix server).

Configuration de l’hôte dans Zabbix pour superviser Docker.

On est partie, on va commencer par configurer l’hôte dans Zabbix.

Aller dans le menu de gauche sur (Collecte de données), puis cliquer sur hôtes.

Cliquer en haut à droite sur le bouton (Créer un Hôte).

![Docker-01.png](./images/Docker-01.png)

Dans la liste des templates, rechercher Docker 1 et sélectionner Docker by Zabbix agent 2

![Docker-02.png](./images/Docker-02.png)

![Docker-03.png](./images/Docker-03.png)

Il faut intervenir sur le serveur Docker :

Une petite manipulation est à faire pour que l’agent Zabbix puisse collecter les données au niveau du service Docker.

Il faut ajouter l’utilisateur Zabbix qui est utilisé par l’agent, dans le groupe Docker du serveur.

Pour cela entrer la commande suivante :
```
sudo usermod -aG docker zabbix
```
Redémarrer ensuite le service de l’agent Zabbix pour la prise en compte :
```
sudo systemctl  restart zabbix-agent2
```
