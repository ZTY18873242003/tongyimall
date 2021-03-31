package com.zty.xiaomi.server.Controller;


import com.zty.xiaomi.server.Entity.Order.*;
import com.zty.xiaomi.server.Entity.User;
import com.zty.xiaomi.server.Service.Order.OrderServiceImp;
import com.zty.xiaomi.server.Service.RegLogin.RegLogServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/createorder")
    public OrderResult createOrder(@RequestBody OrdCreaParm ordCreaParm) throws IOException {
        OrderResult orderResult = new OrderResult();
        orderResult.setStatus(0);
        OrderList orderList = orderServiceImp.creatOrder(ordCreaParm);
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
}
