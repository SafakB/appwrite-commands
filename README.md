# Appwrite Commands

Includes helper commands for Appwrite and Docker

## General Commands

**Run Compose App**

`docker-compose up -d`

**Stop Compose App**

`docker-compose down`

**Stop And Delete Data Compose App**

`docker-compose down -v`

**List Container**

`docker ps`

**Inspect Container**

`docker inspect appwrite`

**Run Container**

`docker exec -it <container_id/name> /bin/bash`

**Stop Container**

`docker stop <container_id/name>`

**Stop Containers via Name**

`docker stop $(docker ps -aqf "name=appwrite")`

**List Networks**

`docker network ls`

**Inspect Network**

`docker network inspect <network_name>`

**Delete Network**

`docker network rm <network_name>`


## Delete Appwrite

**Stop and Delete Containers**

`docker stop $(docker ps -aqf "name=appwrite")`

`docker rm $(docker ps -aqf "name=appwrite")`

**Delete Images**

`docker rmi $(docker images -q 'appwrite/*')`

**Delete Volumes**

`docker volume rm $(docker volume ls -qf "name=appwrite")`

**Delete Network**

`docker network rm appwrite`