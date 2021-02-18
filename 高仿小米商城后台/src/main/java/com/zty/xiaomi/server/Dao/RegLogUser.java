package com.zty.xiaomi.server.Dao;

import com.zty.xiaomi.server.Entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.Date;

public interface RegLogUser {
    @Select("select userid,name,email,pwd,tel from userinfo where name like #{username}")
    User getUserByName(String username);

    @Select("select userid,name,email,pwd,tel from userinfo where name like #{username}")
    User getUserByUserName(String username);

    @Insert("insert into userinfo values(#{userid},#{name},#{email},#{pwd},#{phone},#{status},#{date})")
    void insertUser(String userid, String name, String email, String pwd, String phone, String status,String date);


}
