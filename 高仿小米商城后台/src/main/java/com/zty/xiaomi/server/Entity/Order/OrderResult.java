package com.zty.xiaomi.server.Entity.Order;

import lombok.Data;

@Data
public class OrderResult {
    private int status;
    private OrderList data;
}
