package com.zty.xiaomi.server;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;


@SpringBootApplication(exclude= {DataSourceAutoConfiguration.class})

@MapperScan("com.zty.xiaomi.server.Mapper")
public class ServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServerApplication.class, args);
    }

}
