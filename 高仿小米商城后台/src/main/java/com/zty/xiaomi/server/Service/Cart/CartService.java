package com.zty.xiaomi.server.Service.Cart;

import com.zty.xiaomi.server.Entity.Cart.cartProductVoList;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;

public interface CartService {

    cartProductVoList getCartProduct(String userid) throws IOException;

}
