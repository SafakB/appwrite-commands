# Appwrite Docker Commands

Includes helper commands for Appwrite and Docker

## General Commands

**Run Compose App**

```sh
docker-compose up -d
```

**Stop Compose App**

```sh
docker-compose down
```

**Stop And Delete Data Compose App**

```sh
docker-compose down -v
```

**List Container**

```sh
docker ps
```

**Inspect Container**

```sh
docker inspect <container_id/name>
```

**Run Container**

```sh
docker exec -it <container_id/name> /bin/bash
```

**Stop Container**

```sh
docker stop <container_id/name>
```

**Stop Containers via Name**

```sh
docker stop $(docker ps -aqf "name=appwrite")
```

**List Networks**

```sh
docker network ls
```

**Inspect Network**

```sh
docker network inspect <network_name>
```

**Delete Network**

```sh
docker network rm <network_name>
```