package com.zty.xiaomi.server.Dao;

import com.zty.xiaomi.server.Entity.Address.Addre;
import com.zty.xiaomi.server.Entity.Order.OrdFina;
import com.zty.xiaomi.server.Entity.Order.orderItemVoList;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface Order {

    @Select("select good_id,goods_name,price,count,productTotalPrice from cart where user_id like #{userid} and status = 1")
    List<orderItemVoList> getOrderItems(String userid);

    @Select("select * from address where userid like #{userid} and id = #{id}")
    Addre getAddre(String userid, int id);

    @Insert("insert into orde(orderNo,payment,paymentType,paymentTypeDesc,postage,status,statusDesc" +
            ",paymentTime,endTime,createTime,imageHost,shippingId,receiverName,receiverMobile,receiverProvince,receiverCity,receiverAddress,receiverZip) values(#{orderNo},#{payment},#{paymentType},#{paymentTypeDesc},#{postage},#{status},#{statusDesc},#{paymentTime},#{endTime},#{createTime},#{imageHost},#{shippingid},#{receiveName},#{receiveMobile},#{receiveProvince},#{receiverCity},#{receiverAddress},#{receiverZip})")
    void insOrder(int orderNo,int payment,int paymentType,String paymentTypeDesc,int postage,
                  int status,String statusDesc,String paymentTime,String endTime,
                   String createTime,String imageHost,int shippingid,String receiveName,
                  String receiveMobile, String receiveProvince,String receiverCity,String receiverAddress,String receiverZip);

    @Select("select orderNo,payment,receiverName,receiverMobile,receiverAddress,receiverCity,receiverProvince,receiverZip from orde where orderNo = #{id}")
    OrdFina getOrderById(int id);

}
