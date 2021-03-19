package com.zty.xiaomi.server.Dao;

import com.zty.xiaomi.server.Entity.ProductHead.ProductHeadInfo;
import org.apache.ibatis.annotations.Select;
import java.util.List;

public interface ProductHead {
    @Select("select good_id,name,imageHead,price from goods where category_id = #{categoryId}")
    List<ProductHeadInfo> getProductHeadInfo(int categoryId);
}
