package com.zty.xiaomi.server.Service.ProdHead;

import com.zty.xiaomi.server.Dao.ProductHead;
import com.zty.xiaomi.server.Entity.ProductHead.ProductHeadInfo;
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
public class ProductHeadImp implements ProdHead {
    @Override
    public List<ProductHeadInfo> getProductHeadInfo(int categoryId) throws IOException {
        SqlSession sqlSession = SqlSessionUtil.getInstance();
        List<ProductHeadInfo> productInfoById = sqlSession.getMapper(ProductHead.class)
                .getProductHeadInfo(categoryId);
        return  productInfoById;
    }
}
