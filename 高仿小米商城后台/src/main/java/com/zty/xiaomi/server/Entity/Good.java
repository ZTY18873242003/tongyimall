package com.zty.xiaomi.server.Entity;

import lombok.Data;

@Data
public class Good {
    private String name;
    private int price;
    private int oldPrice;
    private String description;
    private int sellCount;
    private int rating;
    private String info;
    private String icon;
    private String image;
}
