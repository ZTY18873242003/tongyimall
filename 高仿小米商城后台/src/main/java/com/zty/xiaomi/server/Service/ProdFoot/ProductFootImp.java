package com.zty.xiaomi.server.Service.ProdFoot;

import com.zty.xiaomi.server.Mapper.ProductFoot;
import com.zty.xiaomi.server.Mapper.Suggest;
import com.zty.xiaomi.server.Entity.ProductFoot.ProductFootInfo;
import com.zty.xiaomi.server.Entity.Suggest.SuggestBig;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProductFootImp implements ProdFoot {

    @Autowired
    private Suggest suggest;

    @Autowired
    private ProductFoot productFootmapper;

    @Override
    public List<ProductFootInfo> getProductFootInfo(int categoryId) throws IOException {
//        SqlSession sqlSession = ;

        ArrayList<SuggestBig> suggestBigs = new ArrayList<>();
        if(categoryId==1){
            List<SuggestBig> suggestBig1 = suggest.getSuggestBig(1);
            suggestBigs.addAll(suggestBig1);
        }
        else if(categoryId==2){
            List<SuggestBig> suggestBig2 = suggest.getSuggestBig(2);
            List<SuggestBig> suggestBig4 = suggest.getSuggestBig(4);
            suggestBigs.addAll(suggestBig2);
            suggestBigs.addAll(suggestBig4);
        }
        else if(categoryId==3){
            List<SuggestBig> suggestBig5 = suggest.getSuggestBig(5);
            List<SuggestBig> suggestBig9 = suggest.getSuggestBig(9);
            suggestBigs.addAll(suggestBig5);
            suggestBigs.addAll(suggestBig9);
        }
        else if(categoryId==4){
            List<SuggestBig> suggestBig7 = suggest.getSuggestBig(7);
            suggestBigs.addAll(suggestBig7);
        }
        else if(categoryId==5){
            List<SuggestBig> suggestBig6 = suggest.getSuggestBig(6);
            suggestBigs.addAll(suggestBig6);
        }
        else if(categoryId==6){
            List<SuggestBig> suggestBig5 = suggest.getSuggestBig(5);
            List<SuggestBig> suggestBig8 = suggest.getSuggestBig(8);
            suggestBigs.addAll(suggestBig5);
            suggestBigs.addAll(suggestBig8);
        }


        ArrayList<String> suggestBigNames = new ArrayList<>();
        for(SuggestBig suggestBig:suggestBigs){
            suggestBigNames.add(suggestBig.getName());
        }
        List<ProductFootInfo> productFootInfos=new ArrayList<>();
        for(String suggestBigName:suggestBigNames) {
            ProductFootInfo productInfoById = productFootmapper.getProductFootInfo(suggestBigName);
            productFootInfos.add(productInfoById);
        }
        return  productFootInfos;
    }

    @Override
    public List<ProductFootInfo> getProductFootInfoNormal(int category_id) throws IOException {
        List<ProductFootInfo> productFootInfoNormal = productFootmapper.getProductFootInfoNormal(category_id);
        return productFootInfoNormal;
    }
}
