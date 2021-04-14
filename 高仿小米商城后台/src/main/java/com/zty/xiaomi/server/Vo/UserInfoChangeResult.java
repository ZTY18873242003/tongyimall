package com.zty.xiaomi.server.Vo;

import lombok.Data;
import lombok.Setter;

@Data
public class UserInfoChangeResult {
    private int code;
    private String msg;
    private String image_name;

    public UserInfoChangeResult(int code, String msg, String image_name) {
        this.code=code;
        this.msg=msg;
        this.image_name=image_name;
    }
}
