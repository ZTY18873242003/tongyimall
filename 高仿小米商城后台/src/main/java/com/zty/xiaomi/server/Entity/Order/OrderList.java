package com.zty.xiaomi.server.Entity.Order;

import com.zty.xiaomi.server.Entity.Address.Addre;
import lombok.Data;

import java.util.List;

@Data
public class OrderList {
    private int orderNo;
    private int payment;
    private int paymentType=1;
    private String paymentTypeDesc="在线支付";
    private int postage=0;//邮费
    private int status;
    private String statusDesc;
    private String paymentTime;
    private String sendTime;
    private String endTime;
    private String closeTime;
    private String createTime;
    private List<orderItemVoList> orderItemList;
    private String imageHost="www.mi.com";
    private int shippingId;
    private String receiverName;
    private Addre shippingVo;
}

