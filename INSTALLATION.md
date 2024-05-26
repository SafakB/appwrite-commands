# Appwrite Install & Update & Etc. Commands

Includes helper commands for Install & Update & Etc.


## Install

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


## Update

```
parent_directory <= you run the command in this directory
└── appwrite
    └── docker-compose.yml
```

**Install Appwrite** (macOS & Linux)

```sh
docker run -it --rm \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume "$(pwd)"/appwrite:/usr/src/code/appwrite:rw \
    --entrypoint="upgrade" \
    appwrite/appwrite:1.5.6
```

**Install Appwrite** (Windows CMD)

```sh
docker run -it --rm ^
    --volume //var/run/docker.sock:/var/run/docker.sock ^
    --volume "%cd%"/appwrite:/usr/src/code/appwrite:rw ^
    --entrypoint="upgrade" ^
    appwrite/appwrite:1.5.6
```

**Install Appwrite** (Windows Powershell)

```sh
docker run -it --rm `
    --volume /var/run/docker.sock:/var/run/docker.sock `
    --volume ${pwd}/appwrite:/usr/src/code/appwrite:rw `
    --entrypoint="upgrade" `
    appwrite/appwrite:1.5.6
```


## Migration

### Verify versions

```sh
docker ps | grep appwrite/appwrite
```

### Start Migration

```sh
docker compose exec appwrite migrate
```

