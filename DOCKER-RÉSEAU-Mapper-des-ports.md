![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

<div align="center">

  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=32&pause=1000&color=D14A4A&center=true&vCenter=true&width=700&lines=CONTENEURISATION+AVEC+DOCKER;Docker+•+Docker+Compose+•+Portainer;Tutoriels+et+Guides+Pratiques" alt="Typing SVG" />
  </a>

  <p align="center">
    <em>Guides et tutoriels sur la conteneurisation avec Docker.</em><br>
    <b>🐳 Conteneurs – 📦 Isolation – 🚀 Déploiement</b>
  </p>

  [![🔗 Profil GitHub](https://img.shields.io/badge/Profil-GitHub-181717?logo=github&style=flat-square)](https://github.com/0xCyberLiTech)
  [![📦 Dernière version](https://img.shields.io/github/v/release/0xCyberLiTech/Docker?label=version&style=flat-square&color=blue)](https://github.com/0xCyberLiTech/Docker/releases/latest)
  [![📄 CHANGELOG](https://img.shields.io/badge/📄%20Changelog-Docker-blue?style=flat-square)](https://github.com/0xCyberLiTech/Docker/blob/main/CHANGELOG.md)
  [![📂 Dépôts publics](https://img.shields.io/badge/Dépôts-publics-blue?style=flat-square)](https://github.com/0xCyberLiTech?tab=repositories)
  [![👥 Contributeurs](https://img.shields.io/badge/👥%20Contributeurs-cliquez%20ici-007ec6?style=flat-square)](https://github.com/0xCyberLiTech/Docker/graphs/contributors)

</div>

---

### 👨‍💻 **À propos de moi.**

> Bienvenue dans mon **laboratoire numérique personnel** dédié à l’apprentissage et à la vulgarisation de la cybersécurité.  
> Passionné par **Linux**, la **cryptographie** et les **systèmes sécurisés**, je partage ici mes notes, expérimentations et fiches pratiques.  
>  
> 🎯 **Objectif :** proposer un contenu clair, structuré et accessible pour étudiants, curieux et professionnels de l’IT.  
> 🔗 [Mon GitHub principal](https://github.com/0xCyberLiTech)

<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim" alt="Skills" />
  </a>
</p>

---

### 🎯 **Objectif de ce dépôt.**

> Ce dépôt a pour vocation de centraliser un ensemble de notions clés autour de Docker. Il s’adresse aux passionnés, étudiants et professionnels souhaitant mieux comprendre les principes de la conteneurisation,
> apprendre à construire, déployer et gérer des applications avec Docker, et se familiariser avec les concepts et outils essentiels pour optimiser leurs flux de développement et leurs infrastructures.

---

##  DOCKER RÉSEAU - Mapper des ports.

- A) Comment mapper un port dans Docker ?
- B) Explication de "-p 9000:80"

Relier des ports grâce au mappage de ports.

Dans certains conteneurs, il est possible d'accéder à des services grâce au numéro d'un port.

Par exemple, c'est le cas du conteneur Nginx qui est un serveur web.

Comme vous le savez peut-être, nous sommes capables d'atteindre une page web via le port 80 du conteneur (ou de manière générale, le port 80 d'un serveur).

ℹ️ Si vous n'êtes pas familiarisé avec les serveurs web, ce n'est pas grave.

Laissez vous guider et essayez juste de comprendre cette notion de mappage de port.

Cependant, un conteneur est indépendant et nous ne pouvons pas l'atteindre via l'extérieur.

En l'état, il n'est donc possible d'y accéder.

Pour vérifier ce que nous avons dit, tapez la commande suivante (les options -it sont inutiles, car nous ne cherchons pas à interagir avec le conteneur, mais juste à la lancer).
```
docker run --rm nginx
```
Puis ouvrez votre navigateur préféré (par exemple Chrome ou Opéra) et tapez dans la barre d'adresse localhost:80 (ou localhost qui revient au même, car dans ce cas le port 80 est utilisé implicitement).

Nous tombons sur une page qui nous indique que le "site est inaccessible".

Comment remédier à ce problème ?

Comment mapper un port dans Docker ?

L'objectif ici est de mapper un port Docker avec un port de la machine locale.

Qu'est-ce que cela signifie ?

Nous allons relier un port du conteneur vers un port de la machine.

Ainsi dans le cas de Nginx, nous pourrions accéder directement à la page web.

Comment procéder ?

C'est très simple. La façon de faire ressemble au mappage de volume.

Pour l'exemple, nous allons mapper le port 80 du conteneur avec le port 9001 de la machine locale.

ℹ️ Il faut obligatoirement utilisé le port 80 pour le conteneur Nginx, car c'est via ce port qu'il fonctionne.

Par contre, on peut le relier à n'importe quel autre port libre de la machine locale.

Nous avons décidé d'utiliser le port 9001, mais il est possible de faire un autre choix.

Pour atteindre ce but, il faut taper la commande suivante.
```
docker run --rm -p 9001:80 nginx
```
Contrairement aux autres fois, nous n'utilisons pas l'option -it, car nous n'avons pas besoin d'interagir avec le conteneur.

Maintenant ouvrez un navigateur et tapez l'adresse localhost:9001.

Nous accédons à la page web générée par Nginx :

http://192.168.50.250:9001

![nginx.png](./images/nginx.png)

Explication de "-p 9001:80"

L'option -p permet de mapper des ports.

-p comme port.

Ensuite 9001 est le port de la machine locale.

Les : séparent les ports.

Et 80 est le port du conteneur.
