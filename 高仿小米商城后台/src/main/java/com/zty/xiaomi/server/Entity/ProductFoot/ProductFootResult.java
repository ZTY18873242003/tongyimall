package com.zty.xiaomi.server.Entity.ProductFoot;

import lombok.Data;

import java.util.List;

@Data
public class ProductFootResult {
    private int status;
    private List<ProductFootInfo> data;
}
