package com.zty.xiaomi.server.Service.ProdFoot;

import com.zty.xiaomi.server.Mapper.ProductFoot;
import com.zty.xiaomi.server.Mapper.Suggest;
import com.zty.xiaomi.server.Entity.ProductFoot.ProductFootInfo;
import com.zty.xiaomi.server.Entity.Suggest.SuggestBig;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
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

    @Autowired
    private RedisTemplate redisTemplate;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private final String listkey1 = "pflist1";
    private final String listkey2 = "pflist2";
    private final String listkey3 = "pflist3";
    private final String listkey4 = "pflist4";
    private final String listkey5 = "pflist5";
    private final String listkey6 = "pflist6";


    @Override
    public List<ProductFootInfo> getProductFootInfo(int categoryId) {

        String listkey=null;

       switch (categoryId){
           case 1:
               listkey=listkey1;
               break;
           case 2:
               listkey=listkey2;
               break;
           case 3:
               listkey=listkey3;
               break;
           case 4:
               listkey=listkey4;
               break;
           case 5:
               listkey=listkey5;
               break;
           case 6:
               listkey=listkey6;
               break;
       }

        List<ProductFootInfo> productFootInfos = (List<ProductFootInfo>) redisTemplate.opsForList().index(listkey,0 );
        //缓存无数据从数据库查

       if(productFootInfos == null) {

           ArrayList<SuggestBig> suggestBigs = new ArrayList<>();
           if (categoryId == 1) {
               List<SuggestBig> suggestBig1 = suggest.getSuggestBig(1);
               suggestBigs.addAll(suggestBig1);
           } else if (categoryId == 2) {
               List<SuggestBig> suggestBig2 = suggest.getSuggestBig(2);
               List<SuggestBig> suggestBig4 = suggest.getSuggestBig(4);
               suggestBigs.addAll(suggestBig2);
               suggestBigs.addAll(suggestBig4);
           } else if (categoryId == 3) {
               List<SuggestBig> suggestBig5 = suggest.getSuggestBig(5);
               List<SuggestBig> suggestBig9 = suggest.getSuggestBig(9);
               suggestBigs.addAll(suggestBig5);
               suggestBigs.addAll(suggestBig9);
           } else if (categoryId == 4) {
               List<SuggestBig> suggestBig7 = suggest.getSuggestBig(7);
               suggestBigs.addAll(suggestBig7);
           } else if (categoryId == 5) {
               List<SuggestBig> suggestBig6 = suggest.getSuggestBig(6);
               suggestBigs.addAll(suggestBig6);
           } else if (categoryId == 6) {
               List<SuggestBig> suggestBig5 = suggest.getSuggestBig(5);
               List<SuggestBig> suggestBig8 = suggest.getSuggestBig(8);
               suggestBigs.addAll(suggestBig5);
               suggestBigs.addAll(suggestBig8);
           }


           ArrayList<String> suggestBigNames = new ArrayList<>();
           for (SuggestBig suggestBig : suggestBigs) {
               suggestBigNames.add(suggestBig.getName());
           }

           //数据库查出的数据
           logger.info("findAll -> 从数据库中读取放入缓存中");

           ArrayList<ProductFootInfo> productFootInfos1 = new ArrayList<>();
           for (String suggestBigName : suggestBigNames) {
               ProductFootInfo productInfoById = productFootmapper.getProductFootInfo(suggestBigName);
               productFootInfos1.add(productInfoById);
           }
           productFootInfos=productFootInfos1;
           redisTemplate.opsForList().leftPush(listkey,productFootInfos);

       }
       else {
           logger.info("findAll -> 从缓存中读取");
       }
        return  productFootInfos;
    }

    @Override
    public List<ProductFootInfo> getProductFootInfoNormal(int category_id) throws IOException {
        List<ProductFootInfo> productFootInfoNormal = productFootmapper.getProductFootInfoNormal(category_id);
        return productFootInfoNormal;
    }
}
