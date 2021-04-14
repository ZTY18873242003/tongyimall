# tongyimall-vue
高仿小米商城用户端前端
<br><br><br>
## 技术栈
vue2 + vue-router + vuex + axios + sass + ElementUI + vue脚手架4
<br><br><br>
## 启动
> + 推荐node版本为10.16.0左右,高版本可能会出现npm install失败的问题,如第一次安装失败可以多试几次。
> + 将npm设置为淘宝镜像以提高下载速度,否则可能出现卡顿问题

> + 进入前端目录在命令提示符下输入 npm install 命令来安装依赖
> + npm run serve 
> + npm run build （打包）
<br><br><br>
## 注意
- vue-cli4中axios使用请求的注意点（与vue-cli2有出入)：
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
<br>
