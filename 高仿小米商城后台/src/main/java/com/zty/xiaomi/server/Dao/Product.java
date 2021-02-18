package com.zty.xiaomi.server.Dao;

import com.zty.xiaomi.server.Entity.Product.ProductInfo;
import org.apache.ibatis.annotations.Select;

public interface Product {
    @Select("select name,subtitle,price,desc1,desc2,p1,p2 from goods where good_id= #{id}")
    ProductInfo getProductInfoById(int id);
}
