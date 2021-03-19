<template>
    <div class="footer">
      <div class="footer-logo">
        <img src="https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/logo-foot.png" alt="">
        <p>高仿小米商城</p>

      </div>

      <img class="logo-explan" src="http://s01.mifile.cn/i/v-logo-2.png" alt="" />
      <img class="logo-explan" src="http://s01.mifile.cn/i/v-logo-1.png" alt="" />
      <img class="logo-explan" src="http://s01.mifile.cn/i/v-logo-3.png" alt="" />
      <div class="footer-link">
        <a href="https://blog.csdn.net/Zhongtongyi" target="_blank">作者博客</a><span>|</span>
        <a href="http://mi.com" target="_blank">小米官网</a><span></span>
      </div>
      <div class="copyright">
        Copyright ©2021 <span class="domain">ZTY</span> All Rights Reserved.
      </div>

      <li class="footer-last-item">
        <div class="col-content">
          联系电话:<h3 class="phone-number">1887324200X</h3>
          <p class="phone-desc">
            周一至周日 9:00-22:00<br/>
          </p>
          <a href="//www.mi.com/service/contact" target="_blank">
								<span class="server-btn">
									<i></i>
									24小时在线客服
								</span>
          </a>
        </div>
      </li>

    </div>
</template>

<script>
export default {
  // 放入html被调用的标签名：<nav-footer></nav-footer>
  name: 'nav-footer'
}
</script>
<style lang="scss" scoped>
  @import './../assets/scss/config.scss';
  .footer{
    height:282px;
    border-top:4px solid $colorA;
    background-color:$colorB;
    color:$colorD;
    font-size:16px;
    text-align:center;
    .footer-logo{
      margin-top:46px;
      margin-bottom:31px;
      img{
        width:80px;
        height:80px;
        margin-bottom:13px;
      }
    }
    .footer-link{
      a{
        color:$colorD;
        display:inline-block;
      }
      span{
        margin:0 10px;
      }
      margin-bottom:13px;
    }
    .copyright{
      .domain{
        color:$colorA;
      }
    }

    .footer-last-item {
      float: left;
      .col-content {
        margin-top: -100px;
        margin-left: 1200px;
        .phone-number {
          margin: 0 0 5px;
          font-size: 22px;
          text-align: center;
          margin-bottom: 5px;
          color: #ff6700;
        }
        .phone-desc {
          font-size: 12px;
          line-height: 1.5;
          text-align: center;
          color: #616161;
        }
        .server-btn {
          display: block;
          width: 120px;
          height: 30px;
          line-height: 30px;
          font-size: 12px;
          text-align: center;
          margin: 0 auto;
          border: 1px solid #ff6700;
          color: #ff6700;
          cursor: pointer;
          &:hover {
            background: #ff6700;
            color: #fff;
          }
        }
      }
    }
  }
</style>
