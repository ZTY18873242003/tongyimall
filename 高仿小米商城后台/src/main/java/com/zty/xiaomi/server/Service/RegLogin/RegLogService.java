package com.zty.xiaomi.server.Service.RegLogin;

import com.zty.xiaomi.server.Entity.User;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.Date;

public interface RegLogService {

    User getUserByName(String email) throws IOException;

    User getUserByUserName(String username) throws IOException;

    void insertUser(String userid, String name, String email, String pwd,
                    String phone, String status,String date,String prikey) throws IOException;

}
