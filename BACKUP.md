# BACKUP


## MariaDB

### Export Mysql Database

```sh
docker exec appwrite-mariadb mysqldump -u user -p<password> --all-databases > backup/mariadb_backup.sql
```

### Import Mysql Database

```sh
docker exec -i appwrite-mariadb mysql -u user -p<password> < mariadb_backup.sql
```


## Redis

### Backup Dump

```sh
docker cp appwrite-redis:/data/dump.rdb backup/redis_backup.rdb
```

### Backup Dump

```sh
docker cp ./redis_backup.rdb appwrite-redis:/data/dump.rdb
docker exec appwrite-redis redis-server --appendonly no --dbfilename dump.rdb --dir /data
```

## Volumes

## Backup Volumes

```sh
docker run --rm --volumes-from appwrite -v $(pwd)/backup:/backup busybox tar cvf /backup/appwrite_backup.tar /storage
```

## Restore Volumes

```sh
docker run --rm --volumes-from appwrite -v $(pwd):/backup busybox tar xvf /backup/appwrite_backup.tar
```
