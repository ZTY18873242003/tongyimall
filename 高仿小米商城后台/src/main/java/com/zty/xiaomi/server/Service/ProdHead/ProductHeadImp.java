package com.zty.xiaomi.server.Service.ProdHead;

import com.zty.xiaomi.server.Mapper.ProductHead;
import com.zty.xiaomi.server.Entity.ProductHead.ProductHeadInfo;

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
public class ProductHeadImp implements ProdHead {
    @Autowired
    private ProductHead productHead;

    @Cacheable(value = "phlist",key = "'phlist'+#categoryId")
    @Override
    public List<ProductHeadInfo> getProductHeadInfo(int categoryId) throws IOException {

        List<ProductHeadInfo> productInfoById = productHead.getProductHeadInfo(categoryId);
        return  productInfoById;
    }
}
