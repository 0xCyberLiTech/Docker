![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

## DOCKER leçon 03 - Réseau.

- A) Conteneurs connectés automatiquement
- B) Créer un réseau
- C) Connecter des conteneurs via des réseaux personnalisés
- D) Tester les réseaux
 
Les réseaux dans docker-compose.yml

- A) Conteneurs connectés automatiquement.

Il faut savoir qu'automatiquement les conteneurs de notre fichier, sont connectés entre eux.

Nous allons vérifier cette affirmation.

Pour cela, modifions notre docker-compose.yml. 

En premier, on va supprimer le volume créé précédemment.

Pour manipuler les réseaux, il nous faut plusieurs conteneurs. 

Ce qui est logique, car il faut au minimum deux entités pour pourvoir les connecter.

Nous allons donc créer un autre service dans notre docker-compose.yml.

Nous allons baser ce conteneur sur la même image du service précédente et nous l'appellerons celtak_ubuntu_2. Le service par contre nous le nommerons my_ubuntu_2.

Et pour nous y retrouver, nous allons modifier le nom du premier service et le nom de son conteneur respectivement par celtak_ubuntu_1 et my_ubuntu_1.

Que ce passe-t-il si les noms de deux services sont identiques et les noms de deux conteneurs sont identiques ? Pour les services, un seul sera lancé 😒. Et s'il y a deux conteneurs qui portent le même, il y aura conflit sur les conteneurs 😡.

```
version: '3.8'

services:
  my_ubuntu_1:
    image: celtak/ubuntu-ping-ip
    container_name: celtak_ubuntu_1
    stdin_open: true
    tty: true

  my_ubuntu_2:
    image: celtak/ubuntu-ping-ip
    container_name: celtak_ubuntu_2
    stdin_open: true
    tty: true
```
Lancez les services du fichier grâce à la commande ci-dessous.
```
docker compose up -d
```
![leçon_03_0A.png](./images/leçon_03_0A.png)

Maintenant ouvrez deux fenêtres du terminal et connectez-vous aux deux conteneurs (une connexion par fenêtre).

- Première fenêtre :

(Container - celtak_ubuntu_1)
```
docker exec -it e8bf1b5ec5bd bash
```
(Container - celtak_ubuntu_2)
```
docker exec -it 1d47b93872f3 bash
```
Dans le conteneur (celtak_ubuntu_1) tapez la commande ci-dessous.
```
ping celtak_ubuntu_2
```
![leçon_03_0B.png](./images/leçon_03_0B.png)

- Deuxième fenêtre :

Dans le conteneur (celtak_ubuntu_2) tapez la commande ci-dessous.
```
ping celtak_ubuntu_1
```
![leçon_03_0C.png](./images/leçon_03_0C.png)

Ils réussissent à communiquer ce qui affirme ce que nous avons dit juste avant.

Les conteneurs présents dans un fichier docker-compose.yml sont automatiquement connectés entre eux.

Mais est-il possible de personnalisé les choses ?

- B) Créer un réseau.

La première étape pour utiliser des réseaux personnalisés, consiste à les créer.

Pour cela, il faut utiliser le mot-clé networks:. Ensuite, après tabulation, on pourra insérer le nom du réseau.

Pratiquons ce que nous venons de dire.
```
version: '3'

services:
  my_ubuntu_1:
    image: celtak/ubuntu-ping-ip
    container_name: celtak_ubuntu_1
    stdin_open: true
    tty: true

  my_ubuntu_2:
    image: celtak/ubuntu-ping-ip
    container_name: celtak_ubuntu_2
    stdin_open: true
    tty: true

networks:
  test_networks:
```
Dans notre exemple, nous avons déterminé un réseau personnalisé qui porte le nom test_networks:. 

Mais les deux conteneurs ne sont toujours pas connectés via ce réseau (mais par contre comme nous l'avons vu précédemment, ils le sont automatiquement via le réseau par défaut).

Il est possible de spécifier le type (ou pilotes) du réseau.

Pour l'exemple, nous allons spécifier le réseau bridge.
```
version: '3'

services:
  my_ubuntu_1:
    image: celtak/ubuntu-ping-ip
    container_name: celtak_ubuntu_1
    stdin_open: true
    tty: true

  my_ubuntu_2:
    image: celtak/ubuntu-ping-ip
    container_name: celtak_ubuntu_2
    stdin_open: true
    tty: true

networks:
  test_networks:
    driver: bridge
```
Maintenant nous allons connecter les conteneurs entre eux.

Connecter des conteneurs via des réseaux personnalisés.

Pour bien comprendre le fonctionnement, nous allons utiliser cinq conteneurs.

- Les deux premiers seront reliés par un réseau. 
- Les deux suivants seront connectés par un autre réseau.
- Et enfin le dernier sera seul dans son réseau.

Nous allons utiliser un schéma pour entrevoir ce que nous souhaitons.

![leçon_03_0D.png](./images/leçon_03_0D.png)
