#!/bin/bash
cd `dirname $0`

git pull origin master

docker rm  -f my-nginx &> /dev/null

#docker pull billryan/gitbook #https://hub.docker.com/r/billryan/gitbook/

#docker pull nginx

docker run --rm -v $PWD:/gitbook -p 4000:4000 billryan/gitbook gitbook install

docker run --rm -v $PWD:/gitbook -p 4000:4000 billryan/gitbook gitbook build

rm build -rf

mv _book build

chmod 777 build

docker run --name my-nginx -v  $PWD/build:/usr/share/nginx/html -d -p 80:80 nginx