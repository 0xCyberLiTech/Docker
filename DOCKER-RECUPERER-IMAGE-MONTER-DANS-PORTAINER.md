Récupérer une image Docker & Lancer un conteneur à partir de cette image dans Portainer.

🔹 1. Récupérer une image Docker

Depuis ton terminal (ou via l’interface Portainer → Images), tu peux télécharger une image depuis Docker Hub (ou un registre privé).

Exemple : récupérer Nginx :

docker pull nginx:latest

🔹 2. Vérifier l’image téléchargée

Tu peux voir toutes les images disponibles sur ton hôte :

docker images


🔹 3. Créer un conteneur depuis Portainer

👉 Connecte-toi à Portainer (souvent via http://<IP_SERVEUR>:9443).

Étapes dans l’interface :

Dans le menu gauche → clique sur Containers

Clique sur + Add container

Remplis les champs :

Name : un nom pour ton conteneur (ex. nginx-test)

Image : le nom de l’image (ex. nginx:latest)

Network ports configuration : mappe le port du conteneur vers ta machine

80 (interne Nginx) → 8080 (hôte)
→ Tu mettras : host: 8080 → container: 80

4. Clique sur Deploy the container

🔹 4. Vérifier que ça tourne

Une fois lancé, tu peux tester dans ton navigateur :

http://<IP_SERVEUR>:8080
