package com.zty.xiaomi.server.utils;

import java.text.SimpleDateFormat;
import java.util.Date;


public class DateUtil {
    public static String ptfDate(){
        //产生新的日期对象（使用Date生成
        Date currentTime = new Date();
        //产生新的日期对象（使用System.currentTimeMillis()
        /*
        long currnetTime1 = System.currentTimeMillis();
    	*/
        //新建日期格式
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        //将日期对象格式化成指定格式并以String输出
        String date = simpleDateFormat.format(currentTime);
        return date;


    }
}
