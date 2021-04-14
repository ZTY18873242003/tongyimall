package com.zty.xiaomi.server.Entity.Order;

import lombok.Data;

import java.util.List;

@Data
public class UserOrdList {
    private String createTime;
    private String receiverName;
    private int orderNo;
    private String paymentTypeDesc;
    private int payment;
    private int status;
    private String statusDesc;
    private List<UserOrdItemList> items;

}
