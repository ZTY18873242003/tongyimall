<template>
  <div class="login">
    <div class="container">
      <a href="/#/index"><img src="/imgs/login-logo.png" alt=""></a>
    </div>
    <div class="wrapper">
      <div class="container">
        <div class="login-form">
          <h3>
            <span class="checked">帐号登录</span>
            <!--            <span class="sep-line">|</span><span>扫码登录</span>-->
          </h3>
          <div class="input">
            <input type="text" placeholder="请输入帐号" v-model="username">
          </div>
          <div class="input">
            <input type="password" placeholder="请输入密码" v-model="password">
          </div>
          <div class="btn-box">
            <a href="javascript:;" class="btn" @click="login">登录</a>
          </div>
          <div class="tips">
            <div class="sms" @click="register">还没有账号?点此注册</div>
            <div class="reg"><span></span>忘记密码？</div>
          </div>
        </div>
      </div>
    </div>

  </div>
</template>
<script>
import { mapActions } from 'vuex'
export default {
  name: 'login',
  data () {
    return {
      username: '',
      password: '',
      status: '',

      userId: ''
    }
  },
  methods: {
    ...mapActions(['saveUserName', 'saveCartCount']),
    login () {
      const { username, password } = this
      var that=this
      this.axios.get('http://localhost:8080/login/UserLogin', {
        params: {
        'username':username,
        'password':password
      }}).then((res) => {

        if(res.status===0){
          // this.$store.state.token=JSON.stringify(res.data.token);
          // this.$store.state.username=this.username;
          sessionStorage.setItem("username",this.username);
          sessionStorage['token']=JSON.stringify(res.data.token)
          that.$router.push({
            // path:'/index'对应路由起的name:index
            // 【注：用params传参必须使用name跳转路由；而用query传参必须使用path跳转路由】
            name: 'index',
            params: {
              from: 'login'
            }
          })
        }
        else if (res.status===2007) {
          this.$message.error('密码错误');
        }
        else if(res.status===2008) {
          this.$message.error('无此用户，请重新输入正确用户名');
        }

        /**
          * 保存购物车数量，不在这里做（axios里套axios），改成跳转到/index页面里判断是否是login页面跳转过来的，是则请求购物车数量
          * this.axios.get('/carts/products/sum').then((res) => {
          * this.saveCartCount(res)
          * })
         */

      })
    },
    register () {
      this.$router.push("/register");
    }
  }
}
</script>
<style lang="scss">
.login{
  &>.container{
    height:113px;
    img{
      width:auto;
      height:100%;
    }
  }
  .wrapper{
    background:url('/imgs/login-bg2.jpg') no-repeat center;
    .container{
      height:576px;
      .login-form{
        box-sizing: border-box;
        padding-left: 31px;
        padding-right: 31px;
        width:410px;
        height:510px;
        background-color:#ffffff;
        position:absolute;
        bottom:29px;
        right:0;
        h3{
          line-height:23px;
          font-size:24px;
          text-align:center;
          margin:40px auto 49px;
          .checked{
            color:#FF6600;
          }
          .sep-line{
            margin:0 32px;
          }
        }
        .input{
          display:inline-block;
          width:348px;
          height:50px;
          border:1px solid #E5E5E5;
          margin-bottom:20px;
          input{
            width: 100%;
            height: 100%;
            border: none;
            padding: 18px;
          }
        }
        .btn{
          width:100%;
          height:50px;
          line-height:50px;
          margin-top:10px;
          font-size:16px;
        }
        .tips{
          margin-top:14px;
          display:flex;
          justify-content:space-between;
          font-size:14px;
          cursor:pointer;
          .sms{
            color:#FF6600;
          }
          .reg{
            color:#999999;
            span{
              margin:0 7px;
            }
          }
        }
      }
    }
  }
  .footer{
    height:100px;
    padding-top:60px;
    color:#999999;
    font-size:16px;
    text-align:center;
    .footer-link{
      a{
        color:#999999;
        display:inline-block;
      }
      span{
        margin:0 10px;
      }
    }
    .copyright{
      margin-top:13px;
    }
  }
}
</style>
