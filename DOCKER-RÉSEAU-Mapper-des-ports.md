<div align="center">

  <br></br>
  
  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&size=50&duration=6000&pause=1000000000&color=FF0048&center=true&vCenter=true&width=1100&lines=%3EDOCKER_" alt="Titre dynamique DOCKER" />
  </a>
  
  <br></br>

  <p align="center">
    <em>Réseau : Mapper des ports.</em><br>
    <b>🐳 Conteneurs – 📦 Isolation – 🚀 Déploiement</b>
  </p>

  <p align="center">
    <p align="center">
      <a href="https://0xcyberlitech.github.io/">
        <img src="https://img.shields.io/badge/Portfolio-0xCyberLiTech-181717?logo=github&style=flat-square" alt="🌐 Portfolio" />
      </a>
      <a href="https://github.com/0xCyberLiTech">
        <img src="https://img.shields.io/badge/Profil-GitHub-181717?logo=github&style=flat-square" alt="🔗 Profil GitHub" />
      </a>
      <a href="https://github.com/0xCyberLiTech/Docker/releases/latest">
        <img src="https://img.shields.io/github/v/release/0xCyberLiTech/Docker?label=version&style=flat-square&color=blue" alt="📦 Dernière version" />
      </a>
      <a href="https://github.com/0xCyberLiTech/Docker/blob/main/CHANGELOG.md">
        <img src="https://img.shields.io/badge/📄%20Changelog-Docker-blue?style=flat-square" alt="📄 CHANGELOG Docker" />
      </a>
      <a href="https://github.com/0xCyberLiTech?tab=repositories">
        <img src="https://img.shields.io/badge/Dépôts-publics-blue?style=flat-square" alt="📂 Dépôts publics" />
      </a>
      <a href="https://github.com/0xCyberLiTech/Docker/graphs/contributors">
        <img src="https://img.shields.io/badge/👥%20Contributeurs-cliquez%20ici-007ec6?style=flat-square" alt="👥 Contributeurs Docker" />
      </a>
    </p>
  </p>

</div>

---

### 👨‍💻 **À propos de moi**

> Bienvenue sur le dépôt <strong>0xCyberLiTech</strong>, votre laboratoire numérique pour l'<strong>apprentissage</strong> et la <strong>vulgarisation</strong> de la <strong>cybersécurité</strong>, de l'<strong>administration Linux Debian</strong> et de la <strong>sécurité informatique</strong>.
> Passionné par <strong>Linux</strong>, la <strong>cryptographie</strong>, la <strong>supervision réseau</strong> et les <strong>systèmes sécurisés</strong>, je partage ici des <strong>tutoriels</strong>, <strong>guides pratiques</strong>, <strong>fiches techniques</strong> et <strong>retours d'expérience</strong> pour renforcer vos compétences IT.
>
> 🎯 <strong>Objectif :</strong> Offrir un contenu structuré, accessible et optimisé pour le référencement naturel, destiné aux étudiants, professionnels, administrateurs système, experts en sécurité et curieux du monde numérique.

<p align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim,python,markdown" alt="Skills" width="420">
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

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
