package com.zty.xiaomi.server.Entity.Cart;

import lombok.Data;

@Data
public class CartGoodInsert {
    private String name;
    private int price;
    private int status;
    private String subtitle;
    private int productStock;
    private int sellcount;
}
