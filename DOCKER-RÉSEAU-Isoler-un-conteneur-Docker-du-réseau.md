<div align="center">

  ![Docker Banner](https://thingsolver.com/wp-content/uploads/docker-cover.png)

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

## DOCKER RÉSEAU - Isoler un conteneur Docker du réseau

Pour atteindre cet objectif, nous allons recourir à none.

Rappel communication entre deux containers :

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

```
docker compose up -d
```

```
docker ps
```

Depuis le container celtak_ubuntu_1

```
docker exec -it (celtak_ubuntu_1) bash
```

```
ip -c addr
```

![ip-1.png](./images/ip-1.png)

```
ping celtak_ubuntu_2
```

![ping-01.png](./images/ping-01.png)

Depuis le container celtak_ubuntu_2

```
docker exec -it (celtak_ubuntu_2) bash
```

```
ip -c addr
```

![ip-2.png](./images/ip-2.png)

```
ping celtak_ubuntu_1
```

![ping-02.png](./images/ping-02.png)

Nous pouvons constater que ces deux containers (celtak_ubuntu_1) et (celtak_ubuntu_2) discutent entre eux.

Arrêter et supprimer ces deux containers

À présent repartons de zéro :

Faisons un test et tapons cette commande dans deux terminaux différents pour avoir deux containers.

Maintenant, nous allons vérifier si les conteneurs sont bien isolés, l'un de l'autre (plus de connexion réseau).

C'est normalement le cas puisque le pilote none a été utilisé.

Pour ce faire nous allons utiliser une commande que nous connaissons désormais très bien.

Il faut la taper sur les deux terminaux.

```
ip -c a
```

Depuis le terminal 01 :

```
docker run --rm -it --network=none celtak/ubuntu-ping-ip
```

```
root@5863762b3801:/#
```

```
ip -c a
```

![ip-c-1.png](./images/ip-c-1.png)

Depuis le terminal 02 :

```
docker run --rm -it --network=none celtak/ubuntu-ping-ip
```

```
root@6ef97c0be0cd:/#
```

```
ip -c a
```

![ip-c-2.png](./images/ip-c-2.png)

Que voyons-nous 🧐?

On s'aperçoit que les deux conteneurs ne sont pas relié par un réseau.

Il n'y a pas d'adresse IP associé.

Pour être certain de cela, nous allons ouvrir une autre fenêtre dans notre terminal.

Un troisième conteneur va etre mis en service.

Ensuite nous allons taper la même commande que précédemment, mais en omettant le paramètre --network=none.

Par conséquent, Docker va attribuer un réseau automatiquement à notre conteneur.

```
docker run --rm -it celtak/ubuntu-ping-ip
```

![ip-c-3.png](./images/ip-c-3.png)

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>
