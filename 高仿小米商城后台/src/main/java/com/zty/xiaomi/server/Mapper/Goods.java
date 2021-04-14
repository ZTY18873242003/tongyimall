package com.zty.xiaomi.server.Mapper;

import com.zty.xiaomi.server.Entity.Good;
import com.zty.xiaomi.server.Entity.index.GoodCategory;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface Goods {
    @Select("select name,price,oldPrice,description,sellcount,rating,info,icon,image from goods where category_id = #{category_id}")
    List<Good> getGood(int category_id);
    @Select("select name,type from category where category_id = #{category_id}")
    GoodCategory getGoodCategory(int category_id);
}
