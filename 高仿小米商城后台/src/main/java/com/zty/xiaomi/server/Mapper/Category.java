package com.zty.xiaomi.server.Mapper;

import com.zty.xiaomi.server.Entity.index.GoodCategory;
import com.zty.xiaomi.server.Entity.index.CategoryGood;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface Category {

    @Select("select good_id,icon,name from goods where category_id = #{category_id}")
    List<CategoryGood> getGoodbyCategory(int category_id);

//    @Select("select good_id,icon,name from goods where category_id = #{category_id}" +
//            " and good_id between #{start} and #{end}")
//    List<CategoryGood> getGoodbyCategory(int category_id,int start,int end);

    @Select("select count(*) from category")
    int getCateCount();

    @Select("select categoryId,name from category where categoryId = #{category_id}")
    GoodCategory getGoodCategory(int category_id);
}
