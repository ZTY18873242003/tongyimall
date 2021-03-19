<template>
    <!--
      将头部导航div分成两块：nav-topbar、nav-header。
      nav-topbar里再包个container用于居中，container包括topbar-menu(左)、topbar-user(右)
      nav-header里再包个container用于居中，container包括logo(左)、menu(中)、search(右)
    -->
    <div class="header">
      <div class="nav-topbar">
        <div class="container">
          <div class="topbar-menu">
            <!-- 点击链接，不让页面刷新 -->
            <a href="https://xiaoai.mi.com/">小爱开放平台</a>
            <a href="https://www.miui.com/">MIUI</a>
            <a href="https://i.mi.com/">云服务</a>
            <a href="https://www.mi.com/aptitude/list/">协议规则</a>
          </div>
          <div class="topbar-user">
            <a href="javascript:;" v-if="username">{{username}}</a>
            <a href="javascript:;" v-if="!username" @click="login()">登录</a>
            <a href="javascript:;"  @click="reg()">注册</a>
            <a href="javascript:;" v-if="username" @click="logout()">退出</a>
            <a href="/#/order/list" v-if="username">我的订单</a>
            <a href="javascript:;" class="my-cart" @click="goToCart()">
              <span class="icon-cart"></span>购物车({{cartCount}})
            </a>
          </div>
        </div>
      </div>

      <div class="nav-header">
          <div class="container">
            <div class="header-logo">
              <!-- 相当于：localhost:8080/#/index -->
              <a href="/#/index"></a>
            </div>

            <div class="header-menu">
              <div class="item-menu">
                <span>小米手机</span>
                <div class="children">
                  <ul>
                    <li class="product" v-for="(item, index) in phoneList" :key="index">
                      <a :href="'/#/product/'+item.good_id">
                        <div class="pro-img">
                          <img v-lazy="item.imageHead" :alt="item.subtitle">
                        </div>
                        <div class="pro-name">{{item.name}}</div>
                        <div class="pro-price">{{item.price | currency}}</div>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="item-menu">
                <span>笔记本</span>
                <div class="children">
                  <ul>
                    <li class="product" v-for="(item, index) in compList" :key="index">
                      <a :href="'/#/product/'+item.good_id">
                        <div class="pro-img">
                          <img v-lazy="item.imageHead" :alt="item.subtitle">
                        </div>
                        <div class="pro-name">{{item.name}}</div>
                        <div class="pro-price">{{item.price | currency}}</div>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="item-menu">
                <span>电视</span>
                <div class="children">
                  <ul>
                    <li class="product" v-for="(item, index) in TVList" :key="index">
                      <a :href="'/#/product/'+item.good_id">
                        <div class="pro-img">
                          <img v-lazy="item.imageHead" :alt="item.subtitle">
                        </div>
                        <div class="pro-name">{{item.name}}</div>
                        <div class="pro-price">{{item.price | currency}}</div>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>

              <div class="item-menu">
                <span>路由器</span>
                <div class="children">
                  <ul>
                    <li class="product" v-for="(item, index) in luyouList" :key="index">
                      <a :href="'/#/product/'+item.good_id">
                        <div class="pro-img">
                          <img v-lazy="item.imageHead" :alt="item.subtitle">
                        </div>
                        <div class="pro-name">{{item.name}}</div>
                        <div class="pro-price">{{item.price | currency}}</div>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="header-search">
              <div class="wapper">
                <input type="text" name="keyword"/>
                <a href="javascript:;"></a>
              </div>
            </div>
          </div>
      </div>
    </div>
</template>

<script>
import { mapState } from 'vuex'
export default {
  name: 'nav-header',
  data () {
    return {
      phoneList: [],
      compList:[],
      TVList:[],
      luyouList:[]
    }
  },
  computed: {
    // 通过计算属性获取username属性 (这里不选择用data中定义变量直接获取store中的username数据)
    // （可以避免App.vue中用axios请求用户数据时造成的延迟而未渲染，因为计算属性当数据产生变化会重新渲染）
    //注释部分等同 ...mapState(['username','cartCount']) ，这只是简写方式语法糖而已
    username () {
      return sessionStorage.getItem("username")
    },
    cartCount () {
      return this.$store.state.cartCount
    }
    // ...mapState(['username', 'cartCount'])
  },
  filters: {
    currency (val) {
      if (!val) return '0.00'
      return '￥' + val.toFixed(2) + '元'
    }
  },
  mounted () {
    this.getProductList()
    // 这里是用来判断 login.vue(登录页面跳转过来的)路由跳转过来的参数，若this.$route.params.from是设定的'login'值，则请求购物车数量并保存到vuex中
    const params = this.$route.params
    if (params && params.from === 'login') {
      this.getCartCount()
    }
  },
  methods: {
    login () {
      this.$router.push('/login')
    },
    reg(){
      this.$router.push('/register')
    },
    logout () {
      // 发送请求给后端时，后端会拿到token，进行清空
        this.$message.success('退出成功')
        // 退出登录时，将cookie的userid马上置空（expires: '-1'的意思时，cookie立即失效）
        //            再将vuex中的username和cartCount置空

        this.$store.dispatch('saveUserName', '')
        this.$store.dispatch('saveCartCount', '0')
        sessionStorage.clear()
        this.$router.go(0)
    },
    goToCart () {
      this.$router.push('/cart')
    },
    getProductList () {
      this.axios.get('http://localhost:8080/index/product', {
        params: {
          categoryId: 1
        }
      }).then((res) => {
        this.phoneList = res.data
      }),

      this.axios.get('http://localhost:8080/index/product', {
        params: {
          categoryId: 3
        }
      }).then((res) => {
        this.compList = res.data
      }),

      this.axios.get('http://localhost:8080/index/product', {
        params: {
          categoryId: 2
        }
      }).then((res) => {
        this.TVList = res.data
      })

      this.axios.get('http://localhost:8080/index/product', {
        params: {
          categoryId: 9
        }
      }).then((res) => {
        this.luyouList = res.data
      })


    },
    getCartCount () {
      // 这里的res = 0 是当res为空时，设置默认值0
      this.axios.get('/carts/products/sum').then((res = 0) => {
        this.$store.dispatch('saveCartCount', res)
      })
    }
  }
}
</script>

