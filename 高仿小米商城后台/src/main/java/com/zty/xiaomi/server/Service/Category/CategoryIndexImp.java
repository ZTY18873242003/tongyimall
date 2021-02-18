package com.zty.xiaomi.server.Service.Category;

import com.zty.xiaomi.server.Dao.Category;
import com.zty.xiaomi.server.Entity.index.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryIndexImp implements CategoryIndex {
    @Override
    public SqlSession getSqlSession() throws IOException {
        String resource = "mybatis-config.xml";//通过流处理获取sqlSessionFactory创建一个实例
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();//获取SqlSession实例
        return session;
    }

    @Override
    public CategoryResult getCategoryGoods() throws IOException {
        SqlSession sqlSession = getSqlSession();
        CategoryResult categoryResult = new CategoryResult();
        categoryResult.setStatus(0);

        CategorData categorData = new CategorData();

        ArrayList<Categor> categors = new ArrayList<>(8);
        for (int i = 1; i <= 8; i++) {
            Categor categor = new Categor();
            GoodCategory goodCategory = sqlSession.getMapper(Category.class).getGoodCategory(i);

            //后续每个分类中暑扩大后再改初始扩容1，现在只有4个
            ArrayList<List<CategoryGood>> lists = new ArrayList<>(1);
            int end= (i-1) * 12 + 8;
            for(int j=(i-1)*12+1;j<=end;j+=4){
                int k=j+3;
                List<CategoryGood> goodbyCategory = sqlSession.getMapper(Category.class).getGoodbyCategory(i, j, k);
                lists.add(goodbyCategory);
            }
            categor.setCategoryId(goodCategory.getCategoryId());
            categor.setName(goodCategory.getName());
            categor.setMenuList(lists);
            categors.add(categor);
        }
        categorData.setCateList(categors);
        categoryResult.setData(categorData);
        return categoryResult;
    }
}
