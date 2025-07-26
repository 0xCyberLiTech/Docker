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

## DOCKER quelques commandes utiles.

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

Autres commandes :

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

---

**Mise à jour :** Juillet 2025

---

<p align="center">
  <b>🔒 Un guide proposé par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> • Pour des tutoriels accessibles à tous. 🔒</b>
</p>

