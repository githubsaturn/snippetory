
## get specific field out using the format arg:
```
docker service inspect captain-nginx --format {{.Spec.TaskTemplate.ContainerSpec.Image}}

```

## Shell into a Running Service:

```
docker exec -it $(docker ps --filter name=captain-captain -q) /bin/bash

```


## Running commands from a Running Service

```
docker exec -it $(docker ps --filter name=captain-certbot -q) /bin/sh -c \
   'certbot certificates --non-interactive; certbot renew --non-interactive'
   
```
   
   
## Get selective logs

```
docker service logs captain-nginx  2>&1 | grep "POST /api/v2/login" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

```

## Specify Docker image SHA
https://stackoverflow.com/questions/25445318/docker-how-do-i-pull-a-specific-build-id

```
docker pull ubuntu@sha256:45b23dee08af5e43a7fea6c4cf9c25ccf269ee113168c19722f87876677c5cb2

```