

Script d’installation automatique :

Script d’installation automatique de Docker + Docker Compose (plugin officiel) pour Debian 13 (Trixie).

📜 Script : install-docker-trixie.sh

```bash
#!/bin/bash
# ============================================================
# Script d'installation automatique de Docker & Docker Compose
# pour Debian 13 (Trixie)
# Auteur : 0xCyberLiTech
# ============================================================

set -e

echo "[INFO] Mise à jour du système..."
apt update -y && apt upgrade -y

echo "[INFO] Installation des dépendances..."
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

echo "[INFO] Ajout de la clé GPG Docker..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "[INFO] Ajout du dépôt Docker (Trixie)..."
CODENAME=$(lsb_release -cs)  # doit renvoyer 'trixie'
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $CODENAME stable" \
    > /etc/apt/sources.list.d/docker.list

echo "[INFO] Mise à jour des dépôts..."
apt update -y

echo "[INFO] Installation de Docker et Docker Compose (plugin)..."
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[INFO] Activation et démarrage de Docker..."
systemctl enable docker
systemctl start docker

echo "[INFO] Ajout de l'utilisateur $SUDO_USER au groupe docker..."
if [ -n "$SUDO_USER" ]; then
    usermod -aG docker $SUDO_USER
else
    echo "[WARN] Script exécuté en root directement. Pense à ajouter ton utilisateur au groupe docker manuellement."
fi

echo "[INFO] Vérification de l'installation..."
docker --version
docker compose version

echo "============================================================"
echo "[SUCCESS] Docker & Docker Compose ont été installés avec succès !"
echo "Déconnecte-toi / reconnecte-toi pour utiliser Docker sans sudo."
echo "Test : docker run hello-world"
echo "============================================================"
```

---

1 - Utilisation

Crée le fichier du script :

```bash
nano install-docker-trixie.sh
```

---

2 - Colle le contenu ci-dessus, enregistre (CTRL+O, CTRL+X).

---

3 - Rends le script exécutable :

```bash
chmod +x install-docker-trixie.sh
```

---

4 - Lance-le (en root ou via sudo) :

```bash
sudo ./install-docker-trixie.sh
```
