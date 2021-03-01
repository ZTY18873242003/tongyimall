package com.zty.xiaomi.server.Service.Suggest;

import com.zty.xiaomi.server.Entity.Suggest.SuggestFoot;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

public interface SugFootService {

    SqlSession getSqlSession() throws IOException;

    List<SuggestFoot> getSugFoot() throws IOException;
}