<style lang="scss">
  // 先设置<style lang="scss">允许使用scss；再导入scss定义的公共样式
  // base.scss抽取并复用.container{...}、a{img{...}}公用样式，所以这里省略不写了
  @import './../assets/scss/base.scss';
  @import './../assets/scss/mixin.scss';
  @import './../assets/scss/config.scss';
  .header {
    .nav-topbar {
      height: 39px;
      line-height: 39px;
      background-color: $colorB;
      color: #B0B0B0;
      .container {
        // flex弹性布局，水平、垂直居中
        @include flex();
        a{
          display: inline-block;
          // .nav-topbar中的color对a标签内的字体颜色不起作用，再设置一次(这里的优先级最高)
          color: #B0B0B0;
          margin-right: 17px;
        }
        .my-cart{
          width:110px;
          background-color:$colorA;
          text-align:center;
          color:#ffffff;
          margin-right:0;
          .icon-cart{
            // url默认从public中找
            @include bgImg(16px,12px,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon-cart-checked.png');
            margin-right: 4px;
          }
        }
      }
    }
    .nav-header{
      .container{
        position: relative;
        height: 112px;
        // scss语法，@include 方法名() , 即调用xx.scss种定义的那个方法
        @include flex();
        .header-logo{
          display: inline-block;
          width: 55px;
          height: 55px;
          background-color: $colorA;
          a{
            display: inline-block;
            width: 110px;
            height: 55px;
            // 等价 a:before，这里是scss的写法
            &:before{
              content: ' ';  // 一定要加用来占位，不加伪类就没了
              @include bgImg(55px,55px,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/mi-logo.png',55px);
              // 配合鼠标悬停:hover，对margin属性实现过渡动画0.2秒完成
              transition: margin 0.2s;
            }
            &:after{
              content: ' ';
              @include bgImg(55px,55px,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/mi-home.png',55px);
            }
            // 将伪类:before设置鼠标悬停向左移动55px
            &:hover:before{
              margin-left: -55px;
            }
          }
        }
        .header-menu{
          display: inline-block;
          width: 643px;
          padding-left: 209px;
          .item-menu{
            display: inline-block;
            color: $colorB;
            font-weight: normal;
            font-size: 16px;
            line-height: 112px;
            margin-right: 20px;
            span{
              cursor: pointer;
            }
            &:hover{
              color: $colorA;
              // 鼠标悬停到菜单上，显示对应菜单的下拉框，高度从0->220,透明度从0->1
              .children{
                height: 220px;
                opacity: 1;
              }
            }
            .children{
              //.nav-header下的.container设置了相对定位，以这个位置为基准
              position: absolute;
              top: 112px;
              left: 0;
              width: 1226px;
              height: 0;
              opacity: 0;
              overflow: hidden;
              border-top: 1px solid #E5E5E5;
              box-shadow: 0px 7px 6px 0px rgba(0,0,0,0.11);
              z-index: 10;
              transition: all 0.5s;
              background-color: #ffffff;
              .product{
                position: relative;
                float: left;
                width: 16.6%;
                height: 220px;
                font-size: 12px;
                line-height: 12px;
                text-align: center;
                a{
                  // a是行内标签，要设置成块级，这样a包括的内容会撑开a，易于检查
                  display: inline-block;
                }
                img{
                  width: auto;
                  height: 111px;
                  margin-top: 26px;
                }
                .pro-img{
                  height: 137px;
                }
                .pro-name{
                  font-weight: bold;
                  margin-top: 19px;
                  margin-bottom: 8px;
                  color: $colorB;
                }
                .pro-price{
                  color: $colorA;
                }
                &:before{
                  // 当前.product设置了相对定位，.product的伪类以这个位置为基准
                  content: '';
                  position: absolute;
                  top: 28px;
                  right: 0;
                  border-left: 1px solid $colorF;
                  height: 100px;
                  width: 1px;
                }
                // 最后一个<li class=product>的伪类:before去掉(不显示)
                &:last-child:before{
                  display: none;
                }
              }
            }
          }
        }
        .header-search{
          width: 319px;
          .wapper{
            height: 50px;
            border: 1px solid #E0E0E0;
            display: flex;
            align-items: center;
            input{
              // 去除浏览器内置的边框样式
              border: none;
              // 设置了box-sizing则整个input宽度总和是264px(包括了padding值)，否则padding而外算，叠加了！
              box-sizing: border-box;
              border-right: 1px solid #E0E0E0;
              width: 264px;
              height: 50px;
              padding-left: 14px;
            }
            a{
              @include bgImg(18px,18px,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon-search.png');
              margin-left: 17px;
            }
          }
        }
      }
    }
  }
</style>
