#!/bin/bash

git pull 

docker pull fellah/gitbook

docker pull nginx

docker run --rm fellah/gitbook gitbook build . build

docker run --name my-nginx -v ./build:/usr/share/nginx/html -d -p 8080:80 nginx