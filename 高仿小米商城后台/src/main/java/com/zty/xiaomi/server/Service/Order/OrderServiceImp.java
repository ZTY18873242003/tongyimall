
package com.zty.xiaomi.server.Service.Order;

import com.zty.xiaomi.server.Entity.Address.Addre;
import com.zty.xiaomi.server.Entity.Cart.cartProduct;
import com.zty.xiaomi.server.Entity.Order.*;
import com.zty.xiaomi.server.Entity.User;
import com.zty.xiaomi.server.Mapper.GoodCart;
import com.zty.xiaomi.server.Mapper.Order;
import com.zty.xiaomi.server.Service.Cart.CartServiceImp;
import com.zty.xiaomi.server.Service.RegLogin.RegLogServiceImp;
import com.zty.xiaomi.server.utils.OrderNumUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Service
public class OrderServiceImp implements OrderService {

    @Autowired
    private RegLogServiceImp regLogServiceImp;
    @Autowired
    private CartServiceImp cartServiceImp;

    @Autowired
    private Order ordermapper;

    @Autowired
    private GoodCart goodCart;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;


    public OrderList creatOrder(OrdCreaParm ordCreaParm) {
        OrderList orderList = new OrderList();
        User user = regLogServiceImp.getUserByUserName(ordCreaParm.getName());
        String userid = user.getUserid();

        int orderNumber = OrderNumUtil.getOrderNumber();
        String createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        int payment=0;
        List<cartProduct> cartproducts = cartServiceImp.getCartProduct(userid).getList();
        for(cartProduct cartProductvo:cartproducts){
            payment+=cartProductvo.getProductTotalPrice();
        }
        orderList.setOrderNo(orderNumber);
        orderList.setPayment(payment);
        orderList.setStatus(10);//表示未支付的状态，支付完后要改值
        orderList.setStatusDesc("未支付");
        orderList.setCreateTime(createTime);
        orderList.setImageHost("www.mi.com");
        orderList.setShippingId(ordCreaParm.getShippingId());
        orderList.setReceiverName(getAdd(userid,ordCreaParm.getShippingId()).getReceiverName());
        orderList.setShippingVo(getAdd(userid,ordCreaParm.getShippingId()));


        class OrderCancel implements Runnable{
            @Override
            public void run() {
                try {
                    Thread.sleep(1800000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                int orderStatus = getOrderStatus(orderNumber);
                if(orderStatus == 10){
                    delOrder(orderNumber);
                }
            }
        }
        Thread thread = new Thread(new OrderCancel(),"取消订单监听线程");
        thread.start();

        ordermapper.insOrder(userid,orderNumber,payment,1,"在线支付",0,10,"未支付",
                "","",createTime.trim(),"www.mi.com",ordCreaParm.getShippingId(),getAdd(userid,ordCreaParm.getShippingId()).getReceiverName(),
                getAdd(userid,ordCreaParm.getShippingId()).getReceiverMobile(),getAdd(userid,ordCreaParm.getShippingId()).getReceiverProvince(),
                getAdd(userid,ordCreaParm.getShippingId()).getReceiverCity(),getAdd(userid,ordCreaParm.getShippingId()).getReceiverAddress(),
                getAdd(userid,ordCreaParm.getShippingId()).getReceiverZip());


        for(cartProduct cartProduct:cartproducts) {
            String orderImg = ordermapper.getOrderImg(cartProduct.getGood_id());
            ordermapper.insOrderGood(orderNumber,cartProduct.getGood_id(),cartProduct.getGoods_name(),cartProduct.getPrice(),
                    cartProduct.getCount(),cartProduct.getProductTotalPrice(),10,orderImg);
        }


        goodCart.delGoodByname(userid);

        return orderList;
    }

    @Override
    public int getOrderStatus(int orderid) {
        return ordermapper.getOrderStatus(orderid);
    }

    @Override
    public void delOrder(int orderid) {
        ordermapper.delOrde(orderid);
        ordermapper.delOrder(orderid);
    }

    @Override
    public List<orderItemVoList> getOrderItems(String userid) {
        List<orderItemVoList> orderItems = ordermapper.getOrderItems(userid);
        return orderItems;
    }

    @Override
    public Addre getAdd(String userid, int id) {
        Addre addre = ordermapper.getAddre(userid, id);
        return addre;
    }

    @Override
    public OrdFina getOrderById(int id) {
        OrdFina orderById = ordermapper.getOrderById(id);
        return orderById;
    }

    @Override
    public List<UserOrdList> getOrderList(String userid) {
        List<UserOrdList> userOrdList = ordermapper.getUserOrdList(userid);
        return userOrdList;
    }

    @Override
    public List<UserOrdItemList> getOrderListItems(int orderId) {
        List<UserOrdItemList> ordItems = ordermapper.getOrdItems(orderId);
        return ordItems;
    }

    @Override
    public void buyOrder(int id,String username) {
        ordermapper.buyOrder(id);
        User userByUserName = regLogServiceImp.getUserByUserName(username);
        String userid = userByUserName.getUserid();
        goodCart.delGoodByname(userid);

        Set<String> keys = stringRedisTemplate.keys("*");
        if (!keys.isEmpty()) {
            stringRedisTemplate.delete(keys);
        }
    }
}
