package com.zty.xiaomi.server.Controller;



import com.zty.xiaomi.server.Entity.Order.*;
import com.zty.xiaomi.server.Entity.User;
import com.zty.xiaomi.server.Service.AlipayService;
import com.zty.xiaomi.server.Service.Order.OrderServiceImp;
import com.zty.xiaomi.server.Service.RegLogin.RegLogServiceImp;


import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.domain.AlipayTradePagePayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.io.IOException;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("orders")
public class OrderController {

    @Autowired
    private OrderServiceImp orderServiceImp;

    @Autowired
    private RegLogServiceImp regLogServiceImp;

    @Autowired
    private AlipayService alipayService;

    @Autowired
    private Alipay alipay;


    @Autowired
    private AlipayClient alipayClient;

    @PostMapping("/createorder")
    public OrderResult createOrder(@RequestBody OrdCreaParm ordCreaParm) throws Exception {
        OrderResult orderResult = new OrderResult();
        orderResult.setStatus(0);
        OrderList orderList = orderServiceImp.creatOrder(ordCreaParm);
        if(orderList.getOrderNo() == 0){
            orderResult.setStatus(1);
            return orderResult;
        }
        orderResult.setData(orderList);
        return orderResult;
    }

    @RequestMapping("/getorderlist")
    public UserOrdListResult getUserOrdList(String username) throws IOException {

        UserOrdListResult userOrdListResult = new UserOrdListResult();
        User user = regLogServiceImp.getUserByUserName(username);
        String userid = user.getUserid();

        List<UserOrdList> orderList = orderServiceImp.getOrderList(userid);

        for(UserOrdList userOrdList:orderList){
            int orderNo = userOrdList.getOrderNo();
            List<UserOrdItemList> orderListItems = orderServiceImp.getOrderListItems(orderNo);
            userOrdList.setItems(orderListItems);
        }

        userOrdListResult.setStatus(0);
        userOrdListResult.setTotal(orderList.size());
        userOrdListResult.setList(orderList);

        return userOrdListResult;

    }



    //下单成功后调用下面两个方法
    @RequestMapping("/getorder")
    public OrdFinaResult getOrder(@RequestParam("id") int id) throws IOException{
        OrdFinaResult orderResult = new OrdFinaResult();
        orderResult.setStatus(0);
        OrdFina orderList = orderServiceImp.getOrderById(id);
        orderResult.setOrdFina(orderList);
        return orderResult;
    }


    @RequestMapping("/getorderdetail")
    public OrdFinaResult getOrderDetail(@RequestParam("username") String username) throws IOException{
        User user = regLogServiceImp.getUserByUserName(username);
        String userid = user.getUserid();
        List<orderItemVoList> orderItems = orderServiceImp.getOrderItems(userid);
        OrdFinaResult orderResult = new OrdFinaResult();
        orderResult.setStatus(0);
        orderResult.setLists(orderItems);
        return orderResult;
    }

    @RequestMapping("/buy")
    public void buyOrder(@RequestParam("id") int id,
                         @RequestParam("name") String username){
        orderServiceImp.buyOrder(id,username);

    }

    @RequestMapping("/page")
    public String butrue(@RequestBody OrdPayParm ordPayParm) throws Exception {

        return alipayService.toPayPage(ordPayParm.getSubject(), ordPayParm.getOrderId(), ordPayParm.getTotal());
    }
}
