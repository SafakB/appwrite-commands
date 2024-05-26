#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

read -p "Please enter backup directory prefix (Default 'backup'): " PREFIX
PREFIX=${PREFIX:-backup}

backup_dirs=($(ls -d ${PREFIX}_* 2>/dev/null))

if [ ${#backup_dirs[@]} -eq 0 ]; then
  echo -e "${RED}No backup directories found with prefix '$PREFIX'.${NC}"
  exit 1
fi

echo "Available backup directories:"
for i in "${!backup_dirs[@]}"; do
  echo -e "${BLUE} [$i] ${backup_dirs[$i]} ${NC}"
done

read -p "Please enter backup directory number for restore (Default '0'): " dir_index
dir_index=${dir_index:-0}

RESTORE_DIR=${backup_dirs[$dir_index]}

echo -e "${BLUE}Restoring from backup directory: $RESTORE_DIR${NC}"

required_files=("appwrite_backup.tar" "mariadb_backup.sql" "redis_backup.rdb")
for file in "${required_files[@]}"; do
  if [ ! -f "$RESTORE_DIR/$file" ]; then
    echo -e "${RED}Error: Required file '$file' not found in backup directory '$RESTORE_DIR'.${NC}"
    exit 1
  fi
done

docker run --rm --volumes-from appwrite -v "$(pwd)/$RESTORE_DIR:/restore" busybox tar xvf /restore/appwrite_backup.tar -C /
echo -e "${BLUE}Appwrite volumes restored.${NC}"

echo -e "${BLUE}Starting MariaDB database restore...${NC}"
docker exec -i appwrite-mariadb mysql -u user -ppassword < "${RESTORE_DIR}/mariadb_backup.sql"
echo -e "${BLUE}MariaDB database restored.${NC}"

docker cp "${RESTORE_DIR}/redis_backup.rdb" appwrite-redis:/data/dump.rdb
echo -e "${BLUE}Redis database restored.${NC}"

docker exec appwrite-redis redis-cli shutdown
echo -e "${RED}Redis server stopped.${NC}"

docker start appwrite-redis
echo -e "${GREEN}Redis server started.${NC}"

echo -e "${GREEN}Restore completed.${NC}"

docker compose compose down -v
docker compose compose up -d
