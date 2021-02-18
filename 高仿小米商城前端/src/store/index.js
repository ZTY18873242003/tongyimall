import Vue from 'vue'
import Vuex from 'vuex'
import mutations from './mutations'
import actions from './actions'
Vue.use(Vuex)

// vuex中的状态变量通过：this.$store.state.username 来读取
const state = {
  username: '',
  token:'',
  cartCount: 0
}
export default new Vuex.Store({
  state,
  mutations,
  actions
})
