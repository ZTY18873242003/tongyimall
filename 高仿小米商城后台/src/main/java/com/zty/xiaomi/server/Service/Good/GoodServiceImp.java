package com.zty.xiaomi.server.Service.Good;

import com.zty.xiaomi.server.Dao.GoodCart;
import com.zty.xiaomi.server.Dao.Goods;
import com.zty.xiaomi.server.Entity.Cart.CartGood;
import com.zty.xiaomi.server.Entity.Cart.CartGoodInsert;
import com.zty.xiaomi.server.Entity.Cart.cartProduct;
import com.zty.xiaomi.server.Entity.index.GoodCategory;
import com.zty.xiaomi.server.Entity.Good;
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
    public SqlSession getSqlSession() throws IOException {
        String resource = "mybatis-config.xml";//通过流处理获取sqlSessionFactory创建一个实例
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();//获取SqlSession实例
        return session;
    }

    @Override
    public List<Good> getGood(int categoryid) throws IOException {
        SqlSession sqlSession=getSqlSession();
        List<Good> goodList = sqlSession.getMapper(Goods.class).getGood(categoryid);
                return goodList;
    }

    @Override
    public GoodCategory getGoodCategory(int categoryid) throws IOException {
        SqlSession sqlSession=getSqlSession();
        GoodCategory goodCategory = sqlSession.getMapper(Goods.class).getGoodCategory(categoryid);
        return goodCategory;
    }

    @Override
    public CartGood getGoodByid(String userid, int id) throws IOException {
        SqlSession sqlSession=getSqlSession();

        CartGood cartGood = sqlSession.getMapper(GoodCart.class).getGoodByid(userid,id);
        return cartGood;
    }

    @Override
    public void delGoodByid(String userid, int id) throws IOException {
        SqlSession sqlSession=getSqlSession();
        sqlSession.getMapper(GoodCart.class).delGoodByid(userid,id);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public CartGoodInsert getGoodByidinsert(int goodid) throws IOException {
        SqlSession sqlSession=getSqlSession();
        CartGoodInsert cartGoodInsert = sqlSession.getMapper(GoodCart.class).getGoodByidinsert(goodid);
        return cartGoodInsert;
    }

    @Override
    public void updaCartNumSel(String userid, int goodid, int count, boolean select,int totalprice) throws IOException {
        SqlSession sqlSession=getSqlSession();
        sqlSession.getMapper(GoodCart.class).updaCartNumSel
                (userid, goodid, count, select,totalprice);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public void updaCartSelect(String userid) throws IOException {
        SqlSession sqlSession=getSqlSession();
        sqlSession.getMapper(GoodCart.class).updaCartSelect(userid);
        sqlSession.commit();
        sqlSession.close();
    }
    @Override
    public void updaCartunSelect(String userid) throws IOException {
        SqlSession sqlSession=getSqlSession();
        sqlSession.getMapper(GoodCart.class).updaCartunSelect(userid);
        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public List<cartProduct> getGoodByuser(String userid) throws IOException {
        SqlSession sqlSession=getSqlSession();
        List<cartProduct> cartgoods = sqlSession.getMapper(GoodCart.class).getcartProduct(userid);
        return cartgoods;
    }

    @Override
    public void updateCartGood(String userid,int count,int goodid,int totalprice) throws IOException {
        SqlSession sqlSession=getSqlSession();
        sqlSession.getMapper(GoodCart.class).updateCartGood(userid,count,goodid,totalprice);

        sqlSession.commit();
        sqlSession.close();
    }

    @Override
    public void insCartGood(String userid, int goodid, String goodname, int price, int count,
                            String Subtitle,int ProductStock,int Status,boolean select
    ) throws IOException {
        SqlSession sqlSession=getSqlSession();
        sqlSession.getMapper(GoodCart.class).insCartGood(userid,goodid,goodname,price,count
        ,Subtitle,ProductStock,Status,select,count*price);
        sqlSession.commit();
        sqlSession.close();
    }

//    @Override
//    public List<CartGetGoodItem> getCartGood(String userid) throws IOException {
//        SqlSession sqlSession=getSqlSession();
//        return sqlSession.getMapper(GoodCart.class).getCartGood(userid);
//    }
}
