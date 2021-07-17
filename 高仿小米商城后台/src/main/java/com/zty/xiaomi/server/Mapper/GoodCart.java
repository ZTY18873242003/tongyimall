package com.zty.xiaomi.server.Mapper;

import com.zty.xiaomi.server.Entity.Cart.CartGoodInsert;
import com.zty.xiaomi.server.Entity.Cart.cartProduct;
import com.zty.xiaomi.server.Entity.Cart.CartGood;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface GoodCart {
    @Select("select count,goods_name,subtitle,price,status,productStock from cart where user_id like #{userid} and good_id = #{id}")
    CartGood getGoodByid(String userid, int id);

    @Delete("delete from cart where user_id like #{userid} and good_id = #{id}")
    void delGoodByid(String userid,int id);

    @Delete("delete from cart where user_id like #{userid}")
    void delGoodByname(String userid);

    @Select("select name,price,subtitle,status,productStock from goods where good_id = #{goodid}")
    CartGoodInsert getGoodByidinsert(int goodid);

    @Update("update cart set count = #{count},productSelected = #{select},productTotalPrice = #{totalprice} where user_id like #{userid} and good_id = #{goodid}")
    void updaCartNumSel(String userid,int goodid,int count,boolean select,int totalprice);

    @Update("update cart set productSelected = true where  user_id like #{userid}")
    void updaCartSelect(String userid);

    @Update("update cart set productSelected = false where  user_id like #{userid}")
    void updaCartunSelect(String userid);

    @Insert("insert into cart(user_id,good_id,goods_name,price,count," +
            "Subtitle,ProductStock,Status,productSelected,productTotalPrice)" +
            " values(#{userid},#{goodid},#{goodname},#{price},#{count}" +
            ",#{Subtitle},#{ProductStock},#{Status},#{select},#{totalprice})")
    void insCartGood(String userid,int goodid,String goodname,int price,
                      int count, String Subtitle,int ProductStock,int Status,boolean select,int totalprice);

    @Update("update cart set count = #{count},productTotalPrice = #{totalprice} where user_id like #{userid} and good_id = #{goodid}")
    void updateCartGood(String userid,int count,int goodid,int totalprice);

//    @Select("select good_id,goods_name,price,count,pic_url from cart where user_id like #{userid}")
//    List<CartGetGoodItem> getCartGood(String userid);

    @Select("select good_id,count,goods_name,price,subtitle,Status," +
            "productTotalPrice,productStock,productSelected from cart where user_id like #{userid}")
    List<cartProduct> getcartProduct(String userid);

}
