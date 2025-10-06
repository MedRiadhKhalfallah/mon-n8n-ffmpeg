# Utiliser l’image officielle n8n comme base
FROM n8nio/n8n:latest

# Passer en root pour installer ffmpeg
USER root

RUN apt-get update \
    && apt-get install -y ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
