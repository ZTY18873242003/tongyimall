package com.zty.xiaomi.server.Vo;

import com.zty.xiaomi.server.Entity.LoginData;
import lombok.Data;

//1010：成功登陆    2008:邮箱错误   2007:密码错误
@Data
public class LoginResult {
    private int status=0;
    private String msg;
    private LoginData data;
}
