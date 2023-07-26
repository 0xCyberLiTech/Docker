# DOCKER quelques commandes utiles.

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
