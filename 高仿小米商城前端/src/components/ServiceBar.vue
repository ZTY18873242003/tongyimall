<template>
  <div class="service">
    <div class="container">
      <ul>
        <li><span class="icon-setting"></span>预约维修服务</li>
        <li><span class="icon-7day"></span>7天无理由退货</li>
        <li><span class="icon-15day"></span>15天免费换货</li>
        <li><span class="icon-post"></span>满150元包邮</li>
      </ul>
    </div>
  </div>
</template>
<script>
export default {
  name: 'service-bar'
}
</script>
<style lang="scss" scoped>
  @import './../assets/scss/mixin.scss';
  @import './../assets/scss/config.scss';
  .service{
    padding:33px 0;
    color:$colorC;
    font-size:16px;
    li{
      display:inline-block;
      width:24.9%;
      text-align:center;
      border-right:1px solid $colorH;
      span{
        display:inline-block;
        width:20px;
        height:20px;
        vertical-align: middle;
        margin-right:8px;
      }
      .icon-setting{
        @include bgImg(20px,20px,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon-setting.png');
      }
      .icon-7day{
        @include bgImg(20px,20px,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon-7day.png');
      }
      .icon-15day{
        @include bgImg(20px,20px,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon-15day.png');
      }
      .icon-post{
        @include bgImg(20px,20px,'https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon-post.png');
      }
    }

  }
</style>
