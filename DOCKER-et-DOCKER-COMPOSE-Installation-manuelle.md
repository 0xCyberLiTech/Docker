![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

# - A. Installation manuelle de Docker Engine & Docker compose (docker-compose-plugin v2).

Important.

À partir de juillet 2023, Compose V1 a cessé de recevoir des mises à jour. Il n’est également plus disponible dans les nouvelles versions de Docker Desktop. Compose V2 est inclus dans toutes les versions actuellement prises en charge de Docker Desktop.

<a name="installation-manuelle-de-docker"></a>
Installation de Docker Engine & Docker-compose-plugin v2 sur Debian 12.

Pour commencer à utiliser Docker Engine & Docker-compose-plugin v2 sur Debian, assurez-vous de remplir les conditions préalables, puis suivez les étapes d’installation.

Conditions préalables.

Note :

Si vous utilisez ufw ou firewalld pour gérer les paramètres du pare-feu, sachez que lorsque vous exposez des ports de conteneur à l’aide de Docker, ces ports contournent votre règle de pare-feu. Pour plus d’informations, reportez-vous à Docker et ufw.

Configuration requise pour le système d’exploitation.

Pour installer Docker Engine, vous avez besoin de la version 64 bits de Debian 12, (Stable).

Configuration et installation des dépôts 'APT'.

Avant d’installer Docker Engine & Docker-compose-plugin v2 pour la première fois sur une nouvelle machine hôte, vous devez configurer les dépôts de Docker.

Ensuite, vous pouvez installer et mettre à jour Docker à partir de ceux-ci.

<a name="installer-les-dépendances-de-docker"></a>
### - Installation des dépendances de Docker Engine.

Mettre à jour votre système :

Il est toujours important de travailler avec un système qui soit à jour.

Pour ce faire, exécutez la commande ci-dessous sur votre shell :
```
sudo apt-get update && sudo apt upgrade -y
```
Pour pouvoir installer Docker, Docker-compose-plugin v2 et tous les paquets requis, nous devons ajouter le dépôt officiel de docker à notre système d'exploitation Debian 12.

Nous allons commencer par installer les paquets requis :
```
sudo apt-get install ca-certificates \
             curl \
             gnupg -y
```
Une fois, cette étape effectuée, passer à la suivante.

<a name="ajouter-le-dépôt-officiel-docker"></a>
### Ajoutez la clé GPG officielle de Docker Engine:.

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
<a name="installation-des-paquets-docker"></a>
### Installez Docker Engine, containerd, et Docker Compose (docker-compose-plugin v2).

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
<a name="docker-est-il-bien-installé-"></a>
### Docker Engine est-il bien installé ?

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
Utiliser Docker Engine sur Debian 12 :
Après avoir installé Docker Engine, vous pouvez l’utiliser pour gérer les conteneurs comme vous le souhaitez.

Voici quelques-unes des opérations de base de Docker Engine.

Connectez-vous maintenant en tant qu'utilisateur 'ex : cyberlitech' à l'aide de la commande ci-dessous et vérifiez la configuration.

Ensuite, le meilleur moyen de vérifier si Docker Engine est installé, c'est d'exécuter le container nommé "hello-world".
La commande ci-dessous permettra de télécharger l'image de ce container et de l'exécuter.
```
sudo docker run hello-world
```
Lorsque ce container sera exécuté, le message "Hello from Docker!" Sera retourné dans la console.

C'est le signe que les différents composants sont opérationnels et que Docker Engine a pu générer et exécuter le container.
<a name="quelle-est-la-version-de-docker-installée-"></a>
### Quelle est la version de Docker Engine installée ?

Pour finir avec la phase d'installation, sachez qu'à tout moment vous pouvez voir quelle est la version de Docker Engine que vous utilisez grâce à la commande suivante :
```
sudo docker version
```
```
sudo docker compose version
```
