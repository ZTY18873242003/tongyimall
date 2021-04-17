package com.zty.xiaomi.server.Service.Cart;

import ch.qos.logback.classic.Logger;
import com.zty.xiaomi.server.Entity.Cart.cartProduct;
import com.zty.xiaomi.server.Entity.Cart.cartProductVoList;
import com.zty.xiaomi.server.Mapper.GoodCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImp implements CartService{

    @Autowired
    private GoodCart goodCartmapper;

    @Cacheable(value = "cart",key = "'cart'+#userid",unless = "#result==null")
    @Override
    public cartProductVoList getCartProduct(String userid) {
        cartProductVoList cartProductVoList = new cartProductVoList();
        List<cartProduct> cartProducts = goodCartmapper.getcartProduct(userid);
        if(cartProducts.isEmpty()){
            return null;
        }
        cartProductVoList.setList(cartProducts);
        return cartProductVoList;
    }
}
