# Jenkins安装

## 安装

[docker文档](https://hub.docker.com/_/jenkins/)

## 运行

```shell
sudo docker run -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/bin/docker -v /var/jenkins:/var/jenkins_home --name my_jenkins  jenkins
```