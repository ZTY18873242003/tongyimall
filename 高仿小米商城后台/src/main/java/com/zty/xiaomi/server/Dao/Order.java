package com.zty.xiaomi.server.Dao;

import com.zty.xiaomi.server.Entity.Address.Addre;
import com.zty.xiaomi.server.Entity.Order.orderItemVoList;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface Order {

    @Select("select good_id,goods_name,price,count,productTotalPrice from cart where user_id like #{userid} and status = 1")
    List<orderItemVoList> getOrderItems(String userid);

    @Select("select * from address where userid like #{userid} and id = #{id}")
    Addre getAddre(String userid, int id);
}
