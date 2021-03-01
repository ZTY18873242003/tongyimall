package com.zty.xiaomi.server.Controller;

import com.zty.xiaomi.server.Entity.ProductFoot.ProductFootInfo;
import com.zty.xiaomi.server.Entity.ProductFoot.ProductFootResult;
import com.zty.xiaomi.server.Entity.ProductHead.ProductHeadInfo;
import com.zty.xiaomi.server.Entity.ProductHead.ProductHeadResult;
import com.zty.xiaomi.server.Entity.Suggest.SuggestFoot;
import com.zty.xiaomi.server.Entity.Suggest.SuggestFootResult;
import com.zty.xiaomi.server.Entity.index.CategoryResult;
import com.zty.xiaomi.server.Service.Category.CategoryIndexImp;
import com.zty.xiaomi.server.Service.ProdFoot.ProductFootImp;
import com.zty.xiaomi.server.Service.ProdHead.ProductHeadImp;
import com.zty.xiaomi.server.Service.Suggest.SugFootServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.io.IOException;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("index")
public class IndexController {
    @Autowired
    private CategoryIndexImp categoryIndexImp;
    @Autowired
    private ProductHeadImp productHeadImp;
    @Autowired
    private ProductFootImp productFootImp;
    @Autowired
    private SugFootServiceImp sugFootServiceImp;

    @RequestMapping("/category")
    public CategoryResult getCategory() throws IOException {
        CategoryResult categoryResult = new CategoryResult();
        categoryResult.setStatus(0);
        categoryResult = categoryIndexImp.getCategoryGoods();
        return categoryResult;
    }

    @RequestMapping("/product")
    public ProductHeadResult getProduct(@RequestParam("categoryId") int categoryId,
                                        @RequestParam("pageStart") int pageStart) throws IOException {

        ProductHeadResult productHeadResult = new ProductHeadResult();
        productHeadResult.setStatus(0);
        List<ProductHeadInfo> productHeadInfo = productHeadImp.getProductHeadInfo(categoryId,
                (categoryId - 1) * 12 + (pageStart-1)*6+1, (categoryId - 1) * 12 + pageStart*6);
        productHeadResult.setData(productHeadInfo);
        return productHeadResult;
    }

    @RequestMapping("/productfoot")
    public ProductFootResult getProductFoot(@RequestParam("categoryId") int categoryId) throws IOException {

        ProductFootResult productFootResult = new ProductFootResult();
        productFootResult.setStatus(0);
        List<ProductFootInfo> productFootInfo = productFootImp.getProductFootInfo(categoryId);
        productFootResult.setData(productFootInfo);
        return productFootResult;
    }

    @RequestMapping("/productfootnormal")
    public ProductFootResult getProductFootNormal(@RequestParam("categoryId") int categoryId) throws IOException {

        ProductFootResult productFootResult = new ProductFootResult();
        productFootResult.setStatus(0);
        List<ProductFootInfo> productFootInfo = productFootImp.getProductFootInfoNormal(categoryId);
        productFootResult.setData(productFootInfo);
        return productFootResult;
    }


    @RequestMapping("/suggest")
    public SuggestFootResult getSugFoot() throws IOException {
        SuggestFootResult suggestFootResult = new SuggestFootResult();
        suggestFootResult.setStatus(200);
        List<SuggestFoot> sugFoot = sugFootServiceImp.getSugFoot();
        suggestFootResult.setSugglist(sugFoot);
        return  suggestFootResult;
    }
}
