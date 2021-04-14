<template>
  <div class="order-list">
    <order-header title="订单列表">
      <template v-slot:tip>
        <span>请谨防钓鱼链接或诈骗电话</span>
      </template>
    </order-header>
    <div class="wrapper">
      <div class="container">
        <div class="order-box">
          <loading v-if="loading"></loading>
          <div class="order" v-for="(order,index) in list" :key="index">
            <div class="order-title">
              <div class="item-info fl">
                {{order.createTime}}
                <span>|</span>
                收货人:{{order.receiverName}}
                <span>|</span>
                订单号：{{order.orderNo}}
                <span>|</span>
                {{order.paymentTypeDesc}}
              </div>
              <div class="item-money fr">
                <span>应付金额：</span>
                <span class="money">{{order.payment}}</span>
                <span>元</span>
              </div>
            </div>
            <div class="order-content clearfix">
              <div class="good-box fl">
                <div class="good-list" v-for="(item,i) in order.items" :key="i">
                  <div class="good-img">
                    <img :src="item.imgurl" alt="">
                  </div>
                  <div class="good-nam
                  e">
                    <div class="p-name">{{item.productName}}</div>
                    <div class="p-money">{{item.currentUnitPrice + 'X' + item.quantity}}元</div>
                  </div>
                </div>
              </div>
              <div class="good-state fr" v-if="order.status == 10">
                <a href="javascript:;">{{order.statusDesc}}</a>
              </div>
              <div class="good-state fr" v-else>
                <a href="javascript:;" @click="goPay(order.orderNo)">{{order.statusDesc}}</a>
              </div>
            </div>
          </div>

          <el-pagination
            class="pagination"
            background
            layout="prev, pager, next"
            :pageSize="pageSize"
            :total="total"
            @current-change="handleChange"
            >
          </el-pagination>

          <!-- 第二种方式：点击按钮，加载数据
          <div class="load-more">
              <el-button type="primary" :loading="loading" @click="loadMore">加载更多</el-button>
          </div> -->

          <!-- 第三种方式(使用vue-infinite-scroll插件)：滚动加载数据
          <div class="scroll-more"
            v-infinite-scroll="scrollMore"
            :infinite-scroll-disabled="busy"
            infinite-scroll-distance="410"
          >
            <img v-show="loading" src="/imgs/loading-svg/loading-spinning-bubbles.svg">
          </div> -->

          <no-data v-if="!loading && list.length==0"></no-data>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import OrderHeader from './../components/OrderHeader'
import Loading from './../components/Loading'
import NoData from './../components/NoData'
import { Pagination, Button } from 'element-ui'
// 分页第三种方式（使用插件）：滚动加载数据
import infiniteScroll from 'vue-infinite-scroll'
export default {
  name: 'order-list',
  components: {
    OrderHeader,
    Loading,
    NoData,
    // [变量]表示加载变量， Pagination.name就是el-pagination；Button.name就是el-button
    [Pagination.name]: Pagination,
    [Button.name]: Button
  },
  directives: {
    infiniteScroll
  },
  data () {
    return {
      loading: false,
      list: [],
      pageSize: 10,
      pageNum: 1,
      total: 0
      // showNextPage: true // 加载更多：是否显示按钮(即数据加载完了，没有更多则不显示按钮)
      // busy: false // 滚动加载，是否触发
    }
  },
  created () {
    this.getOrderList()
  },
  methods: {
    getOrderList () {
      this.loading = true
      // this.busy = true
      this.axios.get('http://localhost:8080/orders/getorderlist', {
        params: {
          // pageSize: 10,
          // pageNum: this.pageNum,
          username:sessionStorage.getItem("username")
        }
      }).then((res) => {
        this.loading = false
        this.list = res.list
        // 第二种和第三钟方式(滚动加载和点击按钮加载更多)：请求的数据条数拼接，而不是替换成新的
        // this.list = this.list.concat(res.list)
        this.total = res.total
        // this.showNextPage = res.hasNextPage
        // this.busy = false
      }).catch(() => {
        this.loading = false
      })
    },
    goPay (orderNo) {
      // 三种路由跳转方式
      // this.$router.push('/order/pay')
      // this.$router.push({
      //   name: 'order-pay',
      //   query: {
      //     orderNo: orderNo
      //   }
      // })
      this.$router.push({
        path: '/order/pay',
        query: {
          orderNo
        }
      })
    },
    // 第一种方法：分页器
    handleChange (pageNum) {
      this.pageNum = pageNum
      this.getOrderList()
    }
    /* 第二种方法：加载更多按钮
    loadMore () {
      this.pageNum++
      this.getOrderList()
    },
    */
    /* 第三种方法：滚动加载，通过npm插件实现
    scrollMore () {
      this.busy = true
      setTimeout(() => {
        this.pageNum++
        this.getList()
      }, 500)
    },
    */
    /* 专门给scrollMore使用
    getList () {
      this.loading = true
      this.axios.get('/orders', {
        params: {
          pageSize: 10,
          pageNum: this.pageNum
        }
      }).then((res) => {
        this.list = this.list.concat(res.list)
        this.loading = false
        if (res.hasNextPage) {
          this.busy = false
        } else {
          this.busy = true
        }
      })
    }
    */
  }
}
</script>
<style lang="scss">
  @import './../assets/scss/config.scss';
  @import './../assets/scss/mixin.scss';
  .order-list{
    .wrapper{
      background-color:$colorJ;
      padding-top:33px;
      padding-bottom:110px;
      .order-box{
        .order{
          @include border();
          background-color:$colorG;
          margin-bottom:31px;
          &:last-child{
            margin-bottom:0;
          }
          .order-title{
            @include height(74px);
            background-color:$colorK;
            padding:0 43px;
            font-size:16px;
            color:$colorC;
            .item-info{
              span{
                margin:0 9px;
              }
            }
            .money{
              font-size:26px;
              color:$colorB;
            }
          }
          .order-content{
            padding:0 43px;
            .good-box{
              width:88%;
              .good-list{
                display: flex;
                align-items: center;
                height:145px;
                .good-img{
                  width:112px;
                  img{
                    width:100%;
                  }
                }
                .good-name{
                  font-size:20px;
                  color:$colorB;
                }
              }
            }
            .good-state{
              @include height(145px);
              font-size: 20px;
              color:$colorA;
              a{
                color:$colorA;
              }
            }
          }
        }
        .pagination{
          text-align:right;
        }
        .el-pagination.is-background .el-pager li:not(.disabled).active{
          background-color: $colorA;
        }
        .el-button--primary{
          background-color: $colorA;
          border-color: $colorA;
        }
        .load-more,.scroll-more{
          text-align:center;
        }
      }
    }
  }
</style>
