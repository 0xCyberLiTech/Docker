<div align="center">

  <br></br>
  
  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&size=50&duration=6000&pause=1000000000&color=FF0048&center=true&vCenter=true&width=1100&lines=%3EDOCKER_" alt="Titre dynamique DOCKER" />
  </a>
  
  <br></br>

  <h2>Laboratoire numérique pour la cybersécurité, Linux & IT</h2>

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

<!--
Optimisation SEO : astuces, cybersécurité, Linux, sécurité informatique, tutoriels, guides, administration système, scripts Bash, Debian, docker, docker compose, docker grafana, docker zabbix, volume, port, réseau, container, portainer, isolation, log, ressources techniques, étudiants, professionnels, formation, réseau, IT, bonnes pratiques, passionnés.
-->

<div align="center">
  <img src="https://img.icons8.com/fluency/96/000000/cyber-security.png" alt="CyberSec" width="80"/>
</div>

<div align="center">
  <p>
    <strong>Cybersécurité</strong> <img src="https://img.icons8.com/color/24/000000/lock--v1.png"/> • <strong>Linux Debian</strong> <img src="https://img.icons8.com/color/24/000000/linux.png"/> • <strong>Sécurité informatique</strong> <img src="https://img.icons8.com/color/24/000000/shield-security.png"/>
  </p>
</div>

---

## 🚀 À propos & Objectifs

Ce projet propose des solutions innovantes et accessibles en cybersécurité, avec une approche centrée sur la simplicité d’utilisation et l’efficacité. Il vise à accompagner les utilisateurs dans la protection de leurs données et systèmes, tout en favorisant l’apprentissage et le partage des connaissances.

Le contenu est structuré, accessible et optimisé SEO pour répondre aux besoins de :
- 🎓 Étudiants : approfondir les connaissances
- 👨‍💻 Professionnels IT : outils et pratiques
- 🖥️ Administrateurs système : sécuriser l’infrastructure
- 🛡️ Experts cybersécurité : ressources techniques
- 🚀 Passionnés du numérique : explorer les bonnes pratiques

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
<div align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim,python,markdown" alt="Skills" width="440">
  </a>
</div>

<div align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</div>

