# Utiliser l’image officielle n8n comme base
FROM n8nio/n8n:latest

# Passer en root pour installer ffmpeg
USER root

RUN apk add --no-cache ffmpeg
