<div align="center">

  <br></br>
  
  <a href="https://github.com/0xCyberLiTech">
    <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&size=50&duration=6000&pause=1000000000&color=FF0048&center=true&vCenter=true&width=1100&lines=%3EDOCKER_" alt="Titre dynamique DOCKER" />
  </a>
  
  <br></br>

  <h2>Laboratoire numérique pour la cybersécurité, Linux & IT.</h2>

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

<div align="center">
  
## À propos & Objectifs.

</div>

Ce projet propose des solutions innovantes et accessibles en cybersécurité, avec une approche centrée sur la simplicité d’utilisation et l’efficacité. Il vise à accompagner les utilisateurs dans la protection de leurs données et systèmes, tout en favorisant l’apprentissage et le partage des connaissances.

Le contenu est structuré, accessible et optimisé SEO pour répondre aux besoins de :
- 🎓 Étudiants : approfondir les connaissances
- 👨‍💻 Professionnels IT : outils et pratiques
- 🖥️ Administrateurs système : sécuriser l’infrastructure
- 🛡️ Experts cybersécurité : ressources techniques
- 🚀 Passionnés du numérique : explorer les bonnes pratiques

---

## Installation manuelle de Docker Engine & Docker compose (docker-compose-plugin v2) sur DEBIAN 12.
### Important.

À partir de juillet 2023, Docker-compose V1 a cessé de recevoir des mises à jour.

Il n’est également plus disponible dans les nouvelles versions de Docker Desktop.

Docker compose V2 est inclus dans toutes les versions actuellement prises en charge de Docker Desktop.

Nouvelle syntaxe concerant Docker compose :

- Avant - docker-compose
- Après - docker compose

## Installation de Docker Engine & Docker-compose-plugin v2.

Installation de Docker sur Debian 12.

Il existe plusieurs façons d’installer Docker sur votre système Debian 12.

Il est disponible dans les dépôts officiels de Debian, où il peut être facilement installé avec une seule commande APT.

Cependant, un inconvénient de cette approche est que la version disponible n’est pas toujours la plus récente.

Pour cette raison, je vais vous montrer comment installer Docker sur Debian 12 à partir du dépôt officiel de Docker.

Cette approche garantit que vous obtenez toujours la dernière version à jour et que vous recevrez automatiquement toutes les futures mises à jour logicielles dès qu’elles seront disponibles.

Rappel sur la commande sudo, si celle-ci n'est pas installée :

```
su - root
apt install sudo
usermod -aG sudo username
init 6
```

## Étape 1 : Installer les composants requis.

Tout d’abord, exécutez les deux commandes ci-dessous pour mettre à jour l’index du package et installer les composants requis nécessaires pour ajouter et utiliser un nouveau référentiel HTTPS.

```
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg
```
## Étape 2: Ajouter la clé GPG Repo de Docker.
Ensuite, importez la clé du dépôt Docker GPG dans votre système Debian.

Cette fonction de sécurité garantit l’authenticité du logiciel que vous installez.

```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
```
## Étape 3 : Ajouter le dépôt Docker à Debian 12.

Après avoir importé les clés GPG, nous ajouterons le dépôt officiel Docker à notre système Debian 12.

