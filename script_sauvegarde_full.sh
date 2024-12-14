#!/bin/bash


SOURCE_DIR="/home/xponentiel/Cours/inf361/R1"
DEST_DIR_REMOTE="client1@192.168.97.246:/home/client1/Bureau/R2"

DATE=$(date +%Y-%m-%d)
BACKUP_FILE="sauvegarde_complete_${DATE}.tar.gz"

tar -czf "/tmp/${BACKUP_FILE}" -C "${SOURCE_DIR}" .

scp "/tmp/${BACKUP_FILE}" "${DEST_DIR_REMOTE}"

rm "/tmp/${BACKUP_FILE}"

echo "Sauvegarde complète effectuée et transférée : ${BACKUP_FILE}"
