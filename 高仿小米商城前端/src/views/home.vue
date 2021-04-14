<template>
  <div>
    <NavHeader></NavHeader>
    <!-- 用于嵌套别的.vue组件，访问不同的路径，则显示不同的.vue组件
         这里home.vue中替换detail.vue、 index.vue、 product.vue这三块具有相同的头部导航和底部导航，增加组件复用性
         为什么会加载对应的.vue到<router-view>中呢? 因为配置的home路由下还配置了该子路由children,放着对应的.vue
    -->
    <router-view></router-view>
    <NavFooter></NavFooter>
  </div>
</template>
<script>
import NavHeader from './../components/NavHeader'
import NavFooter from './../components/NavFooter'
export default {

  name: 'home',
  components: {
    // 当键名与值名相同，可省略写一个, ES6增强的写法
    NavHeader,
    NavFooter
  }
}
</script>
