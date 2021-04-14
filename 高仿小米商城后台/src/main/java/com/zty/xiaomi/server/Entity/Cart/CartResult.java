package com.zty.xiaomi.server.Entity.Cart;

import lombok.Data;

@Data
public class CartResult {
    private int status;
    private cartProductVoList data;
    private int cartTotalPrice;
    private String imageHost;
    private boolean selectedAll;
    private int cartTotalQuantity;
}
