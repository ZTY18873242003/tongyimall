# tongyimall
高仿小米商城用户端(分为商城前端（tongyimall-vue)和商城后端(tongyimall-api)两部分)，是Vue + SpringBoot的前后端分离项目，用户端包括首页门户、商品分类、首页轮播、商品展示、商品推荐、购物车、地址管理、下订单等功能模块。

## 主要技术栈
前端:vue2 + vue-router + vuex + axios + sass （vue-cli4搭建的）<br>
后端:SpringBoot + MyBatis注解版 + MySQL + redis6


### 一、功能与版本(在线演示地址:www.tongyi.site)
&nbsp;&nbsp;&nbsp;&nbsp;当前版本v1.4.0<br>
&nbsp;&nbsp;&nbsp;&nbsp;目前项目开发中，存在诸多不足，以下是目前已开发的功能。<br>

>**V 1.0.0**<br>
>1，首页轮播图左侧的商品分类弹出框<br>
>2，首页轮播图<br>
>3，首页顶部商品下拉栏<br>
>4，首页品牌列表分类<br>
>5，商品详情页<br>
>6，购物车<br>

>**V 1.1.0**<br>
>1，首页底部增加了推荐商品功能<br>
>3，完善了网页底公共栏<br>
>4，增加了下单前地址管理，实现了选择省市的二级联动功能<br>
>5，订单下单<br>

>**V 1.2.0**<br>
>1,首页左侧弹出框后台管理
>2,首页商品大类推荐后台管理
>3,首页底部推荐后台管理
<br>

>**V 1.3.0**<br>
>1,引入布隆过滤器
>2,完善订单功能
>3,首页商品大类引入redis缓存,小米秒杀部分页面做成
<br>

>**V 1.4.0**<br>
>1,所有商品信息都引入redis缓存
<br>

>**V 1.5.0**<br>
>1,完成模拟支付功能
>2,完成订单超时30分钟取消功能
<br>

### 二、运行环境
&nbsp;&nbsp;&nbsp;&nbsp;为保证项目能够运行，请至少安装好以下运行环境：
 + 1、Maven(项目对象模型，可以通过一小段描述信息来管理项目的构建，报告和文档的项目管理工具软件，教程：[Maven的安装与配置](https://blog.csdn.net/a805814077/article/details/100545928))
 + 2、MySQL 8.0+版本
 + 3、Node环境
 + 4、JDK1.8
 + 5、Redis
 
### 三、快速启动
##### 1、前端部分
```
git clone https://github.com/ZTY18873242003/tongyimall    //下载到本地

cd /高仿小米商城前端    //进入到前端目录

npm install          // 安装项目依赖(需要电脑上装有Node环境)，等待安装完成之后，安装失败可用 cnpm 或 yarn


npm run serve        // 开启服务器，浏览器访问 http://localhost:8080


npm run build        // 执行构建命令，生成的dist文件夹放在服务器下即可访问
```

##### 2、后端部分
```
使用root用户权限在本地新建名为xiaomi的mysql数据库,可在 /高仿小米商城后台/src/main/resources/application.yml文件中修改密码

cd /高仿小米商城后台    //进入到后端目录

使用数据库管理工具(如Navicat)运行xiaomi.sql脚本文件(用户端也是这个数据库),或复制其中内容在命令行执行

打开IDEA或者Eclipse 运行 高仿小米商城后台/src/main/java/com/zty/xiaomiadmin/server/ServerApplication.java文件，默认是8080端口
```

### 四、商城部分界面(可参考[小米官网](https://www.mi.com)，很多界面类似)
1、商品分类及轮播图
![在这里插入图片描述](https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/QQ截图20210301091854.jpg)
2、商品细节图
![在这里插入图片描述](https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/QQ截图20210301091911.jpg)
3、登录注册模块![在这里插入图片描述](https://img-blog.csdnimg.cn/20210205215801308.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1pob25ndG9uZ3lp,size_16,color_FFFFFF,t_70)
4、购物车模块![在这里插入图片描述](https://img-blog.csdnimg.cn/20210205215804719.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1pob25ndG9uZ3lp,size_16,color_FFFFFF,t_70)
5、地址管理
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210214210955903.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1pob25ndG9uZ3lp,size_16,color_FFFFFF,t_70#pic_center)
6、商品推荐
![在这里插入图片描述](https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/QQ截图20210301092202.jpg)
7、订单模块
![](https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/QQ截图20210408204946.jpg)
![](https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/QQ截图20210408205017.jpg)
### 五、完整项目地址
&nbsp;&nbsp;&nbsp;&nbsp;项目目前分为商城端（tongyimall）和管理端(tongyimall-admin)两个部分，我分开放到两个仓库中了。<br>
&nbsp;&nbsp;&nbsp;&nbsp;商城端：[tongyimall](https://github.com/ZTY18873242003/tongyimall) <br>
&nbsp;&nbsp;&nbsp;&nbsp;管理端：[tongyimall-admin](https://github.com/ZTY18873242003/tongyimall-admin)