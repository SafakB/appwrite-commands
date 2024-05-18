# Appwrite Fully Uninstall Commands

Includes helper commands for fully uninstall your server


## Uninstall

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


