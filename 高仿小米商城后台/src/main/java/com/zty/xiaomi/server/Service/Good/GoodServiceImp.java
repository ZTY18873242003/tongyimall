package com.zty.xiaomi.server.Service.Good;

import com.zty.xiaomi.server.Dao.GoodCart;
import com.zty.xiaomi.server.Dao.Goods;
import com.zty.xiaomi.server.Entity.Cart.CartGood;
import com.zty.xiaomi.server.Entity.Cart.CartGoodInsert;
import com.zty.xiaomi.server.Entity.Cart.cartProduct;
import com.zty.xiaomi.server.Entity.index.GoodCategory;
import com.zty.xiaomi.server.Entity.Good;
import com.zty.xiaomi.server.utils.SqlSessionUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service
public class GoodServiceImp implements GoodService {

    @Override
    public List<Good> getGood(int categoryid) throws IOException {
        SqlSession sqlSession= SqlSessionUtil.getInstance();
        List<Good> goodList = sqlSession.getMapper(Goods.class).getGood(categoryid);
                return goodList;
    }

    @Override
    public GoodCategory getGoodCategory(int categoryid) throws IOException {
        SqlSession sqlSession= SqlSessionUtil.getInstance();
        GoodCategory goodCategory = sqlSession.getMapper(Goods.class).getGoodCategory(categoryid);
        return goodCategory;
    }

    @Override
    public CartGood getGoodByid(String userid, int id) throws IOException {
        SqlSession sqlSession= SqlSessionUtil.getInstance();

        CartGood cartGood = sqlSession.getMapper(GoodCart.class).getGoodByid(userid,id);
        return cartGood;
    }

    @Override
    public void delGoodByid(String userid, int id) throws IOException {
        SqlSession sqlSession= SqlSessionUtil.getInstance();
        sqlSession.getMapper(GoodCart.class).delGoodByid(userid,id);
        sqlSession.commit();

    }

    @Override
    public CartGoodInsert getGoodByidinsert(int goodid) throws IOException {
        SqlSession sqlSession=  SqlSessionUtil.getInstance();
        CartGoodInsert cartGoodInsert = sqlSession.getMapper(GoodCart.class).getGoodByidinsert(goodid);
        return cartGoodInsert;
    }

    @Override
    public void updaCartNumSel(String userid, int goodid, int count, boolean select,int totalprice) throws IOException {
        SqlSession sqlSession= SqlSessionUtil.getInstance();
        sqlSession.getMapper(GoodCart.class).updaCartNumSel
                (userid, goodid, count, select,totalprice);
        sqlSession.commit();

    }

    @Override
    public void updaCartSelect(String userid) throws IOException {
        SqlSession sqlSession= SqlSessionUtil.getInstance();
        sqlSession.getMapper(GoodCart.class).updaCartSelect(userid);
        sqlSession.commit();

    }
    @Override
    public void updaCartunSelect(String userid) throws IOException {
        SqlSession sqlSession= SqlSessionUtil.getInstance();
        sqlSession.getMapper(GoodCart.class).updaCartunSelect(userid);
        sqlSession.commit();

    }

    @Override
    public List<cartProduct> getGoodByuser(String userid) throws IOException {
        SqlSession sqlSession=  SqlSessionUtil.getInstance();
        List<cartProduct> cartgoods = sqlSession.getMapper(GoodCart.class).getcartProduct(userid);
        return cartgoods;
    }

    @Override
    public void updateCartGood(String userid,int count,int goodid,int totalprice) throws IOException {
        SqlSession sqlSession=  SqlSessionUtil.getInstance();
        sqlSession.getMapper(GoodCart.class).updateCartGood(userid,count,goodid,totalprice);

        sqlSession.commit();

    }

    @Override
    public void insCartGood(String userid, int goodid, String goodname, int price, int count,
                            String Subtitle,int ProductStock,int Status,boolean select
    ) throws IOException {
        SqlSession sqlSession=SqlSessionUtil.getInstance();
        sqlSession.getMapper(GoodCart.class).insCartGood(userid,goodid,goodname,price,count
        ,Subtitle,ProductStock,Status,select,count*price);
        sqlSession.commit();

    }

//    @Override
//    public List<CartGetGoodItem> getCartGood(String userid) throws IOException {
//        SqlSession sqlSession=SqlSessionUtil.getInstance();
//        return sqlSession.getMapper(GoodCart.class).getCartGood(userid);
//    }
}
