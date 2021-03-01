package com.zty.xiaomi.server.Entity.Suggest;

import lombok.Data;

import java.util.List;

@Data
public class SuggestFootResult {
    private int status;
    private List<SuggestFoot> sugglist;
}
