package com.zty.xiaomi.server.Entity;

import lombok.Data;

@Data
public class User {
    private String userid;
    private String name;
    private String email;
    private String tel;
    private String pwd;
    private String privatekey;
}
