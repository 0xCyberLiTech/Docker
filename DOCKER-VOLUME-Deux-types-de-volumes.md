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

## DOCKER VOLUME - Deux types de volumes.

Nous aborderons deux façons d'utiliser les volumes.

Et pour bien comprendre ce que nous faisons nous utiliserons deux expressions.

Dans ce cadre, nous allons mapper des volumes (première expression) ou manager des volumes (deuxième expression).

Pour ces deux types, nous expliquerons les différences et les avantages.

## Mapper un volume.

Lorsqu'on utilise le mappage de volume, le dossier dans notre ordinateur local prend le dessus sur le dossier du conteneur.

Par exemple, si nous avons un dossier dans notre machine qui s'appelle /test avec un fichier à l'intérieur dont le nom est index.html et que nous le mappons au dossier /home de notre conteneur Ubuntu (dans notre conteneur le dossier /home ne contient à la base rien du tout), le dossier /home contiendra également le fichier index.html.

![docker-mapper-volume.png](./images/docker-mapper-volume.png)

Et s'il y avait eu d'autres fichiers dans le dossier /home, ils disparaîtront, car ils n'existeraient pas dans le dossier /test.

Autre chose, si je modifie le fichier index.html dans le conteneur et qu'après je le détruise, le contenu de ce fichier apparaîtra modifié dans ma machine locale.

Le contrairement est également vrai ! Si je modifie ce fichier en local, il le sera également automatiquement dans le conteneur.

## Manager un volume.

Par contre, lorsque l'on crée un volume managé, c'est le dossier du conteneur qui prend le dessus.

Cependant, la façon de faire dans ce genre de cas est différente par rapport aux volumes mappés.

En effet, il faut obligatoirement créer un volume avec un nom (grâce à une commande Docker) pour ensuite le relier à un dossier du conteneur.

![docker-manager-volume.png](./images/docker-manager-volume.png)

Cela peut paraître compliqué, mais en pratiquant plus tard, les choses seront plus claires.

---

<div align="center">
  <a href="https://github.com/0xCyberLiTech" target="_blank" rel="noopener">
    <img src="https://skillicons.dev/icons?i=linux,debian,bash,docker,nginx,git,vim,python,markdown" alt="Skills" width="440">
  </a>
</div>

<div align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</div>

