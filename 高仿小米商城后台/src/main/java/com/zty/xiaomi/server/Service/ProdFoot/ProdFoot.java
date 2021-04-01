package com.zty.xiaomi.server.Service.ProdFoot;

import com.zty.xiaomi.server.Entity.ProductFoot.ProductFootInfo;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

public interface ProdFoot {


    List<ProductFootInfo> getProductFootInfo(int categoryId) throws IOException;

    List<ProductFootInfo> getProductFootInfoNormal(int category_id) throws IOException;
}
