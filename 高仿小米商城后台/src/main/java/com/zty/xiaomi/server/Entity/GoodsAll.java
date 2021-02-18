package com.zty.xiaomi.server.Entity;

import lombok.Data;

import java.util.ArrayList;

@Data
public class GoodsAll {
    private int errno;
    ArrayList<GoodAll> data;
    public GoodsAll(){
        this.errno=0;
    }
}
