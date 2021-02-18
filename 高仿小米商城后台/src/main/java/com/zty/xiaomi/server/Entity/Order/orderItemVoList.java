package com.zty.xiaomi.server.Entity.Order;

import lombok.Data;

@Data
public class orderItemVoList {
    private int orderNo;

    private int good_id;
    private String goods_name;
    private int price;
    private int count;
    private int productTotalPrice;

    private String productImage;

    private String createTime;
}
