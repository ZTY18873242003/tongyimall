package com.zty.xiaomi.server.Entity.Order;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties("alipay")
public class Alipay {
    private String app_id;
    private String gatewayUrl;
    private String format;
    private String charset;
    private String sign_type;
    private String merchant_private_key;
    private String alipay_public_key;
    private String return_url;
    private String notify_url;
}
