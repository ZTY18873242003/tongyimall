package com.zty.xiaomi.server.Mapper;

import com.zty.xiaomi.server.Entity.ProductHead.ProductHeadInfo;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ProductHead {
    @Select("select good_id,name,imageHead,price from goods where category_id = #{categoryId}")
    List<ProductHeadInfo> getProductHeadInfo(int categoryId);
}
