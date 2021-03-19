<template>
  <div class="product">
    <product-param :title="product.name">
      <template v-slot:buy>
        <button class="btn" @click="addCart()">立即购买</button>
      </template>
    </product-param>

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

    <div class="content">
      <div class="item-bg">
        <h2>{{product.name}}</h2>
        <h3>{{product.subtitle}}</h3>
        <div class="price">
          <span>￥<em>{{product.price}}</em></span>
        </div>
      </div>
      <div class="item-bg-2"></div>
      <div class="item-bg-3"></div>
      <div class="item-swiper">
<!--        轮播图四个-->
        <swiper :options="swiperOption">
            <swiper-slide><img src="https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/gallery-2.png"></swiper-slide>
            <swiper-slide><img src="https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/gallery-3.png"></swiper-slide>
            <swiper-slide><img src="https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/gallery-4.png"></swiper-slide>
            <swiper-slide><img src="https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/gallery-6.jpg"></swiper-slide>

            <!-- Optional controls -->
            <div class="swiper-pagination" slot="pagination"></div>
        </swiper>
        <p class="desc">小米11 AI变焦双摄拍摄</p>
      </div>
      <div class="item-video">
        <h2>60帧超慢动作摄影<br/>慢慢回味每一瞬间的精彩</h2>
        <p>后置960帧电影般超慢动作视频，将眨眼间的美妙展现得淋漓尽致！<br/>更能AI 精准分析视频内容，15个场景智能匹配背景音效。</p>
        <div class="video-bg" @click="showSlide='slideDown'"></div>
        <div class="video-box" v-show="showSlide">
          <div class="overlay"></div>
          <div class="video" :class="showSlide">
            <span class="icon-close" @click="closeVideo"></span>
            <video src="https://cdn.cnbj1.fds.api.mi-img.com/product-images/mi11/section2-2.mp4" muted autoplay controls="controls"></video>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { swiper, swiperSlide } from 'vue-awesome-swiper'
import ProductParam from './../components/ProductParam'
import Modal from "../components/Modal";
export default {
  name: 'product',
  components: {
    Modal,
    swiper,
    swiperSlide,
    // <ProductParam> 也可写成 <product-param>
    ProductParam
  },
  data () {
    return {
      showModal: false,

      showSlide: '', // 控制动画效果
      product: {}, // 商品信息
      swiperOption: {
        autoplay: true,
        slidesPerView: 3,
        spaceBetween: 30,
        freeMode: true,
        pagination: {
          el: '.swiper-pagination',
          clickable: true
        }
      }
    }
  },
  watch: {
    "$route": 'getProductInfo'    // 要watch route , 一旦发生变化，就调用 fetchData方法
  },
  mounted () {
    this.getProductInfo()
  },
  methods: {

    addCart (id) {
      let token;
      if(sessionStorage.getItem("token")){
        token=sessionStorage.getItem("token")
      }
      else {
        token='null'
      }
      let username= sessionStorage.getItem("username")
      const iid = this.$route.params.id;
      this.axios.post('http://localhost:8080/carts/push', {
        token:token.replace(/^\"|\"$/g,''),
        productId: iid,
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

    getProductInfo () {
      // 获取url中的参数32， 比如：http://localhost:8080/#/product/32
      const id = this.$route.params.id
      this.axios.get(`http://localhost:8080/product/getinfo`,{
        params: {
          'id':id,
        }}).then((res) => {
        this.product = res.data
      })
    },
    buy () {
      const id = this.$route.params.id
      this.$router.push(`/detail/${id}`)
    },
    closeVideo () {
      // 用这个方法是解决：v-show组件显示与动画不能执行完
      // 这里利用定时器，也设置成了0.6s完成slideUp上拉动画后，再将变量showSlide置空，从而隐藏组件
      this.showSlide = 'slideUp'
      setTimeout(() => {
        this.showSlide = ''
      }, 600)
    }
  }
}
</script>
<style lang="scss">
  @import './../assets/scss/mixin.scss';
  .product{
    .content{
      .item-bg{
        background:url('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/spokesman.jpg') no-repeat center;
        height:718px;
        text-align:center;
        h2{
          font-size:80px;
          padding-top:55px;
        }
        h3{
          font-size:24px;
          letter-spacing: 10px;
        }
        p{
          margin-top:21px;
          margin-bottom:40px;
          a{
            font-size:16px;
            color:#333333;
          }
          span{
            margin:0 15px;
          }
        }
        .price{
          font-size:30px;
          color:#333333;
          em{
            font-style:normal;
            font-size:38px;
          }
        }
      }
      .item-bg-2{
        background:url('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/product-bg-2.png') no-repeat center;
        height:480px;
        background-size:1226px 397px;
      }
      .item-bg-3{
        background:url('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/product-bg-3.png') no-repeat center;
        height:638px;
        background-size:cover;
      }
      .item-swiper{
        margin:36px auto 52px;
        .desc{
          font-size:18px;
          color:#333333;
          text-align:center;
        }
        img{
          width:100%;
        }
      }
      .item-video{
        height:1044px;
        background-color:#070708;
        margin-bottom:76px;
        color:#FFFFFF;
        text-align:center;
        h2{
          font-size:60px;
          padding-top:82px;
          margin-bottom:47px;
        }
        p{
          font-size:24px;
          margin-bottom:58px;
        }
        .video-bg{
          background:url('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/gallery-1.png') no-repeat center;
          background-size:cover;
          width:1226px;
          height:540px;
          margin:0 auto 120px;
          cursor:pointer;
        }
        .video-box{
          .overlay{
            @include position(fixed);
            background-color:#333333;
            opacity:.4;
            z-index:10;
          }
          @keyframes slideDown{
            from{
              top:-50%;
              opacity:0;
            }
            to{
              top:50%;
              opacity:1;
            }
          }
          @keyframes slideUp{
            from{
              top:50%;
              opacity:1;
            }
            to{
              top:-50%;
              opacity:0;
            }
          }
          .video{
            position:fixed;
            top:50%;
            left:50%;
            transform:translate(-50%,-50%);
            z-index:10;
            width:1000px;
            height:536px;
            &.slideDown{
              animation:slideDown 0.6s linear;
            }
            &.slideUp{
              animation:slideUp 0.6s linear;
            }
            .icon-close{
              position:absolute;
              top:20px;
              right:20px;
              @include bgImg(20px,20px,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon-close.png');
              cursor:pointer;
              z-index:15;
            }
            video{
              width:100%;
              height:100%;
              object-fit:cover;
              outline:none;
            }
          }
        }
      }
    }
    button{
      margin-left:10px;
    }
  }
</style>
