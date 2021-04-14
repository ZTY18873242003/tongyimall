package com.zty.xiaomi.server.Entity.ProductFoot;

import lombok.Data;

import java.io.Serializable;

@Data
public class ProductFootInfo implements Serializable {
    private int good_id;
    private String subtitle;
    private String name;
    private int price;
    private int oldprice;
    private String imageFoot;
}