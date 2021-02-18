<template>
  <div class="loading">
    <img src="/imgs/loading-svg/loading-bars.svg">
  </div>
</template>
<script>
export default {
  name: 'loading'
}
</script>
<style lang="scss">
  .loading{
    height:80px;
    line-height:80px;
    text-align:center;
    padding:30px 0;
    img{
      height:100%;
    }
  }
</style>
