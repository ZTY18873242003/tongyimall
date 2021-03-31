package com.zty.xiaomi.server.Entity.Order;

import lombok.Data;

import java.util.List;

@Data
public class UserOrdListResult {
    private List<UserOrdList> list;
    int total;
    private int status;

}
