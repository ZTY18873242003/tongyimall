package com.zty.xiaomi.server.Service.Product;

import com.zty.xiaomi.server.Entity.Product.ProductInfo;
import com.zty.xiaomi.server.Mapper.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class ProdServiceImp implements ProdService{

    @Autowired
    private Product productmapper;

    @Override
    public ProductInfo getProductInfo(int id) throws IOException {
        ProductInfo productInfoById = productmapper.getProductInfoById(id);
        return  productInfoById;
    }
}
