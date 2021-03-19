package com.zty.xiaomi.server.Entity.Order;

import lombok.Data;

import java.util.List;

@Data
public class OrdFinaResult {
    private int status;
    private OrdFina ordFina;
    private List<orderItemVoList> lists;
}
