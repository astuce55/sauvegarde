#!/bin/bash

# Définir les répertoires source et destination
SOURCE_DIR="/home/xponentiel/Cours/inf361/R1"
DEST_DIR_REMOTE="client1@192.168.97.246:/home/client1/Bureau/R2"

# Définir le nom du fichier de sauvegarde
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="sauvegarde_diff_${DATE}.tar.gz"

# Créer l'archive tar.gz avec les fichiers modifiés depuis la dernière sauvegarde complète
rsync -av --link-dest="/home/client1/Bureau/R2/sauvegarde_complete_$(date --date='last friday' +%Y-%m-%d).tar.gz" "${SOURCE_DIR}" "/tmp/${BACKUP_FILE}"


scp "/tmp/${BACKUP_FILE}" "${DEST_DIR_REMOTE}"

# Nettoyer l'archive temporaire locale
rm "/tmp/${BACKUP_FILE}"

echo "Sauvegarde différentielle effectuée et transférée : ${BACKUP_FILE}"
