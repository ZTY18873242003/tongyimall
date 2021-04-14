/**
 * 商城Vuex-actions
 * 每个方法的第一个参数：context（上下文）
 *          第二个参数：接收的传参
 */
export default {
  // 通过：this.$store.dispatch('saveUserName',传参)，来触发actions.js中的saveUserName()方法
  // actions.js中的saveUserName()方法，再触发mutations.js中的saveUserName()方法
  // 【context.commit()触发的方法名根据mutations.js设置的来定义，一般都取相同的名字来命名】
  saveUserName (context, username) {
    context.commit('saveUserName', username)
  },
  saveCartCount (context, count) {
    context.commit('saveCartCount', count)
  }
}
