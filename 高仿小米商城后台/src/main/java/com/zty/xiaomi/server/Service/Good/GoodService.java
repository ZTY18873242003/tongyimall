package com.zty.xiaomi.server.Service.Good;

import com.zty.xiaomi.server.Entity.Cart.CartGoodInsert;
import com.zty.xiaomi.server.Entity.Cart.cartProduct;
import com.zty.xiaomi.server.Entity.Cart.CartGood;
import com.zty.xiaomi.server.Entity.Good;
import com.zty.xiaomi.server.Entity.index.GoodCategory;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

public interface GoodService {


    List<Good> getGood(int categoryid) throws IOException;

    GoodCategory getGoodCategory(int categoryid) throws IOException;

    CartGood getGoodByid(String userid,int id) throws IOException;

    void delGoodByid(String userid,int id) throws IOException;

    CartGoodInsert getGoodByidinsert(int goodid) throws IOException;

    void updaCartNumSel(String userid,int goodid,int count,boolean select,int totalprice) throws IOException;

    void updaCartSelect(String userid) throws IOException;

    void updaCartunSelect(String userid) throws IOException;

    List<cartProduct> getGoodByuser(String userid) throws IOException;

    void updateCartGood(String userid,int count,int goodid,int totalprice) throws IOException;

    void  insCartGood(String userid,int goodid,String goodname,int price,
                      int count, String Subtitle,int ProductStock,int Status,boolean select
                      ) throws IOException;
//
//    List<CartGetGoodItem> getCartGood(String userid) throws IOException;
}
