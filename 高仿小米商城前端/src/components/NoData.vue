<template>
  <div class="no-data">
    <img src="https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/icon-no-data.png">
    <p>当前暂无提交的订单记录.</p>
  </div>
</template>
<script>
export default {
  name: 'no-data'
}
</script>
<style lang="scss">
  .no-data{
    text-align:center;
    font-size:20px;
    color:#999999;
    margin:50px 0;
    img{
      width:240px;
      height:180px;
      margin-bottom:30px;
    }
  }
</style>
