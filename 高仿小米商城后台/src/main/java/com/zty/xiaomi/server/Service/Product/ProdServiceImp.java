package com.zty.xiaomi.server.Service.Product;

import com.zty.xiaomi.server.Dao.Product;
import com.zty.xiaomi.server.Entity.Product.ProductInfo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;

@Service
public class ProdServiceImp implements ProdService{

    @Override
    public SqlSession getSqlSession() throws IOException {
        String resource = "mybatis-config.xml";//通过流处理获取sqlSessionFactory创建一个实例
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();//获取SqlSession实例
        return session;
    }

    @Override
    public ProductInfo getProductInfo(int id) throws IOException {
        SqlSession sqlSession = getSqlSession();
        ProductInfo productInfoById = sqlSession.getMapper(Product.class).getProductInfoById(id);
        return  productInfoById;
    }
}
