package com.zty.xiaomi.server.Config;


import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.HashMap;


@Configuration
public class DruidConfig {
    @ConfigurationProperties(prefix = "spring.datasource")
    @Bean
    public DataSource druidDataSource(){
        return new DruidDataSource();
    }

    //后台监控:因为springboot内置了servlet容器，使用没有web.xml，可以用ServletRegistrationBean替代
    @Bean
    public ServletRegistrationBean statViewServlet(){
        ServletRegistrationBean<StatViewServlet> bean = new ServletRegistrationBean<>(new StatViewServlet(),"/druid/*");

        //后台需要有人登陆，账号密码
        HashMap<String,String> initParameters = new HashMap<>();

        //增加配置
        initParameters.put("loginUsername","admin");  //登陆参数是固定的
        initParameters.put("loginPassword","2000918131X");

        //允许谁可以访问
        initParameters.put("allow","");


        bean.setInitParameters(initParameters);  //设置初始化参数
        return bean;
    }

}
