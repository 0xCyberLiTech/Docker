![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

👋 Sommaire des sujet traités :

- 01 - [Installation manuelle de Docker Engine & Docker compose V2.](#balise-01)
- 02 - [Installation manuelle de Portainer.](#balise-02)
- 03 - [Mise à jour manuelle de Portainer.](#balise-03)
- 04 - [Installation automatisée de Portainer.](installation-automatisée-de-portainer.md)
- 05 - [Mise à jour automatisée de Portainer.](mise-à-jour-automatisée-de-portainer.md)

# Installation de Docker Engine, Docker-compose-plugin (Docker compose v2) & Portainer sur DEBIAN 12.

## - A. Installation manuelle de Docker Engine & Docker-compose-plugin v2.
### Prérequis avoir installé auparavant 'SUDO' si celui-ci n'est pas présent.
```
# su - root
# apt install sudo
# usermod -aG sudo cyberlitech
# init 6
```
### I. [Présentation.](#présentation)
### II. [Installation de Docker Engine & Docker-compose-plugin v2 sur Debian 12.](#installation-manuelle-de-docker)
   - . [Installation des dépendances de Docker Engine.](#installer-les-dépendances-de-docker)
   - . [Ajouter le dépôt officiel Docker Engine.](#ajouter-le-dépôt-officiel-docker)
   - . [Installation des paquets Docker Engine.](#installation-des-paquets-docker)
   - . [Docker Engine est-il bien installé ?](#docker-est-il-bien-installé-)
   - . [Quelle est la version de Docker Engine installée ?](#quelle-est-la-version-de-docker-installée-)
### III. [Quelques commandes Docker Engine.](#quelques-commandes-docker)



<a name="quelques-commandes-docker"></a>
### Quelques commandes Docker :

Docker Engine est installé sur notre serveur Debian 12, mais comment faire pour l'utiliser ? 

### Voici quelques commandes utiles qui vous permettront de débuter avec Docker Engine.

- Lister les containers Docker Engine en cours d'exécution.
```
sudo docker ps
```
Le résultat de la commande permet d'avoir une liste avec différentes informations, dont l'ID unique du container, le nom de l'image, et le statut.

- Listez tous les containers Docker enregistrés sur votre machine, peu importe l'état :
```
sudo docker ps -a
```
- Supprimer un container Docker :

À partir d'un ID, il est possible de supprimer un container Docker.
Par exemple, cela peut permettre de supprimer le container "hello-world" (ID 3c745b055853 sur ma machine) car il n'a plus d'intérêt.
```
sudo docker rm 3c745b055853
```
Sur ma machine Debian 12, l'instance Docker dispose de trois images.

- Supprimer une image Docker :

L'image du container "hello-world" peut être supprimée, après avoir arrêté puis supprimé le container associé, via cette commande :
```
sudo docker rmi hello-world
```
- Démarrer un container Docker :

Avec Docker, on peut démarrer un container existant mais arrêté avec "docker start" mais aussi créer un container et le démarrer avec "docker run".

Un container peut-être démarré en l'appelant par son identifiant :
```
sudo docker start d964015967b4
```
- Arrêter un container Docker :

La commande ci-dessus stoppe le container Docker avec l'ID "6108d7c37298" récupéré via la commande "docker ps".
```
sudo docker stop 6108d7c37298
```
- Télécharger une image Docker à partir de Docker Hub :
   
Le site Docker Hub référence les images Docker, et il est possible de télécharger une image à partir de cette source. Voici un exemple où l'image d'un container Docker Apache est téléchargée :
```
sudo docker pull httpd
```
- Supprimer toutes les images en une seule fois.

Pour supprimer toutes les images, il existe une commande simple pour le faire.
```
docker rmi $(docker images -q)
```
- Se connecter au shell d'un container :

List des containers (UP).
```
docker container ls -a
```
Je vais demander à Docker d’exécuter le programme bash en mode interactif, de cette manière, j’aurai un accès complet au conteneur.
```
docker container exec -ti d964015967b4 bash
```
- Quel OS est en place sur ce container :
```
cat /etc/issue
```
### Voici quelques commandes utiles qui vous permettront de débuter avec Docker compose.
```
docker compose -f ./docker-compose.yml pull
```
```
docker compose -f ./docker-compose.yml up -d
```
```
docker compose -f ./docker-compose.yml stop
```
```
docker compose -f ./docker-compose.yml down
```
<a name="balise-02"></a>
## - B. Installation manuelle de Portainer.
### Prérequis avoir installé auparavant sudo si celui-ci n'est pas présent.
```
# su - root
# apt install sudo
# usermod -aG sudo cyberlitech
# init 6
```
Portainer est un conteneur Docker qui a pour but de faciliter l’installation et la gestion de vos autres conteneurs Docker. 
Pour faire simple, il va nous permettre de nous affranchir totalement de la ligne de commande pour déployer des conteneurs, les mettre à jour et gérer leurs paramètres.

Comme tous les conteneurs, son installation est particulièrement simple et ce sera le seul conteneur que nous aurons à créer depuis la ligne de commande.

Pour ce faire, il suffit simplement de lancer cette commande :
```
sudo docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest
```
Si vous voulez là, prise en charge du HTTPS, il suffit de lancer cette commande :
```
sudo docker run -d -p 9443:9443 --name portainer \
   --restart=always \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v portainer_data:/data \
   portainer/portainer-ce:latest \
   --http-disabled
```
Une fois le conteneur lancé, il suffit de se rendre sur http://@IPduserveur:9000 pour accéder à Portainer. 
Les étapes de configuration sont ensuite limpides et vous devriez vous en sortir.

<a name="installation-automatisée-de-portainer"></a>
## - B1. Installation automatisée de Portainer.
### Via un fichier bash.
[Disponible ici](installation-automatisée-de-portainer.md)
```
touch installation-automatisée-de-portainer.sh
```
```
chmod +x installation-automatisée-de-portainer.sh
```
```
sudo ./installation-automatisée-de-portainer.sh
```
<a name="balise-03"></a>
## - C. Mise à jour manuelle de Portainer.
### Prérequis avoir installé auparavant sudo si celui-ci n'est pas présent.
```
# su - root
# apt install sudo
# usermod -aG sudo cyberlitech
# init 6
```
Portainer permettant de mettre à jour facilement nos conteneurs, il peut être tentant de l’utiliser également pour le mettre à jour lui-même. 
Spoiler : c’est une mauvaise idée qui va tout simplement casser votre Portainer. 

Nous allons tout d’abord arrêter le conteneur puis le supprimer. 
Comme nous utilisons un volume, les données importantes du conteneur ne seront pas supprimées.
On télécharge ensuite la dernière image de Portainer, puis nous relançons le conteneur avec les mêmes réglages qu’à l’origine.
```
sudo docker stop portainer
```
```
sudo docker rm portainer
```
```
sudo docker pull portainer/portainer-ce:latest
```
```
sudo docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest
```
Portainer est maintenant à jour et tous ses réglages ont été conservés.

<a name="mise-à-jour-automatisée-de-portainer"></a>
##  - C1. Mise à jour automatisée de Portainer.
### Via un fichier bash.
[Disponible ici](mise-à-jour-automatisée-de-portainer.md)
```
touch mise-à-jour-automatisée-de-portainer.sh
```
```
chmod +x mise-à-jour-automatisée-de-portainer.sh
```
```
sudo ./mise-à-jour-automatisée-de-portainer.sh
```
