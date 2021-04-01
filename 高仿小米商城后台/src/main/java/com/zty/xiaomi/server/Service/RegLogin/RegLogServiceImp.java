package com.zty.xiaomi.server.Service.RegLogin;

import com.zty.xiaomi.server.Dao.RegLogUser;
import com.zty.xiaomi.server.Entity.User;
import com.zty.xiaomi.server.utils.SqlSessionUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;


import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

@Service
public class RegLogServiceImp implements RegLogService {

    @Override
    public User getUserByName(String username) throws IOException {
            SqlSession sqlSession= SqlSessionUtil.getInstance();
            User user = sqlSession.getMapper(RegLogUser.class).getUserByName(username);
            sqlSession.commit();
            return user;
    }

    @Override
    public User getUserByUserName(String username) throws IOException {
            String resource = "mybatis-config.xml";//通过流处理获取sqlSessionFactory创建一个实例
            InputStream inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            SqlSession sqlSession= sqlSessionFactory.openSession();//获取SqlSession实例
            User user = sqlSession.getMapper(RegLogUser.class).getUserByUserName(username);
            return user;
    }

    @Override
    public void insertUser(String userid, String name, String email, String pwd, String phone,String status, String date,String prikey) throws IOException {
        SqlSession sqlSession=SqlSessionUtil.getInstance();


        sqlSession.getMapper(RegLogUser.class).insertUser(userid,name,email,pwd,phone,status,date,prikey);

        sqlSession.commit();

    }
}
