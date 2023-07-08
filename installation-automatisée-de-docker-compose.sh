#!/bin/bash

# --------------------------------------------------------
# 0xCyberLiTech
# Script créé le 08-07-2023
# Script modifié le 08-07-2023
#
# touch installation-automatisée-de-docker-compose.sh
# chmod +x installation-automatisée-de-docker-compose.sh
# sudo ./installation-automatisée-de-docker-compose.sh
# --------------------------------------------------------

COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)

# Install docker-compose
sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
chmod +x /usr/local/bin/docker-compose
sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

# Output compose version
docker-compose -v

exit 0
