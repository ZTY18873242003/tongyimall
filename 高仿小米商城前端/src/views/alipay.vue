<template>
  <div class="ali-pay">
    <loading v-if='loading'></loading>
    <!-- content是<form action='支付宝付款页面链接'></form> -->
    <div v-html="content"></div>
  </div>
</template>
<script>
import Loading from './../components/Loading'
export default {
  name: 'alipay',
  components: {
    Loading
  },
  data () {
    return {
      orderId: this.$route.query.orderId,
      content: '',
      loading: true
    }
  },
  mounted () {
    this.paySubmit()
  },
  methods: {
    paySubmit () {
      this.axios.post('/pay', {
        orderId: this.orderId,
        orderName: 'Vue高仿小米商城',
        amount: 0.01, // 单位元
        payType: 1 // 1支付宝，2微信
      }).then((res) => {
        this.content = res.content
        setTimeout(() => {
          // 获取该页面的第一个表单进行submit()提交表单，
          // 即触发表单action跳转到支付宝付款页面
          document.forms[0].submit()
        }, 100)
      })
    }
  }
}
</script>
