package com.zty.xiaomi.server.Controller;


import com.zty.xiaomi.server.Entity.Order.OrdCreaParm;
import com.zty.xiaomi.server.Entity.Order.OrderList;
import com.zty.xiaomi.server.Entity.Order.OrderResult;
import com.zty.xiaomi.server.Service.Order.OrderServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@CrossOrigin
@RestController
@RequestMapping("orders")
public class OrderController {

    @Autowired
    private OrderServiceImp orderServiceImp;

    @PostMapping("/createorder")
    public OrderResult createOrder(@RequestBody OrdCreaParm ordCreaParm) throws IOException {

        OrderResult orderResult = new OrderResult();
        orderResult.setStatus(0);
        OrderList orderList = orderServiceImp.creatOrder(ordCreaParm);
        orderResult.setData(orderList);
        return orderResult;
    }

}
