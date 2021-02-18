package com.zty.xiaomi.server.Dao;

import com.zty.xiaomi.server.Entity.ProductFoot.ProductFootInfo;
import org.apache.ibatis.annotations.Select;
import java.util.List;

public interface ProductFoot {
    @Select("select good_id,price,name,imageFoot,subtitle from goods where category_id = #{categoryId}" +
            " and good_id between #{pageStart} and #{pageEnd}")
    List<ProductFootInfo> getProductFootInfo(int categoryId, int pageStart, int pageEnd);
}
