

## DOCKER RÉSEAU - Isoler un conteneur Docker du réseau
Pour atteindre cet objectif, nous allons recourir à none.

docker run --rm -it --network=none celtak/ubuntu-ping-ip
Faisons un test et tapons cette commande dans deux terminaux différents pour avoir deux conteneurs.

Maintenant, nous allons vérifier si les conteneurs sont bien isolés, l'un de l'autre (plus de connexion réseau). C'est normalement le cas puisque le pilote none a été utilisé.

Pour ce faire nous allons utiliser une commande que nous connaissons désormais très bien. Il faut la taper sur les deux terminaux.

ip -c a
Si vous avez utilisé le conteneur celtak/ubuntu-ping-ip, normalement ip devrait être disponible. Sinon il faudra l'installer aux deux conteneurs pour pouvoir s'en servir.

Que voyons-nous 🧐?

On s'aperçoit que les deux conteneurs ne sont pas relié par un réseau. Il n'y a pas d'adresse IP associé.

Pour être certain de cela, nous allons ouvrir une autre fenêtre dans notre terminal. Ensuite nous allons taper la même commande que précédemment, mais en omettant le paramètre --network=none. Par conséquent, Docker va attribuer un réseau automatiquement à notre conteneur.

docker run --rm -it celtak/ubuntu-ping-ip
Faisons un ip -c a et vérifions ce qui s'y passe. L'objectif sera de comparer les trois conteneurs (les deux sans réseaux et celui qui est connecté au réseau par défaut).
