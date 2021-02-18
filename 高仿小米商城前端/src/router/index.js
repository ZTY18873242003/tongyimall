import Vue from 'vue'
import VueRouter from 'vue-router'

// Vue加载插件的语法
Vue.use(VueRouter)

// 再导出VueRouter实例，这里格式是：VueRouter实例的参数是一个对象
export default new VueRouter({
  // routes(路由):即url输入对应的路径,加载显示对应的组件
  routes: [
    {
      path: '/',
      name: 'home', // 若这里取了name,则对应导入的component组件中也要定义相同的name: 'home'
      component: () => import('./../views/home.vue'),
      redirect: '/index', // 默认输入xxx:8080 跳转到 xxx:8080/index中
      children: [
        {
          // 示例：http://192.168.0.107:8080/index
          path: '/index',
          name: 'index',
          component: () => import('./../views/index.vue')
        },
        {
          // 动态路由(即url中可加参数并获取)：
          // http://192.168.0.107:8080/product/id(一个参数)
          path: '/product/:id',
          name: 'product',
          component: () => import('./../views/product.vue')
        },
        {
          // 动态路由(即可加参数并获取)：
          // http://192.168.0.107:8080/detail/id(一个参数)
          path: '/detail/:id',
          name: 'detail',
          component: () => import('./../views/detail.vue')
        }
      ]
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('./../views/login.vue')
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('./../views/Register.vue')
    },
    {
      path: '/cart',
      name: 'cart',
      component: () => import('./../views/cart.vue')
    },
    {
      path: '/order',
      name: 'order',
      component: () => import('./../views/order.vue'),
      children: [
        {
          path: '/order/list',
          name: 'order-list',
          component: () => import('./../views/orderList.vue')
        },
        {
          path: '/order/confirm',
          name: 'order-confirm',
          component: () => import('./../views/orderConfirm.vue')
        },
        {
          path: '/order/pay',
          name: 'order-pay',
          component: () => import('./../views/orderPay.vue')
        },
        {
          path: '/order/alipay',
          name: 'alipay',
          component: () => import('./../views/alipay.vue')
        }
      ]
    }
  ]
})
