
package com.zty.xiaomi.server.Service.Order;

import com.zty.xiaomi.server.Dao.Order;
import com.zty.xiaomi.server.Entity.Address.Addre;
import com.zty.xiaomi.server.Entity.Cart.cartProduct;
import com.zty.xiaomi.server.Entity.Cart.cartProductVoList;
import com.zty.xiaomi.server.Entity.Order.*;
import com.zty.xiaomi.server.Entity.User;
import com.zty.xiaomi.server.Service.Cart.CartServiceImp;
import com.zty.xiaomi.server.Service.RegLogin.RegLogServiceImp;
import com.zty.xiaomi.server.utils.OrderNumUtil;
import com.zty.xiaomi.server.utils.SqlSessionUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImp implements OrderService {

    @Autowired
    private RegLogServiceImp regLogServiceImp;
    @Autowired
    private CartServiceImp cartServiceImp;



    public OrderList creatOrder(OrdCreaParm ordCreaParm) throws IOException {
        SqlSession sqlSession = SqlSessionUtil.getInstance();
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

        sqlSession.getMapper(Order.class).insOrder(userid,orderNumber,payment,1,"在线支付",0,10,"未支付",
                "","",createTime.trim(),"www.mi.com",ordCreaParm.getShippingId(),getAdd(userid,ordCreaParm.getShippingId()).getReceiverName(),
                getAdd(userid,ordCreaParm.getShippingId()).getReceiverMobile(),getAdd(userid,ordCreaParm.getShippingId()).getReceiverProvince(),
                getAdd(userid,ordCreaParm.getShippingId()).getReceiverCity(),getAdd(userid,ordCreaParm.getShippingId()).getReceiverAddress(),
                getAdd(userid,ordCreaParm.getShippingId()).getReceiverZip());
        sqlSession.commit();

        for(cartProduct cartProduct:cartproducts) {

            String orderImg = sqlSession.getMapper(Order.class).getOrderImg(cartProduct.getGood_id());
            sqlSession.getMapper(Order.class).insOrderGood(orderNumber,cartProduct.getGood_id(),cartProduct.getGoods_name(),cartProduct.getPrice(),
                    cartProduct.getCount(),cartProduct.getProductTotalPrice(),10,orderImg);
            sqlSession.commit();
        }

        return orderList;
    }

    @Override
    public List<orderItemVoList> getOrderItems(String userid) throws IOException {
        SqlSession sqlSession = SqlSessionUtil.getInstance();
        List<orderItemVoList> orderItems = sqlSession.getMapper(Order.class).getOrderItems(userid);
        return orderItems;
    }

    @Override
    public Addre getAdd(String userid, int id) throws IOException {
        SqlSession sqlSession = SqlSessionUtil.getInstance();
        Addre addre = sqlSession.getMapper(Order.class).getAddre(userid, id);
        return addre;
    }

    @Override
    public OrdFina getOrderById(int id) throws IOException {
        SqlSession sqlSession = SqlSessionUtil.getInstance();
        OrdFina orderById = sqlSession.getMapper(Order.class).getOrderById(id);
        return orderById;
    }

    @Override
    public List<UserOrdList> getOrderList(String userid) throws IOException {
        SqlSession sqlSession = SqlSessionUtil.getInstance();
        List<UserOrdList> userOrdList = sqlSession.getMapper(Order.class).getUserOrdList(userid);
        return userOrdList;
    }

    @Override
    public List<UserOrdItemList> getOrderListItems(int orderId) throws IOException {
        SqlSession sqlSession = SqlSessionUtil.getInstance();
        List<UserOrdItemList> ordItems = sqlSession.getMapper(Order.class).getOrdItems(orderId);
        return ordItems;
    }
}