Cela implique que le package de mise à jour sera disponible avec le reste des mises à jour régulières de votre système si une nouvelle version est publiée.
```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
Comme pour la commande précédente, son exécution ne produit aucune sortie.

Ensuite, actualisez la liste des packages.
```
sudo apt update
```
```
Réception de :2 https://download.docker.com/linux/debian bookworm InRelease [43,3 kB]
Réception de :5 https://download.docker.com/linux/debian bookworm/stable amd64 Packages [11,9 kB]
```
Nous pouvons voir que notre nouveau référentiel Docker est maintenant disponible et prêt à être utilisé.

## Étape 4 : Installer Docker sur Debian 12 (Bookworm).

Pour installer la dernière version de Docker sur Debian, exécutez la commande ci-dessous.
```
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin
```
Cela installe les composants Docker suivants :

- docker-ce : Le moteur Docker lui-même.
- docker-ce-cli : Un outil de ligne de commande qui vous permet de parler au démon Docker.
- containerd.io : runtime de conteneur qui gère le cycle de vie du conteneur.
- docker-buildx-plugin : Un plugin CLI qui étend la version Docker avec de nombreuses nouvelles fonctionnalités.

C’est tout! Docker devrait maintenant être installé; Le service a démarré et activé pour démarrer automatiquement au démarrage.

En outre, vous pouvez vérifier l’état du service Docker à l’aide des éléments suivants :
```
sudo systemctl is-active docker
```
## Étape 5 : Vérifier l’installation de Docker.

Vérifions maintenant si tout fonctionne correctement avec notre nouvelle installation Docker.
```
sudo docker version
```
```
sudo docker compose version
```
Nous allons exécuter une application simple appelée « hello-world ».
```
sudo docker run hello-world
```
Activation des utilisateurs non root pour exécuter des commandes Docker.

Jusqu’à présent, nous avons installé avec succès Docker sur votre système Debian 12.

Toutefois, seuls les utilisateurs root et sudo disposant de privilèges sudo qui peuvent exécuter des commandes Docker par défaut.

Ainsi, pour exécuter des commandes Docker en tant qu’utilisateur non root, vous devez ajouter votre utilisateur au groupe « docker ».

Pour ce faire, tapez ce qui suit :

```
sudo usermod -aG docker ${USER}
```
Dans la commande ci-dessus, ${USER} est une variable d’environnement qui contient votre nom d’utilisateur.

Pour demander la nouvelle adhésion au groupe, redémarrez votre système Debian.

Vous pouvez ensuite exécuter des commandes Docker sans les préfixer avec 'sudo'.

## Conclusion :

Nous avons exploré le processus étape par étape d’installation de Docker sur Debian 12 (Bookworm).

---

<div align="center">

<table>
<tr>
<td align="center"><b>🖥️ Infrastructure & Sécurité</b></td>
<td align="center"><b>💻 Développement & Web</b></td>
<td align="center"><b>🤖 Intelligence Artificielle</b></td>
</tr>
<tr>
<td align="center">
  <a href="https://www.kernel.org/"><img src="https://skillicons.dev/icons?i=linux" width="48" title="Linux" /></a>
  <a href="https://www.debian.org"><img src="https://skillicons.dev/icons?i=debian" width="48" title="Debian" /></a>
  <a href="https://www.gnu.org/software/bash/"><img src="https://skillicons.dev/icons?i=bash" width="48" title="Bash" /></a>
  <br/>
  <a href="https://nginx.org"><img src="https://skillicons.dev/icons?i=nginx" width="48" title="Nginx" /></a>
  <a href="https://git-scm.com"><img src="https://skillicons.dev/icons?i=git" width="48" title="Git" /></a>
</td>
<td align="center">
  <a href="https://www.python.org"><img src="https://skillicons.dev/icons?i=python" width="48" title="Python" /></a>
  <a href="https://flask.palletsprojects.com"><img src="https://skillicons.dev/icons?i=flask" width="48" title="Flask" /></a>
  <a href="https://developer.mozilla.org/docs/Web/HTML"><img src="https://skillicons.dev/icons?i=html" width="48" title="HTML5" /></a>
  <br/>
  <a href="https://developer.mozilla.org/docs/Web/CSS"><img src="https://skillicons.dev/icons?i=css" width="48" title="CSS3" /></a>
  <a href="https://developer.mozilla.org/docs/Web/JavaScript"><img src="https://skillicons.dev/icons?i=js" width="48" title="JavaScript" /></a>
  <a href="https://code.visualstudio.com"><img src="https://skillicons.dev/icons?i=vscode" width="48" title="VS Code" /></a>
</td>
<td align="center">
  <a href="https://ollama.com"><img src="https://img.shields.io/badge/Ollama-000000?style=for-the-badge&logo=ollama&logoColor=white" alt="Ollama" /></a>
  <br/><br/>
  <a href="https://anthropic.com"><img src="https://img.shields.io/badge/Anthropic-D97757?style=for-the-badge&logo=anthropic&logoColor=white" alt="Anthropic" /></a>
</td>
</tr>
</table>

<br/>

<sub>🔒 Projets proposés par <a href="https://github.com/0xCyberLiTech">0xCyberLiTech</a> · Développés en collaboration avec <a href="https://claude.ai">Claude AI</a> (Anthropic) 🔒</sub>

</div>

