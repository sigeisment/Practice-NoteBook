# JavaEE基础

* [1.war和war exploded的区别](#1-war和warexploded的区别)

## 1. war和warexploded的区别

### [原文](https://blog.csdn.net/xlgen157387/article/details/56498938)

是选择war还是war exploded 这里首先看一下他们两个的区别：

war模式：将WEB工程以包的形式上传到服务器 ；
war exploded模式：将WEB工程以当前文件夹的位置关系上传到服务器；
>1.war模式：将WEB工程以包的形式上传到服务器 ；
2.war exploded模式：将WEB工程以当前文件夹的位置关系上传到服务器；

（1）war模式这种可以称之为是发布模式，看名字也知道，这是先打成war包，再发布；

（2）war exploded模式是直接把文件夹、jsp页面 、classes等等移到Tomcat 部署文件夹里面，进行加载部署。因此这种方式支持热部署，一般在开发的时候也是用这种方式。

（3）在平时开发的时候，使用热部署的话，应该对Tomcat进行相应的设置，这样的话修改的jsp界面什么的东西才可以及时的显示出来。