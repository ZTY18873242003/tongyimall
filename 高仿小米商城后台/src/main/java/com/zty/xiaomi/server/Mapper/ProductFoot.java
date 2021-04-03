package com.zty.xiaomi.server.Mapper;

import com.zty.xiaomi.server.Entity.ProductFoot.ProductFootInfo;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ProductFoot {
    @Select("select good_id,price,oldprice,name,imageFoot,subtitle from goods where name like #{goodname}")
    ProductFootInfo getProductFootInfo(String goodname);

    @Select("select good_id,price,oldprice,name,imageFoot,subtitle" +
            " from goods where category_id = #{category_id} limit 7")
    List<ProductFootInfo> getProductFootInfoNormal(int category_id);
}
