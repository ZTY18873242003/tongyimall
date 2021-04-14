<template>
  <div class="nav-bar" :class="{'is_fixed':isFixed}">
    <div class="container">
      <div class="pro-title">
        {{title}}
      </div>
      <div class="pro-param">
        <a href="javascript:;">概述</a><span>|</span>
        <a href="javascript:;">参数</a><span>|</span>
        <a href="javascript:;">用户评价</a>
        <slot name="buy"></slot>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'product-param',
  props: {
    title: String
  },
  data () {
    return {
      isFixed: false
    }
  },
  mounted () {
    // 挂在后，让window监听叫'scroll'的this.initHeight()方法
    window.addEventListener('scroll', this.initHeight)
  },
  methods: {
    initHeight () {
      const scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
      // 当垂直滚动距离大于152返回true，则this.isFixed = true，添加is_fixed类名
      this.isFixed = scrollTop > 152
    }
  },
  destroyed () {
    // 页面销毁时，取消window对'scroll'的监听，不然跳转到别的页面还是会存在该方法的监听
    window.removeEventListener('scroll', this.initHeight, false)
  }
}
</script>
<style lang="scss">
  @import './../assets/scss/config.scss';
  @import './../assets/scss/mixin.scss';
  .nav-bar{
    height:70px;
    line-height:70px;
    border-top:1px solid $colorH;
    background-color:$colorG;
    z-index:10;
    &.is_fixed{
      position:fixed;
      top:0;
      width:100%;
      box-shadow: 0 5px 5px $colorE;
    }
    .container{
      @include flex();
      .pro-title{
        font-size:$fontH;
        color:$colorB;
        font-weight:bold;
      }
      .pro-param{
        font-size:$fontJ;
        span{
          margin:0 10px;
        }
        a{
          color:$colorC;
        }
      }
    }
  }
</style>
