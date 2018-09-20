#!/bin/bash

git pull 

docker pull fellah/gitbook

docker pull nginx

docker run --rm fellah/gitbook gitbook build 

docker run --name my-nginx -v ./_book:/usr/share/nginx/html -d -p 8080:80 nginx