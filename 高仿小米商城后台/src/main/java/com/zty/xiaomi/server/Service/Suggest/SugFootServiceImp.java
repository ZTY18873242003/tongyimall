package com.zty.xiaomi.server.Service.Suggest;

import com.zty.xiaomi.server.Mapper.Suggest;
import com.zty.xiaomi.server.Entity.Suggest.SuggestFoot;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service
public class SugFootServiceImp implements SugFootService{

    @Autowired
    private Suggest suggest;

    @Cacheable(value = "suggest",key = "'suggest'")
    @Override
    public List<SuggestFoot> getSugFoot() throws IOException {
        List<SuggestFoot> suggestFoots = suggest.getSuggest();
        return suggestFoots;
    }
}
