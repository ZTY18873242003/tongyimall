package com.zty.xiaomi.server.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;

public class SqlSessionUtil {

    private static SqlSessionUtil sqlSessionUtil;

    static {
        try {
            sqlSessionUtil = new SqlSessionUtil();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private SqlSession session;
    private SqlSessionUtil() throws IOException {

        String resource = "mybatis-config.xml";//通过流处理获取sqlSessionFactory创建一个实例
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        session= sqlSessionFactory.openSession();//获取SqlSession实例

    }

    public static SqlSession getInstance(){
        return sqlSessionUtil.session;
    }
}
