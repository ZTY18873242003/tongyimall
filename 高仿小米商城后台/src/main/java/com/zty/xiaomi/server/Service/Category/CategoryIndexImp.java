package com.zty.xiaomi.server.Service.Category;

import com.zty.xiaomi.server.Dao.Category;
import com.zty.xiaomi.server.Entity.index.*;
import com.zty.xiaomi.server.utils.SqlSessionUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryIndexImp implements CategoryIndex {

    @Override
    public int getCateCount() throws IOException {
        SqlSession sqlSession = SqlSessionUtil.getInstance();
        int cateCount = sqlSession.getMapper(Category.class).getCateCount();
        return cateCount;
    }

    @Override
    public CategoryResult getCategoryGoods() throws IOException {
        SqlSession sqlSession = SqlSessionUtil.getInstance();
        CategoryResult categoryResult = new CategoryResult();
        categoryResult.setStatus(0);

        CategorData categorData = new CategorData();

        int categoryCount=getCateCount();
        ArrayList<Categor> categors = new ArrayList<>(categoryCount);

        for (int i = 1; i <=categoryCount ; i++) {
            Categor categor = new Categor();
            GoodCategory goodCategory = sqlSession.getMapper(Category.class).getGoodCategory(i);
            categor.setCategoryId(goodCategory.getCategoryId());
            categor.setName(goodCategory.getName());

            List<CategoryGood> goodbyCategory = sqlSession.getMapper(Category.class).getGoodbyCategory(i);

            int compleKind= goodbyCategory.size()/4;

            ArrayList<ArrayList<CategoryGood>> lists = new ArrayList<>(1);

            for(int j=1;j<=compleKind;j++){
                ArrayList<CategoryGood> compleGoods = new ArrayList<>(4);
                compleGoods.add(goodbyCategory.get((j-1)*4));
                compleGoods.add(goodbyCategory.get((j-1)*4 + 1));
                compleGoods.add(goodbyCategory.get((j-1)*4 + 2));
                compleGoods.add(goodbyCategory.get((j-1)*4 + 3));

                lists.add(compleGoods);//四个一组完整的加入lists中
            }

            //表示不能整除4最后的剩余(0<num<4,1-3之间的数)
            int nocomple=goodbyCategory.size()%4;
            if(nocomple != 0){
                ArrayList<CategoryGood> uncomplGoods = new ArrayList<>(4);
                for(int k=0;k< nocomple;k++){
                    uncomplGoods.add(goodbyCategory.get(4*compleKind+k));
                }

                lists.add(uncomplGoods);
            }

            categor.setMenuList(lists);

            categors.add(categor);
        }

        categorData.setCateList(categors);
        categoryResult.setData(categorData);
        return categoryResult;

//        for (int i = 1; i <= 8; i++) {
//            Categor categor = new Categor();
//            GoodCategory goodCategory = sqlSession.getMapper(Category.class).getGoodCategory(i);
//
//            //后续每个分类中暑扩大后再改初始扩容1，现在只有4个
//            ArrayList<List<CategoryGood>> lists = new ArrayList<>(1);
//            int end= (i-1) * 12 + 8;
//            for(int j=(i-1)*12+1;j<=end;j+=4){
//                int k=j+3;
//                List<CategoryGood> goodbyCategory = sqlSession.getMapper(Category.class).getGoodbyCategory(i, j, k);
//                lists.add(goodbyCategory);
//            }
//            categor.setCategoryId(goodCategory.getCategoryId());
//            categor.setName(goodCategory.getName());
//            categor.setMenuList(lists);
//            categors.add(categor);
//        }
//        categorData.setCateList(categors);
//        categoryResult.setData(categorData);
//        return categoryResult;
    }
}
