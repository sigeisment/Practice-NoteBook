#!/bin/bash
cd `dirname $0`

git pull 

docker rm  -f my-nginx &> /dev/null

docker pull fellah/gitbook

docker pull nginx

docker run --rm fellah/gitbook gitbook build ./ build

docker run --name my-nginx -v  $PWD/build:/usr/share/nginx/html -d -p 8080:80 nginx