<template>
  <div class="index">
    <div class="container">
      <div class="swiper-box">
        <div class="nav-menu">
          <ul class="menu-wrap" v-for="(kind,i) in cateList" :key="i">
            <li class="menu-item">
              <a href="javascript:;">{{kind.name}}</a>
              <div class="children">
                <ul v-for="(item,i) in kind.menuList" :key="i">
                  <li v-for="(sub,j) in item" :key="j">
                    <a :href="sub?'/#/product/'+sub.good_id:''">
                      <img :src="sub?sub.icon:''">
                      {{sub?sub.name:''}}
                    </a>
                  </li>
                </ul>
              </div>
            </li>

          </ul>
        </div>

        <!--        变换图-->
        <swiper :options="swiperOption">
          <swiper-slide v-for="(item,index) in slideList" :key="index">
            <a :href="item.url"><img :src="item.img"></a>
          </swiper-slide>
          <!-- Optional controls -->
          <div class="swiper-pagination"  slot="pagination"></div>
          <div class="swiper-button-prev" slot="button-prev"></div>
          <div class="swiper-button-next" slot="button-next"></div>
        </swiper>
      </div>

      <!--        变换图下的四个小图-->
      <div class="ads-box">
        <a :href="'/#/product/'+item.id" v-for="(item,index) in adsList" :key="index">
          <img v-lazy="item.img">
        </a>
      </div>

      <!--      横幅广告-->
    </div>


    <div class="banner">
      <a href="/#/product/30">
        <img src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/431e5fd6bfd1b67d096928248be18303.jpg?thumb=1&w=1226&h=120&f=webp&q=90">
      </a>
    </div>


    <div class="product-box">
      <div class="container">

        <div class="box-hd">
          <div class="title">手机</div>
          <div class="more" id="phonemore">
            <a href="//www.mi.com/a/h/14933.html" target="_blank" class="more-link">查看全部
              <i class="el-icon-caret-right"></i></a>
          </div>
        </div>


        <div class="box-bd">
          <div class="promo-list">
            <router-link to>
              <img :src="'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cb1bd61ad71c45a4f67f09b075463944.jpeg?thumb=1&w=234&h=614&f=webp&q=90'" />
            </router-link>
          </div>


          <div class="list-box">
            <MyList :list="HotphoneList" :isMore="false"></MyList>
          </div>

        </div>
      </div>
    </div>


    <div class="banner">
      <a href="/#/product/30">
        <img :src="'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/41d16e66381cfeda7b6b39ab67678d5e.jpg?thumb=1&w=1226&h=120&f=webp&q=90'">
      </a>
    </div>

    <div class="product-box">
      <div class="container">

        <div class="box-hd">
          <div class="title">家电</div>
          <div class="more" id="more">
            <MyMenu :val="2" @fromChild="getChildMsg2">
              <span slot="1">热门</span>
              <span slot="2">电视影音</span>
            </MyMenu>
          </div>
        </div>

        <div class="box-bd">
          <!--          左下角长短高长图-->
          <div class="promo-list">
            <ul>
              <li>
                <img :src="'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/116fc43816b87192be4e67cf762e8da5.jpeg?thumb=1&w=234&h=300&f=webp&q=90'" alt />
              </li>
              <li>
                <img :src="'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1e82177bd8c8cd140e0e582ecaa886dc.jpg?thumb=1&w=234&h=300&f=webp&q=90'" alt />
              </li>
            </ul>

          </div>

          <div class="list-box">
            <MyList :list="applianceList2" :isMore="true"></MyList>
          </div>

        </div>
      </div>
    </div>



    <div class="banner">
      <a href="/#/product/30">
        <img :src="'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/59e8fc8ba9718c266882719fb4bbcedd.webp'">
      </a>
    </div>

    <div class="product-box">
      <div class="container">

        <div class="box-hd">
          <div class="title">智能</div>
          <div class="more" id="magicmore">
            <MyMenu :val="3" @fromChild="getChildMsg3">
              <span slot="1">热门</span>
              <span slot="2">安防</span>
              <span slot="3">出行</span>
            </MyMenu>
          </div>
        </div>

        <div class="box-bd">
          <!--          左下角长短高长图-->
          <div class="promo-list">
            <ul>
              <li>
                <img :src="'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/ffe114f73fac3a45e5622c3eff56106b.webp'" alt />
              </li>
              <li>
                <img :src="'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/a660ce095e8f553a9ed1515265f4e9fc.webp'" alt />
              </li>
            </ul>
          </div>
          <div class="list-box">
            <MyList :list="applianceList3" :isMore="true"></MyList>
          </div>
        </div>
      </div>
    </div>


    <div class="banner">
      <a href="/#/product/30">
        <img :src="'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/b34997348887380ab4d19587fa1a711c.webp'">
      </a>
    </div>

    <div class="product-box">
      <div class="container">

        <div class="box-hd">
          <div class="title">搭配</div>
          <div class="more" id="wearmore">
            <MyMenu :val="2" @fromChild="getChildMsg4">
              <span slot="1">热门</span>
              <span slot="2">耳机音箱</span>
            </MyMenu>
          </div>
        </div>

        <div class="box-bd">
          <!--          左下角长短高长图-->
          <div class="promo-list">
            <ul>
              <li>
                <img :src="'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/6874615b3c50e837ffe532eb6ea4ef1a.webp'" alt />
              </li>
              <li>
                <img :src="'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/9f6c89cf21efc23799f6130224cef007.webp'" alt />
              </li>
            </ul>
          </div>
          <div class="list-box">
            <MyList :list="applianceList4" :isMore="true"></MyList>
          </div>
        </div>
      </div>
    </div>


    <div class="banner">
      <a href="/#/product/30">
        <img :src="'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/1615d1842fe85914a545297836a44271.webp'">
      </a>
    </div>

    <div class="product-box">
      <div class="container">

        <div class="box-hd">
          <div class="title">配件</div>
          <div class="more" id="smallmore">
            <MyMenu :val="2" @fromChild="getChildMsg5">
              <span slot="1">热门</span>
              <span slot="2">充电器</span>
            </MyMenu>
          </div>
        </div>

        <div class="box-bd">
          <!--          左下角长短高长图-->
          <div class="promo-list">
            <ul>
              <li>
                <img :src="'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/9f64bbd58c3f5001bdf0688894f22cb6.webp'" alt />
              </li>
              <li>
                <img :src="'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/ffe4182f1d9a5befdf2380ec90ae1620.webp'" alt />
              </li>
            </ul>
          </div>
          <div class="list-box">
            <MyList :list="applianceList5" :isMore="true"></MyList>
          </div>
        </div>
      </div>
    </div>



    <div class="banner">
      <a href="/#/product/30">
        <img :src="'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9880db34d227b6c1df5b45cb7df4f465.jpg?thumb=1&w=1226&h=120&f=webp&q=90'">
      </a>
    </div>

    <div class="product-box">
      <div class="container">

        <div class="box-hd">
          <div class="title">周边</div>
          <div class="more" id="aroundmore">
            <MyMenu :val="2" @fromChild="getChildMsg6">
              <span slot="1">热门</span>
              <span slot="2">出行</span>
            </MyMenu>
          </div>
        </div>

        <div class="box-bd">
          <!--          左下角长短高长图-->
          <div class="promo-list">
            <ul>
              <li>
                <img :src="'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/ca0940f052227d235e7de5678d106c89.webp'" alt />
              </li>
              <li>
                <img :src="'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/0497ba8520dc4aca9d55e6b841d42331.webp'" alt />
              </li>
            </ul>
          </div>
          <div class="list-box">
            <MyList :list="applianceList6" :isMore="true"></MyList>
          </div>
        </div>
      </div>
    </div>

    <div class="banner">
      <a href="/#/product/30">
        <img :src="'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/88e35cffc82cd98cd53172460067af17.webp'">
      </a>
    </div>

    <div class="product-box">
      <div class="container">
      <div class="recommend-header">
        <h2 class="title">推荐</h2>
        <div class="control-part">
				<span @click="slidePre"
                class="control control-left" >
					<i class="el-icon-arrow-left"></i>
				</span>
          <span @click="slideNext"
                  class="control control-right">

					<i class="el-icon-arrow-right"></i>
				</span>
        </div>
      </div>
      <div class="recommend-wrap">
        <ul class="recommend-content clearfix">
          <li class="recomend-item"
              v-for="item in recomend">
            <a :href="'/#/product/'+item.goodid" target="_blank">
              <img class="item-image" :src="item.imgUrl" alt="" />
              <h3 class="item-name">{{item.name}}</h3>
              <p class="item-price">
                {{item.price}}元
              </p>
            </a>
          </li>
        </ul>
      </div>
      </div>
    </div>

    <!--    预约维修服务,7天无理由退货-->


    <ServiceBar></ServiceBar>

    <Modal
      title="提示"
      sureText="查看购物车"
      cancelText="取消"
      btnType="3"
      modalType="middle"
      :showModal="showModal"
      @submit="goToCart"
      @cancel="showModal=false">
      <template v-slot:body>
        <p>商品添加成功！</p>
      </template>
    </Modal>
  </div>
