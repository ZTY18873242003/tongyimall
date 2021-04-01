package com.zty.xiaomi.server.Service.ProdFoot;

import com.zty.xiaomi.server.Dao.ProductFoot;
import com.zty.xiaomi.server.Dao.Suggest;
import com.zty.xiaomi.server.Entity.ProductFoot.ProductFootInfo;
import com.zty.xiaomi.server.Entity.Suggest.SuggestBig;
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
public class ProductFootImp implements ProdFoot {

    @Override
    public List<ProductFootInfo> getProductFootInfo(int categoryId) throws IOException {
        SqlSession sqlSession = SqlSessionUtil.getInstance();

        ArrayList<SuggestBig> suggestBigs = new ArrayList<>();
        if(categoryId==1){
            List<SuggestBig> suggestBig1 = sqlSession.getMapper(Suggest.class).getSuggestBig(1);
            suggestBigs.addAll(suggestBig1);
        }
        else if(categoryId==2){
            List<SuggestBig> suggestBig2 = sqlSession.getMapper(Suggest.class).getSuggestBig(2);
            List<SuggestBig> suggestBig4 = sqlSession.getMapper(Suggest.class).getSuggestBig(4);
            suggestBigs.addAll(suggestBig2);
            suggestBigs.addAll(suggestBig4);
        }
        else if(categoryId==3){
            List<SuggestBig> suggestBig5 = sqlSession.getMapper(Suggest.class).getSuggestBig(5);
            List<SuggestBig> suggestBig9 = sqlSession.getMapper(Suggest.class).getSuggestBig(9);
            suggestBigs.addAll(suggestBig5);
            suggestBigs.addAll(suggestBig9);
        }
        else if(categoryId==4){
            List<SuggestBig> suggestBig7 = sqlSession.getMapper(Suggest.class).getSuggestBig(7);
            suggestBigs.addAll(suggestBig7);
        }
        else if(categoryId==5){
            List<SuggestBig> suggestBig6 = sqlSession.getMapper(Suggest.class).getSuggestBig(6);
            suggestBigs.addAll(suggestBig6);
        }
        else if(categoryId==6){
            List<SuggestBig> suggestBig5 = sqlSession.getMapper(Suggest.class).getSuggestBig(5);
            List<SuggestBig> suggestBig8 = sqlSession.getMapper(Suggest.class).getSuggestBig(8);
            suggestBigs.addAll(suggestBig5);
            suggestBigs.addAll(suggestBig8);
        }


        ArrayList<String> suggestBigNames = new ArrayList<>();

        for(SuggestBig suggestBig:suggestBigs){
            suggestBigNames.add(suggestBig.getName());
        }
        List<ProductFootInfo> productFootInfos=new ArrayList<>();
        for(String suggestBigName:suggestBigNames) {
            ProductFootInfo productInfoById = sqlSession.getMapper(ProductFoot.class).getProductFootInfo(suggestBigName);
            productFootInfos.add(productInfoById);
        }
        return  productFootInfos;
    }

    @Override
    public List<ProductFootInfo> getProductFootInfoNormal(int category_id) throws IOException {
        SqlSession sqlSession = SqlSessionUtil.getInstance();
        List<ProductFootInfo> productFootInfoNormal = sqlSession.getMapper(ProductFoot.class).getProductFootInfoNormal(category_id);
        return productFootInfoNormal;
    }
}
