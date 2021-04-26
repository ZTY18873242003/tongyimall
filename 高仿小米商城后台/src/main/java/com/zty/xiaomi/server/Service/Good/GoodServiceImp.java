package com.zty.xiaomi.server.Service.Good;

import com.zty.xiaomi.server.Entity.Cart.CartGood;
import com.zty.xiaomi.server.Entity.Cart.CartGoodInsert;
import com.zty.xiaomi.server.Entity.Cart.cartProduct;
import com.zty.xiaomi.server.Entity.Good;
import com.zty.xiaomi.server.Entity.index.GoodCategory;
import com.zty.xiaomi.server.Mapper.GoodCart;
import com.zty.xiaomi.server.Mapper.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GoodServiceImp implements GoodService {

    @Autowired
    private Goods goodsmapper;
    @Autowired
    private GoodCart goodCartmapper;

    @Override
    public List<Good> getGood(int categoryid) {
        List<Good> goodList = goodsmapper.getGood(categoryid);
                return goodList;
    }

    @Override
    public GoodCategory getGoodCategory(int categoryid) {
        GoodCategory goodCategory = goodsmapper.getGoodCategory(categoryid);
        return goodCategory;
    }

    @Override
    public CartGood getGoodByid(String userid, int id) {
        CartGood cartGood = goodCartmapper.getGoodByid(userid,id);
        return cartGood;
    }

    @CacheEvict(value = "cart",key = "'cart'+#userid")
    @Override
    public void delGoodByid(String userid, int id) {
        goodCartmapper.delGoodByid(userid,id);
    }


    @Override
    public CartGoodInsert getGoodByidinsert(int goodid) {
        CartGoodInsert cartGoodInsert = goodCartmapper.getGoodByidinsert(goodid);
        return cartGoodInsert;
    }


    @CacheEvict(value = "cart",key = "'cart'+#userid")
    @Override
    public void updaCartNumSel(String userid, int goodid, int count, boolean select,int totalprice) {
        goodCartmapper.updaCartNumSel(userid, goodid, count, select,totalprice);
    }

    @CacheEvict(value = "cart",key = "'cart'+#userid")
    @Override
    public void updaCartSelect(String userid) {
        goodCartmapper.updaCartSelect(userid);
    }

    @CacheEvict(value = "cart",key = "'cart'+#userid")
    @Override
    public void updaCartunSelect(String userid) {
        goodCartmapper.updaCartunSelect(userid);
    }

    @Override
    public List<cartProduct> getGoodByuser(String userid) {
        List<cartProduct> cartgoods = goodCartmapper.getcartProduct(userid);
        return cartgoods;
    }

    @CacheEvict(value = "cart",key = "'cart'+#userid")
    @Override
    public void updateCartGood(String userid,int count,int goodid,int totalprice) {
        goodCartmapper.updateCartGood(userid,count,goodid,totalprice);
    }

    @CacheEvict(value = "cart",key = "'cart'+#userid")
    @Override
    public void insCartGood(String userid, int goodid, String goodname, int price, int count,
                            String Subtitle,int ProductStock,int Status,boolean select
    ) {
        goodCartmapper.insCartGood(userid,goodid,goodname,price,count,Subtitle,ProductStock,Status,select,count*price);
    }

}
