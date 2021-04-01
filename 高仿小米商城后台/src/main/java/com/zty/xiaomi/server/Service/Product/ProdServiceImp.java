package com.zty.xiaomi.server.Service.Product;

import com.zty.xiaomi.server.Dao.Product;
import com.zty.xiaomi.server.Entity.Product.ProductInfo;
import com.zty.xiaomi.server.utils.SqlSessionUtil;
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
    public ProductInfo getProductInfo(int id) throws IOException {
        SqlSession sqlSession = SqlSessionUtil.getInstance();
        ProductInfo productInfoById = sqlSession.getMapper(Product.class).getProductInfoById(id);
        return  productInfoById;
    }
}
