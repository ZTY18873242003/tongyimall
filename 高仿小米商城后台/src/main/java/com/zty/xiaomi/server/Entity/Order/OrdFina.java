package com.zty.xiaomi.server.Entity.Order;

import lombok.Data;

@Data
public class OrdFina {
    private int payment;
    private String receiverName;
    private String receiverMobile;
    private String receiverAddress;
    private String receiverCity;
    private String receiverProvince;
    private String receiverZip;

}
