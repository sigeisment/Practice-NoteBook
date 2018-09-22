# Docker

[参考](https://www.cnblogs.com/boshen-hzb/p/6400272.html)

## 语法

> 1.#Line blocks used for commenting \
> 2.command argument argument ..

## 命令

### FROM

定义了使用哪个基础镜像启动构建流程,FROM命令必须是Dockerfile的首个命令。

> 1.#Usage: FROM [image name]\
2.FROM jenkins

### ARG

用以定义构建时需要的参数

> ARG name=value

ARG指令定义的参数，在docker build命令中以--build-arg name=value形式赋值。

### MAINTAINER

用于声明作者

### USER

USER命令用于设置运行容器的用户。

### ENV

ENV命令用于设置环境变量。这些变量以”key=value”的形式存在，并可以在容器内被脚本或者程序调用

### ADD

ADD命令有两个参数，源和目标。它的基本作用是从源系统的文件系统上复制文件到目标容器的文件系统。如果源是一个URL，那该URL的内容将被下载并复制到容器中。

> 1.#Usage: ADD [source directory or URL] [destination directory]\
2.ADD /my_app_folder /my_app_folder

### RUN

RUN命令是Dockerfile执行命令的核心部分。它接受命令作为参数并用于创建镜像。不像CMD命令，RUN命令用于创建镜像（在之前commit的层之上形成新的层）。

### VOLUME

VOLUME命令用于让你的容器访问宿主机上的目录。

> 1.#Usage: VOLUME ["/dir_1", "/dir_2" ..]\
2.VOLUME ["/my_files"]

### EXPOSE

EXPOSE用来指定端口，使容器内的应用可以通过端口和外界交互。

### WORKDIR

用于设置CMD指明的命令的运行目录。

### CMD

和RUN命令相似，CMD可以用于执行特定的命令。和RUN不同的是，这些命令不是在镜像构建的过程中执行的，而是在用镜像构建容器后被调用。

>1.# Usage 1: CMD application "argument", "argument", ..\
2.CMD "echo" "Hello docker!"

### ENTRYPOINT

配置容器启动后执行的命令，并且不可被 docker run 提供的参数覆盖。

每个 Dockerfile 中只能有一个 ENTRYPOINT，当指定多个时，只有最后一个起效。

ENTRYPOINT 帮助你配置一个容器使之可执行化，如果你结合CMD命令和ENTRYPOINT命令，你可以从CMD命令中移除“application”而仅仅保留参数，参数将传递给ENTRYPOINT命令。

>1.# Usage: ENTRYPOINT application "argument", "argument", ..\
2.# Remember: arguments are optional. They can be provided by CMD\
3.# or during the creation of a container.
4.ENTRYPOINT echo\
5.# Usage example with CMD:\
6.# Arguments set with CMD can be overridden during *run*\
7.CMD "Hello docker!"\
8.ENTRYPOINT echo