#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

read -p "Please enter backup directory name (Default 'backup'): " CUSTOM_DIR
BACKUP_BASE_DIR=${CUSTOM_DIR:-backup}

CURRENT_DATETIME=$(date +"%Y%m%d_%H%M")
BACKUP_DIR="${BACKUP_BASE_DIR}_${CURRENT_DATETIME}"

if [ -d "$BACKUP_DIR" ]; then
    BACKUP_DIR="${BACKUP_DIR}_$(date +"%S")"
fi

mkdir -p "$BACKUP_DIR"

docker exec appwrite-mariadb mysqldump -u user -ppassword --all-databases > "${BACKUP_DIR}/mariadb_backup.sql"
echo -e "${BLUE}MariaDB backup completed successfully!${NC}"

docker cp appwrite-redis:/data/dump.rdb "${BACKUP_DIR}/redis_backup.rdb"
echo -e "${BLUE}Redis backup completed successfully!${NC}"

docker run --rm --volumes-from appwrite -v "$(pwd)/${BACKUP_DIR}:/backup" busybox tar cvf /backup/appwrite_backup.tar /storage
echo -e "${BLUE}Appwrite volumes backup completed successfully!${NC}"

cp .env docker-compose.yml "${BACKUP_DIR}"
echo -e "${BLUE}Configuration files backup completed successfully!${NC}"


read -p "Do you want to compress the backup files? (y/n): " COMPRESS
if [ "$COMPRESS" != "y" ]; then
    echo -e "${GREEN}Backup completed successfully!${NC}"
    exit 0
fi

mkdir -p "_backups"
tar -zcvf "_backups/${BACKUP_DIR}.tar.gz" "${BACKUP_DIR}"
echo -e "${BLUE}Compressed backup files completed successfully!${NC}"

echo -e "${GREEN}Backup completed successfully!${NC}"
