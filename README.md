# Appwrite Commands

Includes helper commands for Appwrite and Docker

## General Commands

**Install Appwrite** (macOS & Linux)

```sh
docker run -it --rm \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume "$(pwd)"/appwrite:/usr/src/code/appwrite:rw \
    --entrypoint="install" \
    appwrite/appwrite:1.5.5
```

**Install Appwrite** (Windows CMD)

```sh
docker run -it --rm ^
    --volume //var/run/docker.sock:/var/run/docker.sock ^
    --volume "%cd%"/appwrite:/usr/src/code/appwrite:rw ^
    --entrypoint="install" ^
    appwrite/appwrite:1.5.5
```

**Install Appwrite** (Windows Powershell)

```sh
docker run -it --rm `
    --volume /var/run/docker.sock:/var/run/docker.sock `
    --volume ${pwd}/appwrite:/usr/src/code/appwrite:rw `
    --entrypoint="install" `
    appwrite/appwrite:1.5.5
```

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
docker inspect appwrite
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


## Delete All Appwrite 

**Stop and Delete Containers**

```sh
docker stop $(docker ps -aqf "name=appwrite")
docker rm $(docker ps -aqf "name=appwrite")
docker stop runtime
docker rm runtime
docker stop gateway
docker rm gateway
```

**Delete Images**

```sh
docker rmi $(docker images -q 'appwrite/*')
```

**Delete Volumes**

```sh
docker volume rm $(docker volume ls -qf "name=appwrite")
```

**Down all runnging containers** (if u need)

```sh
docker-compose down
```

**Delete Network**

```sh
docker network rm appwrite
```