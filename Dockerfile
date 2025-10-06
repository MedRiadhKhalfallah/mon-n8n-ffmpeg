# Utiliser l’image officielle n8n comme base
FROM n8nio/n8n:latest

# Passer en root pour installer ffmpeg
USER root

RUN apt-get update \
    && apt-get install -y ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Revenir à l’utilisateur n8n (souvent “node” ou un utilisateur non-root selon l’image de base)
USER node

# Copier les workflows ou codes si applicable
# (si tu as des fichiers à intégrer)
COPY workflows /home/node/workflows
COPY package.json /home/node/

# Définir le répertoire de travail
WORKDIR /home/node

# Installer les dépendances (si tu as des packages à installer)
RUN npm install --production

# Commande de démarrage
CMD ["n8n", "start"]
