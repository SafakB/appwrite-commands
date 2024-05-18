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

Will be update


## Migration

Will be update


