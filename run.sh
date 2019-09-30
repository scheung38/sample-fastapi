#!/usr/bin/env bash
docker run --rm -d -e APP_MODULE="app.custom_app.custom_main:api" --name mycontainer -p 80:80 -v $(pwd):/app myfastapi /start-reload.sh

docker run --rm -d -e APP_MODULE="app.custom_app.custom_main:api" --name mycontainer -p 80:80 -v $(pwd):/app myfastapi /start.sh
