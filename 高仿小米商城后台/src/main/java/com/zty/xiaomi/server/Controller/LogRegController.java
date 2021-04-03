package com.zty.xiaomi.server.Controller;

import com.zty.xiaomi.server.Entity.LoginData;
import com.zty.xiaomi.server.Entity.User;
import com.zty.xiaomi.server.Service.RegLogin.RegLogServiceImp;
import com.zty.xiaomi.server.Vo.LoginResult;
import com.zty.xiaomi.server.Vo.RegResult;
import com.zty.xiaomi.server.utils.DateUtil;
import com.zty.xiaomi.server.utils.RSAUtils;
import com.zty.xiaomi.server.utils.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Map;
import java.util.UUID;

@CrossOrigin
@RestController
@RequestMapping("login")
public class LogRegController {
    @Autowired
    private RegLogServiceImp regLogServiceImp;

    //注册功能
    @RequestMapping("/getRegister")
    public RegResult Register(@RequestParam("username") String username,
                              @RequestParam("email") String email,
                              @RequestParam("password") String password,
                              @RequestParam("phone") String phone) throws IOException, InvalidKeySpecException, NoSuchAlgorithmException {
        RegResult result = new RegResult();
        System.out.println(username.length());
        if(username.equals("") || email.equals("") || password.equals("") || phone.equals("")){
            result.setStatus(404);
            result.setMsg("填写信息不全");
            return result;
        }

        User user = regLogServiceImp.getUserByName(username);

        if (user != null) {
            result.setStatus(2002);
            result.setMsg("账号已存在，注册失败!");
        }
        else {
            String userid = UUID.randomUUID().toString();
            Map<String, String> keyMap = RSAUtils.createKeys(512);
            String  publicKey = keyMap.get("publicKey");
            String  privateKey = keyMap.get("privateKey");

            //公钥加密
            String encodedData = RSAUtils.publicEncrypt(password,RSAUtils.getPublicKey(publicKey));

            String date = DateUtil.ptfDate();
            regLogServiceImp.insertUser(userid,username,email,encodedData,phone,"可用",date,privateKey);
            result.setStatus(200);
            result.setMsg("注册成功!");
        }
        return result;
    }


//登录验证
    @RequestMapping("/UserLogin")
    public LoginResult Login(@RequestParam("username") String username,
                             @RequestParam("password") String password) throws IOException, InvalidKeySpecException, NoSuchAlgorithmException {
        User user = regLogServiceImp.getUserByUserName(username);
        LoginResult result = new LoginResult();
        LoginData loginData = new LoginData();
        if(user==null){
            result.setMsg("无此用户，请重新输入正确用户名");
            result.setStatus(2008);
        }
        else {
            if(RSAUtils.privateDecrypt(user.getPwd(), RSAUtils.getPrivateKey(user.getPrivatekey().trim())).equals(password)){
                result.setStatus(0);
                String token = TokenUtil.token(user.getUserid().trim());
                loginData.setToken(token);
                result.setMsg("登录成功");
                result.setData(loginData);
            }
            else {
                result.setStatus(2007);
                result.setMsg("密码错误");
            }
        }
        return result;
    }

}
