![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

# Installation manuelle de Docker Engine & Docker compose (docker-compose-plugin v2).

Important.

À partir de juillet 2023, Docker-compose V1 a cessé de recevoir des mises à jour.

Il n’est également plus disponible dans les nouvelles versions de Docker Desktop.

Docker compose V2 est inclus dans toutes les versions actuellement prises en charge de Docker Desktop.

# Installation de Docker Engine & Docker-compose-plugin v2.

Pour commencer à utiliser Docker Engine & Docker-compose-plugin v2 sur Debian, assurez-vous de remplir les conditions préalables, puis suivez les étapes d’installation.

Si l'installation de DEBIAN 12 à été effectuée de manière minimale, il faudra installer le paquet 'sudo'.
```
# su - root
# apt install sudo
# usermod -aG sudo cyberlitech
# init 6
```
Configuration et installation des dépôts 'APT'.

Avant d’installer Docker Engine & Docker-compose-plugin v2 pour la première fois sur une nouvelle machine hôte, vous devez configurer les dépôts de Docker.

Ensuite, vous pouvez installer et mettre à jour Docker à partir de ceux-ci.

## Installation des dépendances de Docker Engine.

Mettre à jour votre système :

Pour ce faire, exécutez la commande ci-dessous sur votre shell :
```
sudo apt-get update && sudo apt upgrade -y
```
Pour pouvoir installer Docker, Docker-compose-plugin v2 et tous les paquets requis, nous devons ajouter les dépôts officiel de docker.

Nous allons commencer par installer les paquets requis :
```
sudo apt-get install ca-certificates \
             curl \
             gnupg -y
```
Une fois, cette étape effectuée, poursuivre l'installation.

## Ajouter la clé GPG officielle de Docker Engine:.

Commençons par récupérer la clé GPG qui nous permettra de valider l'installation des paquets.
```
sudo install -m 0755 -d /etc/apt/keyrings
```
```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
```
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
Utilisez la commande suivante pour configurer les nouveaux dépôts vers /etc/apt/sources.list.d/docker.list
```
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
Poursuivre l'installation de docker.

Mettez à jour l’index de la liste des dépôts 'apt'.
```
sudo apt-get update
```
## Installez Docker Engine, containerd, et Docker Compose (docker-compose-plugin v2).

Pour installer la dernière version, exécutez :
```
sudo apt-get install docker-ce \
             docker-ce-cli \
             containerd.io \
             docker-buildx-plugin \
             docker-compose-plugin -y
```
Une fois l’installation terminée, vous devez ajouter votre utilisateur au groupe Docker pour pouvoir exécuter des commandes Docker sans utiliser sudo.
```
sudo usermod -aG docker cyberlitech
```
```
newgrp docker
```
Assurez-vous également que le service Docker Engine est démarré et activé :

Si vous souhaitez que Docker Engine démarre automatiquement avec votre machine Debian, la commande suivante doit être exécutée :
```
sudo systemctl start docker && sudo systemctl enable docker
```
## Docker Engine est-il bien installé ?

Vérifiez si le service est en cours d’exécution :

L'installation des paquets est terminée, mais Docker Engine est-il correctement installé ?
Pour répondre à cette question, vous pouvez regarder le statut de Docker Engine, ce qui sera une première indication si le service est identifié sur la machine.
```
systemctl is-enabled docker
```
```
systemctl is-enabled containerd
```
```
systemctl status docker containerd
```
Docker & Docker compose v2 est à présent installé et opérationnel.

## Test Docker Engine.

Après avoir installé Docker Engine, vous pouvez l’utiliser pour gérer les conteneurs comme vous le souhaitez.

Voici quelques-unes des opérations de base de Docker Engine.

Meilleur moyen de vérifier si Docker Engine est installé, c'est d'exécuter le container nommé "hello-world".
La commande ci-dessous permettra de télécharger l'image de ce container et de l'exécuter.
```
sudo docker run hello-world
```
Lorsque ce container sera exécuté, le message "Hello from Docker!" Sera retourné dans la console.

C'est le signe que les différents composants sont opérationnels et que Docker Engine a pu générer et exécuter le container.

- Quelle est la version de Docker Engine installée ?

Pour finir avec la phase d'installation, sachez qu'à tout moment vous pouvez voir quelle est la version de Docker Engine que vous utilisez grâce à la commande suivante :
```
sudo docker version
```
```
sudo docker compose version
```
