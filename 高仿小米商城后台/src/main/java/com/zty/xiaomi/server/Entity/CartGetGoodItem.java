package com.zty.xiaomi.server.Entity;

import lombok.Data;

@Data
public class CartGetGoodItem {
    private int good_id;
    private String goods_name;
    private int price;
    private int count;
    private String pic_url;
}
