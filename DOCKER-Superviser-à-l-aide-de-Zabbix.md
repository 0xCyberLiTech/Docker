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

Cliquer en haut à droite (Créer un Hôte).

![Docker-01.png](./images/Docker-01.png)




