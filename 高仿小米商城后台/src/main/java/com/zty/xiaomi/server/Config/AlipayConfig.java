package com.zty.xiaomi.server.Config;


import com.alipay.easysdk.factory.Factory;
import com.alipay.easysdk.kernel.Config;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class AlipayConfig implements ApplicationRunner {
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    @Value("${alipay.app_id}")
    public String app_id;
    // 商户私钥，您的PKCS8格式RSA2私钥
    @Value("${alipay.merchant_private_key}")
    public String merchant_private_key;
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    @Value("${alipay.alipay_public_key}")
    public String alipay_public_key;
    //格式
    @Value("${alipay.format}")
    public String format;

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    @Value("${alipay.notify_url}")
    public String notify_url;
    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    // 即支付成功之后，需要跳转到的页面，一般为网站的首页
    @Value("${alipay.return_url}")
    public String return_url;
    // 签名方式
    @Value("${alipay.sign_type}")
    public String sign_type;
    // 字符编码格式
    @Value("${alipay.charset}")
    public String charset;
    // 支付宝网关
    @Value("${alipay.gatewayUrl}")
    public String gatewayUrl;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        //这里省略了一些不必要的配置，可参考文档的说明
        Config config = new Config();
        config.protocol = "https";
        config.gatewayHost = this.gatewayUrl;
        config.signType = this.sign_type;
        config.appId = this.app_id;
        // 为避免私钥随源码泄露，推荐从文件中读取私钥字符串而不是写入源码中
        config.merchantPrivateKey = this.merchant_private_key;
        // 注：如果采用非证书模式，则无需赋值上面的三个证书路径，改为赋值如下的支付宝公钥字符串即可
        config.alipayPublicKey = this.alipay_public_key;
        // 可设置异步通知接收服务地址（可选）
        config.notifyUrl = this.notify_url;
        //初始化支付宝SDK
        Factory.setOptions(config);
        System.out.println("=======支付宝SDK初始化成功");
    }
}
