package com.zty.xiaomi.server.Service.ProdHead;

import com.zty.xiaomi.server.Entity.ProductHead.ProductHeadInfo;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

public interface ProdHead {
    SqlSession getSqlSession() throws IOException;
    List<ProductHeadInfo> getProductHeadInfo(int categoryId, int pageStart, int pageEnd) throws IOException;
}
