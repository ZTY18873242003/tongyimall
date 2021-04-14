package com.zty.xiaomi.server.Service.Category;

import com.zty.xiaomi.server.Entity.index.CategoryResult;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;

public interface CategoryIndex {


    int getCateCount() throws IOException;
    CategoryResult getCategoryGoods() throws IOException;
}
