package com.zty.xiaomi.server.Vo;

import lombok.AllArgsConstructor;
import lombok.Data;

//200注册成功,2002该邮箱已注册,404填写信息不全，注册失败
@Data
public class RegResult {
    private int status;
    private String msg;

}
