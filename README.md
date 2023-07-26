![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

👋 Sommaire des sujet traités :

- 01 - [Installation manuelle de Docker Engine & Docker compose V2.](#balise-01)
- 02 - [Installation manuelle de Portainer.](#balise-02)
- 03 - [Mise à jour manuelle de Portainer.](#balise-03)
- 04 - [Installation automatisée de Portainer.](installation-automatisée-de-portainer.md)
- 05 - [Mise à jour automatisée de Portainer.](mise-à-jour-automatisée-de-portainer.md)







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
