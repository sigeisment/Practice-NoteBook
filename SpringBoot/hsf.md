# 开发环境配置

* [1.依赖](#1.依赖)
* [2.轻量级配置中心](#2.轻量级配置中心)
* [3.Maven配置](#3.Maven配置)
* [4.目录结构](#4.目录结构)

## 1.依赖环境

* jdk >= 1.8
* node.js >= 8.11.2
* maven >= 3.3.9
* MySQL >= 5.7
* docker >= 17.12.1-ce (非必需)

## 2.轻量级配置中心

[官方文档](https://helpcdn.aliyun.com/document_detail/44163.html)

Docker化安装

```shell
#/bin/bash
cd `dirname $0`

img_output="deep/edas-config-center"

docker build -t $img_output .

docker rm -f config-center &>/dev/null

docker run -d \
    -p 8080:8080 \
    -p 9600:9600 \
    --name config-center \
    $img_output \
    java \
        -Djava.security.egd=file:/dev/./urandom \
        -jar /home/edas-config-center.jar
```

## 3.Maven配置

```xml
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-hsf</artifactId>
            <version>1.1</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-pandora</artifactId>
            <version>1.2</version>
        </dependency>
        <dependency>
            <groupId>com.paypal.springboot</groupId>
            <artifactId>resteasy-spring-boot-starter</artifactId>
            <version>2.3.4-RELEASE</version>
            <scope>runtime</scope>
        </dependency>
        <dependency>
            <groupId>org.mybatis.spring.boot</groupId>
            <artifactId>mybatis-spring-boot-starter</artifactId>
            <version>1.3.1</version>
        </dependency>
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>druid</artifactId>
            <version>1.1.3</version>
        </dependency>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>6.0.2</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
            <version>1.5.8.RELEASE</version>
            <!-- PayPal resteasy里有引入版本不一致的改包 -->
            <exclusions>
                <exclusion>
                    <groupId>org.jboss.logging</groupId>
                    <artifactId>jboss-logging</artifactId>
                </exclusion>
            </exclusions>
        </dependency>
```

## 4.目录结构

```text
.
├── Dockerfile
├── README.md
├── hsf.lock
├── optimus-api
│   ├── pom.xml
│   └── src
│       ├── main
│       │   ├── java
│       │   │   └── com
│       │   │       └── deepexi
│       │   │           └── optimus
│       │   │               ├── api
│       │   │               │   └── ProductService.java
│       │   │               └── domain
│       │   │                   └── eo
│       │   │                       └── Product.java
│       │   └── resources
│       └── test
│           ├── java
│           │   └── com
│           │       └── deepexi
│           │           └── optimus
│           └── resources
├── optimus-provider
│   ├── generated
│   │   └── document.html
│   ├── pom.xml
│   └── src
│       ├── main
│       │   ├── java
│       │   │   └── com
│       │   │       └── deepexi
│       │   │           └── optimus
│       │   │               ├── StartupApplication.java
│       │   │               ├── aop
│       │   │               │   └── LogAspect.java
│       │   │               ├── config
│       │   │               │   ├── DataSourceConfig.java
│       │   │               │   ├── HsfConfig.java
│       │   │               │   ├── JPAQueryFactoryUtil.java
│       │   │               │   └── JaxrsApplication.java
│       │   │               ├── extension
│       │   │               │   ├── ApplicationException.java
│       │   │               │   └── ExceptionHandler.java
│       │   │               ├── mapper
│       │   │               │   └── ProductMapper.java
│       │   │               ├── repository
│       │   │               │   └── ProductRepository.java
│       │   │               └── service
│       │   │                   ├── rest
│       │   │                   │   ├── ProductRestServiceImpl.java
│       │   │                   │   └── api
│       │   │                   │       └── ProductRestService.java
│       │   │                   └── rpc
│       │   │                       └── ProductServiceImpl.java
│       │   └── resources
│       │       ├── application-dev.properties
│       │       ├── application-prod.properties
│       │       ├── application.properties
│       │       ├── logback-spring.xml
│       │       └── mapper
│       │           └── ProductMapper.xml
│       └── test
│           ├── java
│           │   └── com
│           │       └── deepexi
│           │           └── optimus
│           └── resources
├── pom.xml
└── start-code.sh
```