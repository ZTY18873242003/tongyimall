package com.zty.xiaomi.server.Entity.Cart;
import lombok.Data;

@Data
public class CartGood {
    private int count;
    private String goods_name;
    private String subtitle;
    private int price;
    private int status;
    private int productStock;
}
