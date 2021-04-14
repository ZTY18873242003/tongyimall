package com.zty.xiaomi.server.Mapper;

import com.zty.xiaomi.server.Entity.Address.Addre;
import com.zty.xiaomi.server.Entity.Order.OrdFina;
import com.zty.xiaomi.server.Entity.Order.UserOrdItemList;
import com.zty.xiaomi.server.Entity.Order.UserOrdList;
import com.zty.xiaomi.server.Entity.Order.orderItemVoList;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface Order {

    @Select("select good_id,goods_name,price,count,productTotalPrice from cart where user_id like #{userid} and status = 1")
    List<orderItemVoList> getOrderItems(String userid);

    @Select("select * from address where userid like #{userid} and id = #{id}")
    Addre getAddre(String userid, int id);

    @Insert("insert into orde(hostid,orderNo,payment,paymentType,paymentTypeDesc,postage,status,statusDesc" +
            ",paymentTime,endTime,createTime,imageHost,shippingId,receiverName,receiverMobile,receiverProvince,receiverCity,receiverAddress,receiverZip) values(#{userid},#{orderNo},#{payment},#{paymentType}," +
            "#{paymentTypeDesc},#{postage},#{status},#{statusDesc},#{paymentTime},#{endTime},#{createTime},#{imageHost},#{shippingid},#{receiveName},#{receiveMobile},#{receiveProvince},#{receiverCity}," +
            "#{receiverAddress},#{receiverZip})")
    void insOrder(String userid,int orderNo,int payment,int paymentType,String paymentTypeDesc,int postage,
                  int status,String statusDesc,String paymentTime,String endTime,
                   String createTime,String imageHost,int shippingid,String receiveName,
                  String receiveMobile, String receiveProvince,String receiverCity,String receiverAddress,String receiverZip);

    @Insert("insert into ordergood(orderNo,productId,productName,currentUnitPrice,quantity,totalPrice,status,imgurl) values" +
            "(#{orderNo},#{productId},#{productName},#{currentUnitPrice},#{quantity},#{totalPrice},#{status},#{imgurl})")
    void insOrderGood(int orderNo,int productId,String productName,int currentUnitPrice,int quantity,int totalPrice,int status,String imgurl);

    @Select("select orderNo,payment,receiverName,receiverMobile,receiverAddress,receiverCity,receiverProvince,receiverZip from orde where orderNo = #{id}")
    OrdFina getOrderById(int id);

    @Select("select createTime,receiverName,orderNo,paymentTypeDesc,payment,status,statusDesc from orde where hostid like #{userId}")
    List<UserOrdList> getUserOrdList(String userId);

    @Select("select productId,productName,currentUnitPrice,quantity,totalPrice,imgurl from ordergood where orderNo = #{orderNo}")
    List<UserOrdItemList> getOrdItems(int orderNo);

    @Select("select imageFoot from goods where good_id = #{productId}")
    String getOrderImg(int productId);

}
