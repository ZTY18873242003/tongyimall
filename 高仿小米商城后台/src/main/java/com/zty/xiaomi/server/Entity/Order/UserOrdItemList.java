package com.zty.xiaomi.server.Entity.Order;

import lombok.Data;

@Data
public class UserOrdItemList {
    private int productId;
    private String productName;
    private int currentUnitPrice;
    private int quantity;
    private int totalPrice;
    private String imgurl;
}
