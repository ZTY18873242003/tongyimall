package com.zty.xiaomi.server.Entity.Cart;

import lombok.Data;

@Data
public class cartProduct {
    private int good_id;
    private int count;
    private String goods_name;
    private String subtitle;
    private int price;
    private int Status;
    private int productTotalPrice;
    private int productStock;
    private boolean productSelected;

}
