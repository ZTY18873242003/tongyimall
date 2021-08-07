package com.zty.xiaomi.server.Controller;


import com.alipay.easysdk.factory.Factory;
import com.zty.xiaomi.server.Mapper.Order;
import com.zty.xiaomi.server.Service.AlipayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/alipay")
public class AliPayController {
    @Autowired
    private AlipayService alipayService;

    @Autowired
    private Order order;

    /**
     * 跳转到支付界面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("/page")
    public String pay(String subject, String total) throws Exception {
        return alipayService.toPayPage(subject, "10011", total);
    }

    /**
     * @param request: 请求
     * @return java.lang.String
     * @description: 支付宝异步回调
     */
    @RequestMapping("/notify")
    public String notify_url(HttpServletRequest request) throws Exception {

        if (request.getParameter("trade_status").equals("TRADE_SUCCESS")) {
            System.out.println("=========支付宝异步回调========");

            Map<String, String> params = new HashMap<>();
            Map<String, String[]> requestParams = request.getParameterMap();
            for (String name : requestParams.keySet()) {
                params.put(name, request.getParameter(name));
                // System.out.println(name + " = " + request.getParameter(name));
            }

            // 支付宝验签
            if (Factory.Payment.Common().verifyNotify(params)) {
                // 验签通过
                System.out.println("交易名称: " + params.get("subject"));
                System.out.println("交易状态: " + params.get("trade_status"));
                System.out.println("支付宝交易凭证号: " + params.get("trade_no"));
                System.out.println("商户订单号: " + params.get("out_trade_no"));
                System.out.println("交易金额: " + params.get("total_amount"));
                System.out.println("买家在支付宝唯一id: " + params.get("buyer_id"));
                System.out.println("买家付款时间: " + params.get("gmt_payment"));
                System.out.println("买家付款金额: " + params.get("buyer_pay_amount"));

                int out_trade_no = Integer.parseInt(params.get("out_trade_no"));
                order.updOrderTime(out_trade_no,params.get("gmt_payment"));
                order.buyOrder(out_trade_no);
            }
        }
        return "success";
    }
}
