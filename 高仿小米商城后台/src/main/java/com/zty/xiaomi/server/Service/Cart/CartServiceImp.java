package com.zty.xiaomi.server.Service.Cart;

import com.zty.xiaomi.server.Dao.GoodCart;
import com.zty.xiaomi.server.Entity.Cart.cartProduct;
import com.zty.xiaomi.server.Entity.Cart.cartProductVoList;
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
public class CartServiceImp implements CartService{


    @Override
    public cartProductVoList getCartProduct(String userid) throws IOException {
        cartProductVoList cartProductVoList = new cartProductVoList();
        List<cartProduct> cartProducts = SqlSessionUtil.getInstance().getMapper(GoodCart.class).getcartProduct(userid);
        cartProductVoList.setList(cartProducts);
        return cartProductVoList;
    }
}
