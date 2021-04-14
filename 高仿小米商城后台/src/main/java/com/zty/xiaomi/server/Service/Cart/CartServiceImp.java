package com.zty.xiaomi.server.Service.Cart;

import com.zty.xiaomi.server.Entity.Cart.cartProduct;
import com.zty.xiaomi.server.Entity.Cart.cartProductVoList;
import com.zty.xiaomi.server.Mapper.GoodCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImp implements CartService{

    @Autowired
    private GoodCart goodCartmapper;

    @Override
    public cartProductVoList getCartProduct(String userid) {
        cartProductVoList cartProductVoList = new cartProductVoList();
        List<cartProduct> cartProducts =goodCartmapper.getcartProduct(userid);
        cartProductVoList.setList(cartProducts);
        return cartProductVoList;
    }
}
