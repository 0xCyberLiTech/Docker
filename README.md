![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

👋 Sommaire des sujet traités :

- 01 - [Installation manuelle de Docker Engine & Docker compose V2.](#balise-01)
- 02 - [Installation manuelle de Portainer.](#balise-02)
- 03 - [Mise à jour manuelle de Portainer.](#balise-03)
- 04 - [Installation automatisée de Portainer.](installation-automatisée-de-portainer.md)
- 05 - [Mise à jour automatisée de Portainer.](mise-à-jour-automatisée-de-portainer.md)








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
