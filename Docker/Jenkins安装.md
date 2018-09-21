# Jenkins安装

[blueocean](https://www.chenb.top/2018/05/14/spring-boot-admin-jenkins-docker/)

## 安装 运行

[官方文档](https://github.com/jenkinsci/docker)

```shell
docker run --name jenkins -p 8080:8080 -p 50000:50000 -d -v "/var/run/docker.sock":"/var/run/docker.sock" -v "$(which docker)":"/usr/bin/docker" my-jenkins
```

Dockerfile

--build-arg dockerGid=993更改docker组

docker build -t my-jenkins --build-arg dockerGid=100 .

```shell
FROM jenkins/jenkins:lts

USER root
ARG dockerGid=999

RUN echo "docker:x:${dockerGid}:jenkins" >> /etc/group

USER jenkins
```
