package com.zty.xiaomi.server.Entity.index;

import lombok.Data;
import java.util.ArrayList;
import java.util.List;
@Data
public class Categor {
    private int categoryId;
    private String name;
    private ArrayList<ArrayList<CategoryGood>> menuList;
}
