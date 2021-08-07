
package com.zty.xiaomi.server.Service.Order;

import com.zty.xiaomi.server.Entity.Address.Addre;
import com.zty.xiaomi.server.Entity.Cart.CartGoodInsert;
import com.zty.xiaomi.server.Entity.Cart.cartProduct;
import com.zty.xiaomi.server.Entity.Order.*;
import com.zty.xiaomi.server.Entity.User;
import com.zty.xiaomi.server.Mapper.GoodCart;
import com.zty.xiaomi.server.Mapper.Order;
import com.zty.xiaomi.server.Service.Cart.CartServiceImp;
import com.zty.xiaomi.server.Service.RegLogin.RegLogServiceImp;
import com.zty.xiaomi.server.utils.OrderNumUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Service
@EnableAspectJAutoProxy(proxyTargetClass = true)
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

    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,timeout=36000,rollbackFor=Exception.class)
    public OrderList creatOrder(OrdCreaParm ordCreaParm) throws Exception {
        OrderList orderList = new OrderList();
        User user = regLogServiceImp.getUserByUserName(ordCreaParm.getName());
        String userid = user.getUserid();

        int orderNumber = OrderNumUtil.getOrderNumber();
        String createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        int payment=0;
        List<cartProduct> cartproducts = cartServiceImp.getCartProduct(userid).getList();

        /*
        预减库存事务回滚
         */
        try {

            for(cartProduct cartProductvo : cartproducts){
                int count = cartProductvo.getCount();
                int goodid = cartProductvo.getGood_id();
                int prodStock = ordermapper.getProdStock(goodid);
                int sellcount = ordermapper.getProdSellCount(goodid);
                //乐观锁防止高并发超卖,超卖则返回0并抛出异常，正常售出返回1
                int succ = ordermapper.chanProdStock(goodid,prodStock,prodStock-count);
                ordermapper.addSellCount(goodid,sellcount+count);
                if(succ == 0){
                    throw new Exception();
                }
            }

            for (cartProduct cartProductvo : cartproducts) {
                payment += cartProductvo.getProductTotalPrice();
            }
            orderList.setOrderNo(orderNumber);
            orderList.setPayment(payment);
            orderList.setStatus(10);//表示未支付的状态，支付完后要改值
            orderList.setStatusDesc("未支付");
            orderList.setCreateTime(createTime);
            orderList.setImageHost("www.mi.com");
            orderList.setShippingId(ordCreaParm.getShippingId());
            orderList.setReceiverName(getAdd(userid, ordCreaParm.getShippingId()).getReceiverName());
            orderList.setShippingVo(getAdd(userid, ordCreaParm.getShippingId()));


            class OrderCancel implements Runnable {
                @Override
                public void run() {
                    try {
                        Thread.sleep(18000000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    int orderStatus = getOrderStatus(orderNumber);
                    if (orderStatus == 10) {
                        delOrder(orderNumber);
                    }
                }
            }
            Thread thread = new Thread(new OrderCancel(), "取消订单监听线程");
            thread.start();

            ordermapper.insOrder(userid, orderNumber, payment, 1, "在线支付", 0, 10, "未支付",
                    "", "", createTime.trim(), "www.mi.com", ordCreaParm.getShippingId(), getAdd(userid, ordCreaParm.getShippingId()).getReceiverName(),
                    getAdd(userid, ordCreaParm.getShippingId()).getReceiverMobile(), getAdd(userid, ordCreaParm.getShippingId()).getReceiverProvince(),
                    getAdd(userid, ordCreaParm.getShippingId()).getReceiverCity(), getAdd(userid, ordCreaParm.getShippingId()).getReceiverAddress(),
                    getAdd(userid, ordCreaParm.getShippingId()).getReceiverZip());


            for (cartProduct cartProduct : cartproducts) {
                String orderImg = ordermapper.getOrderImg(cartProduct.getGood_id());
                ordermapper.insOrderGood(orderNumber, cartProduct.getGood_id(), cartProduct.getGoods_name(), cartProduct.getPrice(),
                        cartProduct.getCount(), cartProduct.getProductTotalPrice(), 10, orderImg);
            }
            goodCart.delGoodByname(userid);
        }catch (Exception e){
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

        }
        return orderList;
    }

    @Override
    public int getOrderStatus(int orderid) {
        return ordermapper.getOrderStatus(orderid);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,timeout=36000,rollbackFor=Exception.class)
    public void delOrder(int orderid) {
        try {
            ordermapper.delOrde(orderid);
            List<UserOrdItemList> ordItems = ordermapper.getOrdItems(orderid);
            for(UserOrdItemList userOrdItemList:ordItems){
                int productId = userOrdItemList.getProductId();
                int quantity = userOrdItemList.getQuantity();
                CartGoodInsert goodByidinsert = goodCart.getGoodByidinsert(productId);
                int productStock = goodByidinsert.getProductStock();
                int sellcount = goodByidinsert.getSellcount();
                ordermapper.rollbackStock(productId,productStock+quantity);
                ordermapper.rollbackSellCount(productId,sellcount+quantity);
            }
            ordermapper.delOrder(orderid);
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
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

    /*
    直接支付
     */
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
