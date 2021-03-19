<template>
  <div class="login">
    <div class="container">
      <a href="/#/index"><img src="https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/login-logo.png" alt=""></a>
    </div>
    <div class="wrapper">
      <div class="container">
        <el-form class="login-form" :model="ruleForm2" ref="ruleForm2" :rules="rules2">
          <h3>
          </h3>
          <el-form-item  prop="username">
            <el-input type="text" class="inputs" placeholder="请输入帐号" v-model="ruleForm2.username" autocomplete="off"></el-input>
          </el-form-item>

          <el-form-item v-if="visible" prop="password">
            <el-input type="password" v-model="ruleForm2.password" placeholder="请输入密码" autocomplete="off">
              <i slot="suffix" title="显示密码" @click="changePass('show')" class="el-icon-view"
              ></i>
            </el-input>
          </el-form-item>
          <el-form-item v-else prop="password">
            <el-input type="text" v-model="ruleForm2.password" placeholder="请输入密码" autocomplete="off">
              <i slot="suffix" title="隐藏密码" @click="changePass('hide')" class="el-icon-view"
                 ></i>
            </el-input>
          </el-form-item>


          <el-form-item  prop="checkPass">
            <el-input type="password" v-model="ruleForm2.checkPass" placeholder="请再次输入密码" autocomplete="off">
            </el-input>
          </el-form-item>



          <el-form-item  prop="phone">
            <el-input type="text" class="inputs" placeholder="请输入电话" v-model="ruleForm2.phone" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item prop="email">
            <el-input type="text" class="inputs" placeholder="请输入邮箱" v-model="ruleForm2.email" autocomplete="off"></el-input>
          </el-form-item>
          <div class="btn-box">
            <a href="javascript:;" class="btn" @click="register">注册</a>
          </div>
          <div class="tips">
            <div class="sms" @click="login">已注册？返回登录</div>
            <div class="reg"><span></span>忘记密码？</div>
          </div>
        </el-form>
      </div>
    </div>

  </div>
</template>
<script>
import { mapActions } from 'vuex'
export default {
  name: 'login',
  data () {
    var checkPhone = (rule, value, callback) => {
      if (!value) {
        return callback(new Error('手机号不能为空'));
      }
      setTimeout(() => {

          var phonereg = 11 && /^((13|14|15|16|17|18|19)[0-9]{1}\d{8})$/
          if (!phonereg.test(value))
          {
            callback(new Error('必须为正规的手机号'));
          } else {
            callback();
          }

      }, 1000);
    };

    var checkEmail = (rule, value, callback) => {
      if (value==='') {
        return callback(new Error('邮箱不能为空'));
      }
      setTimeout(() => {
        if (!/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/.test(value))
        {
          callback(new Error('请输入正确的邮箱格式'));
        } else {
          callback();2
        }
      }, 1000);
    };


    var validatePass = (rule, value, callback) => {
      if (!value) {
        return callback(new Error('请输入密码'));
      } else
        callback();
    }

    var validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'));
      } else if (value !== this.ruleForm2.password) {
        callback(new Error('两次输入密码不一致!'));
      } else {
        callback();
      }
    };


    return {
      ruleForm2: {
        username: '',
        phone: '',
        email: '',
        password:'',
        checkPass: ''
      },
      userId: '',
      visible: true,


      rules2: {
        password: [
          { validator: validatePass, trigger: 'blur' }
        ],
        checkPass: [
          { validator: validatePass2, trigger: 'blur' }
        ],
        phone: [
          { validator: checkPhone, trigger: 'blur' }
        ],
        email: [
          { validator: checkEmail, trigger: 'blur' }
        ],
      }
    }
  },
  methods: {
    ...mapActions(['saveUserName', 'saveCartCount']),
    login () {
      this.$router.push("/login");
    },
    register () {
      this.axios.get("http://localhost:8080/login/getRegister",{
        params:
            {
              'username': this.ruleForm2.username,
              'password': this.ruleForm2.password,
              'email': this.ruleForm2.email,
              'phone': this.ruleForm2.phone
            },}
      ).then((res) => {

        if(res.status === 404){
          this.$alert('注册信息不全,请重新填写', 'Error', {
            confirmButtonText: '确定',
          });
        }else if(res.status === 2002){
          this.$message.error("账号已被注册");
        }else if(res.status === 200){
          this.$message.success("注册成功!请登录");
        }

      })

    },
    changePass(value) {
      this.visible = !(value === 'show');
    }    //判断渲染，true:暗文显示，false:明文显示
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
    background:url('https://cdn.jsdelivr.net/gh/ZTY18873242003/img/优雅的使用图床/login-bg2.jpg') no-repeat center;
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