</template>
<script>
import ServiceBar from './../components/ServiceBar'
import Modal from './../components/Modal'

import { swiper, swiperSlide } from 'vue-awesome-swiper'
import 'swiper/dist/css/swiper.css'
import MyList from "../components/MyList";
import MyMenu from "../components/MyMenu";
export default {
  name: 'index',
  components: {
    MyMenu,
    MyList,
    swiper,
    swiperSlide,
    ServiceBar,
    Modal,
  },
  data () {
    return {
      swiperOption: {
        autoplay: true,
        loop: true,
        effect: 'cube',
        cubeEffect: {
          shadowOffset: 100,
          shadowScale: 0.6
        },
        pagination: {
          el: '.swiper-pagination',
          clickable: true
        },
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
        }
      },

      currentPage:1,// 当前页码
      pageSize:8,// 每页大小
      total:64,

      //变换图
      slideList: [
        {
          id: '1',
          img: 'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/aa6133dcd2cca53b77f4ad79551628df.jpg',
          url: 'https://www.mi.com/redmik40?product_id=1210500091'
        },
        {
          id: '2',
          img: 'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/28ce93203d5a18c2e8530a47992c55f4.webp',
          url: 'https://www.mi.com/redmibook/pro14?product_id=10000279'
        },
        {
          id: '3',
          img: 'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/lunbo1.webp',
          url: 'https://www.mi.com/redmitv/98?product_id=1201300006'
        },
        {
          id: '4',
          img: 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/289e412870426ffb5bcdcfa9ba0676df.jpg?thumb=1&w=1226&h=460&f=webp&q=90',
          url: 'https://www.mi.com/airenergy?product_id=1185000014'
        }
      ],

      cateList:[]
      ,
      adsList: [
        {
          url:'https://www.mi.com/buy/detail?product_id=12511',
          img: 'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/5d4298059889417157e8492750328492.jpg'
        },
        {
          url:'',
          img: 'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/ads-2.jpg'
        },
        {
          url:'',
          img: 'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/ads-3.png'
        },
        {
          url:'https://www.mi.com/buy/detail?product_id=12931',
          img: 'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/lunboxia1.jpg'
        }
      ],
      HotphoneList: [],

      TVList:[],
      HotTVList:[],
      applianceList2:[],

      magicList:[],
      HotmagicList:[],
      applianceList3:[],


      wearList:[],
      HotwearList:[],
      applianceList4:[],


      smallList:[],
      HotsmallList:[],
      applianceList5:[],


      roundList:[],
      HotroundList:[],
      applianceList6:[],

      showModal: false,

      applianceActive2: 1, // 家电当前选中的商品分类
      applianceActive3: 1, // 智能当前选中的商品分类
      applianceActive4: 1, // 搭配当前选中的商品分类
      applianceActive5: 1, // 配件当前选中的商品分类
      applianceActive6: 1, // 周边当前选中的商品分类


      currPage: 0,
      evtNextStatus: true,
      evtPreStatus: true,
      recomend:[],
      recomends: []
    }
  },
  mounted () {
    this.init()
  },
  watch: {
    // 家电当前选中的商品分类，响应不同的商品数据
    applianceActive2: function (val) {
      if (val === 1) {
        // 1为热门商品
        this.applianceList2 = this.HotTVList;
        return;
      }
      if (val === 2) {
        // 2为电视商品
        this.applianceList2 = this.TVList;
      }},
    applianceActive3: function (val) {
      if (val === 1) {
        this.applianceList3 = this.HotmagicList;
        return;
      }
      if (val === 2) {
        this.applianceList3 = this.magicList;
      }
    },
    applianceActive4: function (val) {
      if (val === 1) {
        // 1为热门商品
        this.applianceList4 = this.HotwearList;
        return;
      }
      if (val === 2) {
        // 2为电视商品
        this.applianceList4 = this.wearList;
      }
    },
    applianceActive5: function (val) {
      // 所以在切换商品列表时判断applianceHotList是否为空,为空则是第一次切换,把applianceList赋值给applianceHotList
      if (val === 1) {
        // 1为热门商品
        this.applianceList5 = this.HotsmallList;
        return;
      }
      if (val === 2) {
        // 2为电视商品
        this.applianceList5 = this.smallList;
      }
    },
    applianceActive6: function (val) {
      // 所以在切换商品列表时判断applianceHotList是否为空,为空则是第一次切换,把applianceList赋值给applianceHotList
      if (val === 1) {
        // 1为热门商品
        this.applianceList6 = this.HotroundList;
        return;
      }
      if (val === 2) {
        // 2为电视商品
        this.applianceList6 = this.roundList;
      }
    }
  },

  methods: {

    init () {
      this.axios.get('http://localhost:8080/index/category',
      ).then((res) => {
        this.cateList=res.data.cateList
      })

      this.axios.get('http://localhost:8080/index/productfoot', {
        params: {
          categoryId: 1
        }
      }).then((res) => {
        this.HotphoneList = res.data.slice(0,8);
      })


      this.axios.get('http://localhost:8080/index/productfoot', {
        params: {
          categoryId: 2
        }
      }).then((res) => {
        this.HotTVList=res.data.slice(0,8);
        // 页面初始化的时候把HoTVtList(热门家电商品列表)直接赋值给applianceList(家电商品列表)
        this.applianceList2 = this.HotTVList;
      })
      this.axios.get('http://localhost:8080/index/productfootnormal', {
        params: {
          categoryId: 2
        }
      }).then((res) => {
        this.TVList = res.data.slice(0,8);
      })



      this.axios.get('http://localhost:8080/index/productfoot', {
        params: {
          categoryId: 3
        }
      }).then((res) => {
        this.HotmagicList=res.data.slice(0,8);
        this.applianceList3 = this.HotmagicList;
      })
      this.axios.get('http://localhost:8080/index/productfootnormal', {
        params: {
          categoryId: 3
        }
      }).then((res) => {
        this.magicList = res.data.slice(0,8);
      })


      this.axios.get('http://localhost:8080/index/productfoot', {
        params: {
          categoryId: 4
        }
      }).then((res) => {
        this.HotwearList=res.data.slice(0,8);
        this.applianceList4 = this.HotwearList;
      })
      this.axios.get('http://localhost:8080/index/productfootnormal', {
        params: {
          categoryId: 4
        }
      }).then((res) => {
        this.wearList = res.data.slice(0,8);
      })

      this.axios.get('http://localhost:8080/index/productfoot', {
        params: {
          categoryId: 5
        }
      }).then((res) => {
        this.HotsmallList=res.data.slice(0,8);
        this.applianceList5 = this.HotsmallList;
      })
      this.axios.get('http://localhost:8080/index/productfootnormal', {
        params: {
          categoryId: 5
        }
      }).then((res) => {
        this.smallList = res.data.slice(0,8);
      })


      this.axios.get('http://localhost:8080/index/productfoot', {
        params: {
          categoryId: 6
        }
      }).then((res) => {
        this.HotroundList=res.data.slice(0,6);
        this.applianceList6 = this.HotroundList;
      })
      this.axios.get('http://localhost:8080/index/productfootnormal', {
        params: {
          categoryId: 6
        }
      }).then((res) => {
        this.roundList = res.data.slice(0,8);
      })



      this.axios.get('http://localhost:8080/index/suggest').then((res)=>{
        this.recomends = res.sugglist;
        this.recomend=this.recomends.slice(0,5)
      })

    },

    getChildMsg2(val) {
      this.applianceActive2 = val;
    },
    getChildMsg3(val) {
      this.applianceActive3 = val;
    },
    getChildMsg4(val) {
      this.applianceActive4 = val;
    },
    getChildMsg5(val) {
      this.applianceActive5 = val;
    },
    getChildMsg6(val) {
      this.applianceActive6 = val;
    },

    addCart (id) {
      let token
      if(sessionStorage.getItem("token")){
        token=sessionStorage.getItem("token")
      }
      else {
        token='null'
      }
      let username= sessionStorage.getItem("username")
      this.axios.post('http://localhost:8080/carts/push', {
        token:token.replace(/^\"|\"$/g,''),
        productId: id,
        username: username,
        select: true

      }).then((res) => {
        this.showModal = true
        this.$store.dispatch('saveCartCount', res.cartTotalQuantity)
      })
    },
    goToCart () {
      this.$router.push('/cart')
    },

    slideNext () {
      if(this.currPage === Math.floor((this.recomends.length-1)/5)){
        this.currPage--;
        this.$alert('已经是最后一页了', '', {
          confirmButtonText: '确定',
          callback: action => {
          }
        });
      }
      this.currPage++
      this.recomend=this.recomends.slice(5*this.currPage,5*(this.currPage+1))
    },
    slidePre () {
      if(this.currPage===0){
        this.currPage++;
        this.$alert('已经是第一页了', '', {
          confirmButtonText: '确定',
          callback: action => {
          }
        });
      }
      this.currPage--
      this.recomend=this.recomends.slice(5*this.currPage,5*(this.currPage+1))
    }

  }
}
</script>
<style lang="scss">
  @import './../assets/scss/config.scss';
  @import './../assets/scss/mixin.scss';

  .index{
    .swiper-box{
      .nav-menu{
        position:absolute;
        width:264px;
        height:451px;
        z-index:5;
        padding:23px 0;
        // 带透明度的背景色
        background-color:#55585a7a;
        box-sizing:border-box;
        .menu-wrap{
          .menu-item{
            height:43px;
            line-height:40px;
            a{
              position:relative;
              display:block;
              font-size:16px;
              color:#ffffff;
              padding-left:30px;
              &:after{
                position:absolute;
                right:30px;
                top:17.5px;
                content:' ';
                @include bgImg(10px,15px,'/imgs/icon-arrow.png');
              }
            }
            &:hover{
              background-color:$colorA;
              .children{
                display:block;
              }
            }
            .children{
              display:none;
              width:962px;
              height:451px;
              background-color:$colorG;
              position:absolute;
              top:0;
              left:264px;
              border:1px solid $colorH;
              ul{
                display:flex;
                justify-content:space-between;
                height:75px;
                li{
                  height:75px;
                  line-height:75px;
                  flex:1;
                  padding-left:23px;
                  a{
                    color:$colorB;
                    font-size:14px;
                    img{
                      width:42px;
                      height:35px;
                      vertical-align:middle;
                      margin-right:15px;
                    }
                  }
                }
              }
            }
          }
        }
      }
      .swiper-container {
        height: 451px;
        .swiper-button-prev{
          left:274px;
        }
        img{
          width:100%;
          height:100%;
        }
      }
    }
    .ads-box{
      @include flex();
      margin-top:14px;
      margin-bottom:31px;
      a{
        width:296px;
        height:167px;
        // img{  base.scss写过了
        //   width:100%;
        //   height:100%;
        // }
      }
    }
    .banner{

    }
    .product-box{
      background-color:$colorJ;
      padding:30px 0 50px;
      h2{
        margin: 0;
        font-size: 22px;
        font-weight: 200;
        line-height: 58px;
        color: #333;
      }
      .PreOrNext{
        margin-left: 800px;
      }

      .box-hd {
        height: 58px;
        margin: 20px 0 0 0;
      }

      .box-hd .title {
        float: left;
        font-size: 22px;
        font-weight: 200;
        line-height: 58px;
        color: #333;
      }

      .box-hd .more {
        float: right;
      }

      .box-hd .more a {
        font-size: 16px;
        line-height: 58px;
        color: #424242;
      }

      .box-hd .more a:hover {
        color: #ff6700;
      }


      .box-bd {
        height: 615px;
      }

      .box-bd .promo-list {
        float: left;
        height: 615px;
        width: 234px;
      }

      .box-bd .promo-list li {
        z-index: 1;
        width: 234px;
        height: 300px;
        margin-bottom: 14.5px;
        -webkit-transition: all 0.2s linear;
        transition: all 0.2s linear;
      }

      .box-bd .promo-list li:hover {
        z-index: 2;
        -webkit-box-shadow: 0 15px 30px rgba(0, 0, 0, .1);
        box-shadow: 0 15px 30px rgba(0, 0, 0, .1);
        -webkit-transform: translate3d(0, -2px, 0);
        transform: translate3d(0, -2px, 0);
      }

      .box-bd .promo-list li img {
        width: 234px;
        height: 300px;
      }

      .box-bd .promo-list img {
        width: 234px;
      }

      .box-bd .list {
        float: left;
        height: 615px;
        width: 991px;
      }

    }

    .recommend-container {
      background-color: $colorJ;
      width: 1226px;
      height: auto;
      margin: 0 auto;
    }

    .recommend-header {
      position: relative;
      .title {
        margin: 0;
        font-size: 22px;
        font-weight: 200;
        line-height: 58px;
        color: #333;
      }
      .control-part {
        position: absolute;
        top: 10px;
        right: 0;
        float: left;
        display: block;
        .control {
          display: block;
          float: left;
          width: 34px;
          height: 23px;
          line-height: 23px;
          text-align: center;
          border: 1px solid #e0e0e0;
          cursor: pointer;
          &:hover {
            .icon-arrow {
              color: #ff6700;
            }
          }
          &.disable {
            &:hover {
              .icon-arrow {
                color: #e0e0e0;
              }
            }
            .icon-arrow {
              color: #e0e0e0;
            }
          }
          .icon-arrow {
            color: #b0b0b0;
            font-size: 10px;
          }
        }
      }
    }
    .recommend-wrap {
      width: 1226px;
      height: 310px;
      overflow: hidden;
    }
    .recommend-content {
      width: auto;
      height: 300px;
      transition: all 0.3s;
      .recomend-item {
        float: left;
        display: block;
        width: 234px;
        height: 300px;
        margin: 0 13px 14px 0;
        font-size: 14px;
        background: #fff;
        cursor: pointer;
        transition: all 0.3s;
        &:hover {
          transform: translateY(-3px);
        }
        &:nth-last-child(5n+1) {
          margin-right: 0;
        }
        .item-image {
          display: block;
          width: 140px;
          height: 140px;
          margin: 40px auto 15px;
        }
        .item-name {
          margin-bottom: 10px;
          font-weight: normal;
          font-size: 14px;
          text-align: center;
          color: #333;
        }
        .item-price {
          margin-bottom: 10px;
          font-size: 14px;
          text-align: center;
          color: #ff6700;
        }
        .item-favorable {
          font-size: 14px;
          text-align: center;
          color: #757575;
        }
      }
    }

  }
</style>
