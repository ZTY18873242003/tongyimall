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
        System.out.println(orderItems);
        OrdFinaResult orderResult = new OrdFinaResult();
        orderResult.setStatus(0);
        orderResult.setLists(orderItems);
        return orderResult;
    }
}
