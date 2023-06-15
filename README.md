![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)
## Installation automatisée de Docker sur DEBIAN 11 & 12

## Via un fichier bash
[Disponible ici](install-docker.sh)
```
touch install-docker.sh
chmod +x install-docker.sh
sudo ./install-docker.sh
```
## Installation manuellement de Portainer sur DEBIAN 11 & 12
### Prérequis avoir installé au paravant sudo si celui-ci n'est pas présent.
```
su - root
apt install sudo
adduser mmalet sudo
init 6
```

### I. [Présentation.](#présentation)
### II. [Installer Docker sur Debian 11 & 12.](#installer-docker)
   - A. [Installer les dépendances de Docker.](#installer-les-dépendances-de-docker)
   - B. [Ajouter le dépôt officiel Docker.](#ajouter-le-dépôt-officiel-docker)
   - C. [Installation des paquets Docker.](#installation-des-paquets-docker)
   - D. [Docker est-il bien installé ?](#docker-est-il-bien-installé-)
   - E. [Quelle est la version de Docker installée ?](#quelle-est-la-version-de-docker-installée-)
### III. [Quelques commandes Docker.](#quelques-commandes-docker)

<a name="présentation"></a>
## Présentation.
Dans ce tutoriel, nous allons voir comment installer Docker sur Debian 11 afin d'utiliser ses premiers containers sous Linux !
Cette installation pas-à-pas repose sur la méthode officielle décrite dans la documentation de Docker.
Au-delà des dépendances que nous allons installer et de Docker en lui-même, les ressources de votre machine seront déterminantes pour exécuter plus ou moins de containers Docker.

L'utilisation d'un container reste très pratique pour tester rapidement un logiciel sans affecter la machine hôte, en phase de développement, etc.
Un container Docker va permettre d'empaqueter facilement des applications afin de les rendre utilisables sur différentes plateformes.
De nos jours, c'est une technologie populaire et appréciée et que l'on utilise aussi bien on-premise que sur les environnements Cloud.

Pour fonctionner, Docker s'appuie sur différents composants qu'il est important de connaître :

- Docker Engine ou Docker Daemon correspondant au processus qui fait tourner Docker sur le système, en charge de la génération et l'exécution des containers
- Docker Registry est un emplacement de stockage pour héberger les images de containers Docker (il peut être public ou privé)
- Docker Image correspondant à un fichier qui contient la définition d'un container Docker (dépendances, configuration, etc.)
- Docker Client correspondant à l'utilitaire en ligne de commande qui va permettre de gérer les containers (commande "docker")
- Docker Container correspondant aux containers en eux-mêmes, tout en sachant qu'une image peut permettre de créer plusieurs containers avec chacun un identifiant unique

La documentation de Docker est disponible à cette adresse : docs.docker.com

<a name="installer-docker"></a>
## Installer Docker sur Debian 11 & 12
<a name="installer-les-dépendances-de-docker"></a>
### Installer les dépendances de Docker.

Premièrement, nous devons installer les dépendances nécessaires au bon fonctionnement de Docker. Commençons par mettre à jour le cache des paquets :
```
sudo apt-get update && sudo apt upgrade -y
```
Puis, exécutez la commande ci-dessous pour installer les paquets :
```
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
```
Une fois cette étape effectuée, passez à la suite.

-----------------------------------------
<a name="ajouter-le-dépôt-officiel-docker"></a>
### Ajouter le dépôt officiel Docker.

Deuxièmement, nous devons ajouter le dépôt officiel de Docker à notre machine Debian afin de pouvoir récupérer les sources. Commençons par récupérer la clé GPG qui nous permettra de valider les paquets récupérés depuis le dépôt Docker :
```
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
Ensuite, on ajoute le dépôt Docker à la liste des sources de notre machine :
```
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
```
Pour finir, nous devons mettre à jour le cache des paquets pour prendre en compte les paquets de ce nouveau dépôt :
```
sudo apt-get update
```
Nous allons pouvoir passer à l'installation de Docker.

-----------------------------------------
<a name="installation-des-paquets-docker"></a>
### Installation des paquets Docker.

Troisièmement, c'est l'installation de Docker qui doit être réalisée.
Trois paquets sont à installer sur notre hôte pour bénéficier de l'ensemble des composants. Voici la commande à exécuter :
```
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
```
Si vous souhaitez que Docker démarre automatiquement avec votre machine Debian, la commande suivante doit être exécutée :
```
sudo systemctl enable docker
```

-----------------------------------------
<a name="docker-est-il-bien-installé-"></a>
### Docker est-il bien installé ?

L'installation des paquets est terminée, mais Docker est-il correctement installé ?
Pour répondre à cette question, vous pouvez regarder le statut de Docker, ce qui sera une première indication si le service est identifié sur la machine.
```
sudo systemctl status docker.service
```
Ensuite, le meilleur moyen de vérifier si Docker est installé, c'est d'exécuter le container nommé "hello-world".
La commande ci-dessous permettra de télécharger l'image de ce container et de l'exécuter.
```
sudo docker run hello-world
```
Lorsque ce container sera exécuté, le message "Hello from Docker!" sera retourné dans la console.
C'est le signe que les différents composants sont opérationnels et que Docker a pu générer et exécuter le container.

-----------------------------------------
<a name="quelle-est-la-version-de-docker-installée-"></a>
### Quelle est la version de Docker installée ?

Pour finir avec la phase d'installation, sachez qu'à tout moment vous pouvez voir quelle est la version de Docker que vous utilisez grâce à la commande suivante :
```
sudo docker version
```

<a name="quelques-commandes-docker"></a>
## Quelques commandes Docker
Docker est installé sur notre serveur Debian 11, mais comment faire pour l'utiliser ? Pour finir, nous allons voir quelques commandes utiles qui vous permettront de débuter avec Docker.

 - Lister les containers Docker en cours d'exécution
```
sudo docker ps
```
Le résultat de la commande permet d'avoir une liste avec différentes informations dont l'ID unique du container, le nom de l'image, et le statut.

 - Lister tous les containers Docker enregistrés sur votre machine, peu importe l'état.
```
sudo docker ps -a
```
 - Supprimer un container Docker.
A partir d'un ID, il est possible de supprimer un container Docker.
Par exemple, cela peut permettre de supprimer le container "hello-world" (ID 3c745b055853 sur ma machine) car il n'a plus d'intérêt.
```
sudo docker rm 3c745b055853
```
Sur ma machine Debian 11, l'instance Docker dispose de trois images.

 - Supprimer une image Docker
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
Le site Docker Hub référence les images Docker, et il est possible de télécharger une image à partir de cette source.
Voici un exemple où l'image d'un container Docker Apache est téléchargée :
```
sudo docker pull httpd
```
## Installation automatisée de Portainer sur DEBIAN 11 / 12

## Via un fichier bash
[Disponible ici](install-portainer.sh)

touch install-portainer.sh
chmod +x install-portainer.sh
sudo ./install-portainer.sh

## Installation manuellement de Portainer sur DEBIAN 11 / 12

## Prérequis avoir installé au paravant sudo si celui-ci n'est pas présent.

```
su - root
apt install sudo
adduser mmalet sudo
init 6
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

Une fois le conteneur lancé, il suffit de se rendre sur http://@IPduserveur:9000 pour accéder à Portainer. 
Les étapes de configuration sont ensuite limpides et vous devriez vous en sortir.

## Via un fichier bash
[Disponible ici](install-portainer.sh)
