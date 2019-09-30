FASTAPI Docker Notes




$ cd directory where Dockerfile is placed:

# Dockerfile

FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

COPY ./app /app


$ docker build -t myfastapi .

$ docker run --rm -d --name mycontainer -p 80:80 myfastapi

if error:

docker: Error response from daemon: Conflict. The container name "/mycontainer" is already in use by container

$ docker container list
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                NAMES
7df489a9f136        myfastapi           "/start.sh"         12 minutes ago      Up 12 minutes       0.0.0.0:80->80/tcp   mycontainer

$ docker stop <ID>
$ docker stop 7df489a9f136

or

$ docker system prune

and try again

$ docker run --rm -d --name mycontainer -p 80:80 myfastapi

with Live Docker reload, so no need to

docker build
docker run

like so:

$ docker run --rm -d --name mycontainer -p 80:80 -v $(pwd):/app myfastapi /start-reload.sh


MODULE_NAME:
docker run -d -p 80:80 -e MODULE_NAME="custom_app.custom_main" myimage


VARIABLE_NAME:
$ docker run -d -p 80:80 -e VARIABLE_NAME="api" myimage, e.g ->
$ docker run --rm -d -e VARIABLE_NAME="api" --name mycontainer -p 80:80 -v $(pwd):/app myfastapi /start-reload.sh

Combining MODULE_NAME and VARIABLE_NAME into APP_MODULE:
$ docker run --rm -d -e APP_MODULE="app.custom_app.custom_main:api" --name mycontainer -p 80:80 -v $(pwd):/app myfastapi /start-reload.sh



$ docker container ls
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                NAMES
7df489a9f136        myfastapi           "/start.sh"         17 seconds ago      Up 15 seconds       0.0.0.0:80->80/tcp   mycontainer

Chrome

localhost/homepage <-- from Docker

localhost:8000/homepage <-- from local machine


{"Hello":"from home page"}

