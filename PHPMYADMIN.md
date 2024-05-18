# Add Phpmyadmin Your Appwrite Network

## Be Careful!

These changes will publicly create a phpmyadmin for you. It is your duty to restrict access to it.


## Caution !

Changing the `docker-compose.yml` file may cause errors or bugs when updating in the future.


## Add Basicly

File : `docker-compose.yml`

```yml
phpmyadmin:
    image: phpmyadmin/phpmyadmin
    container_name: phpmyadmin
    environment:
      - PMA_HOST=appwrite-mariadb
      - PMA_USER=user
      - PMA_PASSWORD=password
    ports:
      - "9494:80"
    networks:
      - appwrite
```

Later Run

```sh
docker-compose up -d
```


## Add With Route

File : `docker-compose.yml`

Find : 
```
- traefik.http.routers.appwrite_api_http.rule=PathPrefix(`/`)
```
Replace : 
```
- traefik.http.routers.appwrite_api_http.rule=PathPrefix(`/`) && !PathPrefix(`/phpmyadmin`)
```

Find : 
```
- traefik.http.routers.appwrite_api_https.rule=PathPrefix(`/`)
```
Replace : 
```
- traefik.http.routers.appwrite_api_https.rule=PathPrefix(`/`) && !PathPrefix(`/phpmyadmin`)
```

### Add for routed

```yml
phpmyadmin:
    image: phpmyadmin/phpmyadmin
    container_name: phpmyadmin
    environment:
      - PMA_HOST=appwrite-mariadb
      - PMA_USER=user
      - PMA_PASSWORD=password
    networks:
      - appwrite
    labels:
      - traefik.enable=true
      - traefik.docker.network=appwrite
      - traefik.constraint-label-stack=appwrite
      - traefik.http.routers.phpmyadmin.rule=Host(`example.com`) && PathPrefix(`/phpmyadmin`)
      - traefik.http.middlewares.phpmyadmin-stripprefix.stripprefix.prefixes=/phpmyadmin
      - traefik.http.routers.phpmyadmin.middlewares=phpmyadmin-stripprefix
      - traefik.http.services.phpmyadmin.loadbalancer.server.port=80
```

Later Run

```sh
docker-compose up -d
```




