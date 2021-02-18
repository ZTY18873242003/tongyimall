/**
 * 商城Vuex-mutations
 * 每个方法的第一个参数：state（状态）
 *          第二个参数：接收的传参
 */
export default {
  // 由actions.js触发该方法，mutations.js中的方法再改变state状态（即修改最终存储的地方）
  saveUserName (state, username) {
    state.username = username
  },
  saveCartCount (state, count) {
    state.cartCount = count
  }
}
