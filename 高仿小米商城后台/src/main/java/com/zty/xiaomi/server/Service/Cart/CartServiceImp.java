package com.zty.xiaomi.server.Service.Cart;

import com.zty.xiaomi.server.Dao.GoodCart;
import com.zty.xiaomi.server.Entity.Cart.cartProduct;
import com.zty.xiaomi.server.Entity.Cart.cartProductVoList;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service
public class CartServiceImp implements CartService{

    public SqlSession getSqlSession() throws IOException {
        String resource = "mybatis-config.xml";//通过流处理获取sqlSessionFactory创建一个实例
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();//获取SqlSession实例
        return session;
    }
    @Override
    public cartProductVoList getCartProduct(String userid) throws IOException {
        cartProductVoList cartProductVoList = new cartProductVoList();
        List<cartProduct> cartProducts = getSqlSession().getMapper(GoodCart.class).getcartProduct(userid);
        cartProductVoList.setList(cartProducts);
        return cartProductVoList;
    }
}
