package com.zty.xiaomi.server.Service.Product;

import com.zty.xiaomi.server.Entity.Product.ProductInfo;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;

public interface ProdService {
    SqlSession getSqlSession() throws IOException;
    ProductInfo getProductInfo(int id) throws IOException;
}
