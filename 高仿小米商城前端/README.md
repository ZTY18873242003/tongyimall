## 主要技术栈
前端:vue2 + vue-router + vuex + axios + sass （vue-cli4搭建的）<br>
后端:Springboot + Mybatis + MySQL 

#### Github项目地址
&nbsp;&nbsp;&nbsp;&nbsp;项目目前分为商城前端（tongyimall-vue）和商城后端(tongyimall-api)两个部分，我分开放到两个仓库中了。后续考虑会加入管理端（tongyimall-admin）和管理后端(tongyimall-admin-api),敬请关注！<br>
&nbsp;&nbsp;&nbsp;&nbsp;商城前端部分：[XiaoMiShopping-Vue](https://github.com/ZTY18873242003/XiaoMiShopping-Vue) <br>
&nbsp;&nbsp;&nbsp;&nbsp;商城后端部分：[XiaoMiShopping-SpringBoot](https://github.com/ZTY18873242003/XiaoMiShopping-SpringBoot) <br>
&nbsp;&nbsp;&nbsp;&nbsp;坚持不易，后续我还会继续完善项目。给个Star吧~
## 启动
> + npm install 安装依赖
> + npm run serve （本地运行,若报错再试一次即可运行）
> + npm run build （打包）
> + 测试账号：ZTY
> + 测试密码：123

####  一、推荐开发工具：
> + IntelliJ IDEA 2020.2.1（业界公认最好的java开发工具，都2021年了就别再用那什么Eclipse了）
> + DataGrip 2020.1 x64（数据库管理工具，用这个就不用在命令行中纯手写建表建库代码、简单快捷、提高效率~.个人认为比Navicat好用）
> + WebStorm 2020.1x64（前端开发工具）
> + 建议都安装上，可以破解，相关内容请自行百度

### 功能与版本
&nbsp;&nbsp;&nbsp;&nbsp;当前版本v1.2.0<br>
&nbsp;&nbsp;&nbsp;&nbsp;目前项目开发中，存在诸多不足，以下是目前已开发的功能。<br>

>**V 1.0.0**<br>
>1，首页轮播图左侧的商品分类弹出框<br>
>2，首页轮播图<br>
>3，首页鼠标焦点放置显示商品下拉栏<br>
>4，首页品牌列表分类<br>
>5，商品详情页及视频播放展示功能<br>
>6，购物车<br>

>**V 1.2.0**<br>
>1，首页品牌列表分类部分新增分页功能<br>
>2，增加了推荐商品功能<br>
>3，完善了网页底部，比如增加了联系方式<br>
>4，增加了下单前地址管理，包括实现了选择省市的二级联动功能<br>
>5，订单下单<br>

## vue-cli项目注意点
- vue-cli项目克隆到本地，需要cnpm install（即安装依赖包），再npm run serve（即启动项目）

- 获取动态路由后面的参数： （如获取参数32， http://localhost:8080/#/product/32）
```
  const id = this.$route.params.myid    
  【注：动态路由params参数是自己定义的名字，为myid】
  【注： this.$router.push('/login') 是路由跳转，注意区分】
```

- userid做成了token（进行加密后的凭证来传输）

- 路由带参数跳转，有如下两种方式：
```
【注：用params传参不显示在url地址上；而用query传参回显示在url地址上】  
// 方法一：（效果等同法二，不过该方式参数'?键名=值名'不显示在url上）
  this.$router.push({
     name: 'index',
     params: {
       键名: 值名
     }
   })
   
   // 方法二：（参数‘值名’显示在url上，且跳转到页面/index也不消失）
   this.$router.push({
     path: '/index',
     query: {
       键名: 值名
     }
   })
```

- axios使用请求的注意点：
```
 【注】get请求的传参需要写在params中
axios.get('url',{
	params: {
		参数名：值
	}
}).then(function (response) {}).catch(function (error) {}）

// post请求的传参直接写在第二个参数对象中（无需再写在params里）
axios.get( 'url',{ 参数名：值 } ).then(function (response) {}).catch(function (error) {}）
```
<br><br>
### 项目目录
  * public： 一般放大图片，
  * src/assets： 放小图片，可以转成base64，不用请求图片资源
  	* src/assets/scss/reset.scss ：重置浏览器的样式，防止默认浏览器样式干扰
  	* src/assets/scss/mixin.scss ：一般放置css函数，即抽取出来复用高的css属性，如span设置图标、flex布局都可以抽离出来，使用函数替代
  	* src/assets/scss/base.scss ：抽取的一些公共样式，即多处相同类名设置相同的css属性，需要抽离出来，提高代码复用

  * src/components： 一般放页面组件，命名方式用大头驼峰命名：如 NavHeader.vue
  * src/views： 放页面（需要单独配置路由的页面），命名方式用小写：如 index.vue、 home.vue

  * src/router/index.js： 路由的配置
  * src/store/index.js： vuex状态管理
  * src/storage： 这里放置缓存sessionStorage、cookie、localStorage等存取以及删除等公共方法，便于操作缓存（虽然已经缓存提供了一些API，但自己封装的能根据项目而定）
<br><br>
### 商城部分界面(可参考[小米官网](www.mi.com)，很多界面类似)
1、商品分类及轮播图
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210205215750968.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1pob25ndG9uZ3lp,size_16,color_FFFFFF,t_70)
2、商品细节图
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210205215756747.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1pob25ndG9uZ3lp,size_16,color_FFFFFF,t_70)
3、登录注册模块![在这里插入图片描述](https://img-blog.csdnimg.cn/20210205215801308.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1pob25ndG9uZ3lp,size_16,color_FFFFFF,t_70)
4、购物车模块![在这里插入图片描述](https://img-blog.csdnimg.cn/20210205215804719.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1pob25ndG9uZ3lp,size_16,color_FFFFFF,t_70)
5、地址管理
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210214210955903.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1pob25ndG9uZ3lp,size_16,color_FFFFFF,t_70#pic_center)
6、商品推荐
![在这里插入图片描述](https://img-blog.csdnimg.cn/20210214211019406.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1pob25ndG9uZ3lp,size_16,color_FFFFFF,t_70#pic_center)
