package com.zty.xiaomi.server.Mapper;

import com.zty.xiaomi.server.Entity.Address.Addre;
import com.zty.xiaomi.server.Entity.Order.OrdFina;
import com.zty.xiaomi.server.Entity.Order.UserOrdItemList;
import com.zty.xiaomi.server.Entity.Order.UserOrdList;
import com.zty.xiaomi.server.Entity.Order.orderItemVoList;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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

    @Update("update orde set status = 1,statusDesc = '已支付' where orderNo = #{id}")
    void buyOrder(int id);

    @Select("select status from orde where orderNo = #{id}")
    int getOrderStatus(int id);

    @Delete("delete from orde where orderNo = #{orderNo}")
    void delOrde(int orderNo);

    @Delete("delete from ordergood where orderNo = #{orderNo}")
    void delOrder(int orderNo);

    @Update("update goods set productStock = #{count} where #{count} >= 0 and good_id = #{goodid}")
    int chanProdStock(int goodid,int proStock,int count);

    @Update("update goods set sellcount = #{after} where good_id = #{goodid}")
    void addSellCount(int goodid,int after);

    @Select("select productStock from goods where good_id = #{goodid}")
    int getProdStock(int goodid);

    @Select("select sellcount from goods where good_id = #{goodid}")
    int getProdSellCount(int goodid);


    @Update("update goods set productStock = #{count} where good_id = #{productid}")
    void rollbackStock(int productid,int count);

    @Update("update goods set sellcount = #{count} where good_id = #{productid}")
    void rollbackSellCount(int productid,int count);

    @Update("update orde set paymentTime = #{time} where orderNo = #{orderNo}")
    void updOrderTime(int orderNo,String time);
}
