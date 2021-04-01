package com.zty.xiaomi.server.Service.ProdHead;

import com.zty.xiaomi.server.Entity.ProductHead.ProductHeadInfo;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

public interface ProdHead {

    List<ProductHeadInfo> getProductHeadInfo(int categoryId) throws IOException;
}
