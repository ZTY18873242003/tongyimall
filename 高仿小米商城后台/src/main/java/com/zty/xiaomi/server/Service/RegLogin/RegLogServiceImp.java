package com.zty.xiaomi.server.Service.RegLogin;

import com.zty.xiaomi.server.Entity.User;
import com.zty.xiaomi.server.Mapper.RegLogUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.io.IOException;

@Service
public class RegLogServiceImp implements RegLogService {

    @Autowired
    private RegLogUser regLogUsermapper;
    @Override
    public User getUserByName(String username) {
            User user = regLogUsermapper.getUserByName(username);
            return user;
    }

    @Override
    public User getUserByUserName(String username) {
            User user = regLogUsermapper.getUserByUserName(username);
            return user;
    }

    @Override
    public void insertUser(String userid, String name, String email, String pwd, String phone,String status, String date,String prikey) throws IOException {
        regLogUsermapper.insertUser(userid,name,email,pwd,phone,status,date,prikey);
    }
}
