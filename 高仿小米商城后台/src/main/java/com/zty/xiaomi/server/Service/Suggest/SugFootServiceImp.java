package com.zty.xiaomi.server.Service.Suggest;

import com.zty.xiaomi.server.Dao.Suggest;
import com.zty.xiaomi.server.Entity.Suggest.SuggestFoot;
import com.zty.xiaomi.server.utils.SqlSessionUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service
public class SugFootServiceImp implements SugFootService{

    @Override
    public List<SuggestFoot> getSugFoot() throws IOException {

        SqlSession sqlSession = SqlSessionUtil.getInstance();
        List<SuggestFoot> suggestFoots = sqlSession.getMapper(Suggest.class).getSuggest();
        return suggestFoots;
    }
}
