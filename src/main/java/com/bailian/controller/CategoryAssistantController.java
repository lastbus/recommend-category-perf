package com.bailian.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bailian.model.*;
import com.bailian.page.Page;
import com.bailian.service.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/9.
 */
@Controller
@RequestMapping("/category")
public class CategoryAssistantController {
    @Resource
    private CategoryPerformanceCategoryYhdPriceDistService categoryPerformanceCategoryYhdPriceDistService;
    @Resource
    private CategoryPerformanceCategoryPriceConfService categoryPerformanceCategoryPriceConfService;
    @Resource
    private YhdItemsService yhdItemsService;
    @Resource
    private YhdCategoryNewArrivalService yhdCategoryNewArrivalService;
    @Resource
    private CategoryPerformanceBlYhdBrandContrastService categoryPerformanceBlYhdBrandContrastService;

    @RequestMapping("/categoryAssistant.html")
    public String categoryConfiguration() {
        return "project1/categoryAssistant";
    }

    @RequestMapping("/categoryChooseGoodsSuggest.html")
    public String categoryChooseGoodsSuggest(Model model, String categoryId) {
        model.addAttribute("categoryId", categoryId);
        return "project1/categoryChooseGoodsSuggest";
    }

    @RequestMapping("/categoryYhdPrice")
    @ResponseBody
    public String categoryYhdPrice(@Param("categoryId") String categoryId) {
        List<CategoryPerformanceCategoryYhdPriceDist> list = this.categoryPerformanceCategoryYhdPriceDistService.selectById(Integer.parseInt(categoryId));
        if (list.size() == 0) {
            return "0";
        }

        double measure = (list.get(0).getHighPrice() - list.get(0).getLowPrice());
        List<Integer> prices = new ArrayList<>();
        List<Integer> yhdgoodsNums = new ArrayList<>();
        List<Integer> yhdcomtNums = new ArrayList<>();
        List<Integer> goodsNums = new ArrayList<>();
        List<Integer> saleNums = new ArrayList<>();

        for (int i = 0; i < 20; i++) {
            prices.add(Integer.valueOf((int)(list.get(0).getLowPrice() + measure*i)));
            yhdgoodsNums.add(0);
            yhdcomtNums.add(0);
            goodsNums.add(0);
            saleNums.add(0);
        }
        //记录总数据量
        double sumYhdGoodsNum = 0, sumYhdComtNum = 0;
        for (int i = 0; i < list.size(); i++) {
            Integer rangeNo = list.get(i).getRangeNo();
            Integer yhdgoodsNum = list.get(i).getGoodsSum();
            Integer yhdcomtNum = list.get(i).getComtSum();
            sumYhdGoodsNum = sumYhdGoodsNum +  yhdgoodsNum;
            sumYhdComtNum = sumYhdComtNum + yhdcomtNum;
            for (int j = 0; j < 20; j++) {
                if (rangeNo == j) {
                    if (yhdgoodsNum != null && !yhdgoodsNum.equals("")) {
                        yhdgoodsNums.set(j, yhdgoodsNum);
                    } else {
                        yhdgoodsNums.set(j, 0);
                    }
                    if (yhdcomtNum != null && !yhdcomtNum.equals("")) {
                        yhdcomtNums.set(j, yhdcomtNum);
                    } else {
                        yhdcomtNums.set(j, 0);
                    }
                }
            }
        }

        List<CategoryPerformanceCategoryPriceConf> weList = this.categoryPerformanceCategoryPriceConfService.selectById(Integer.parseInt(categoryId));
        if (list.size() == 0) {
            return "1";
        }
        double sumSaleNum = 0 , sumGoodsNum = 0;
        for (int i = 0; i < weList.size(); i++) {
            Integer rangeNo = weList.get(i).getRangeNo();
            Integer type = weList.get(i).getType();
            //type=0为商品数，type=1为销量
            if (type == 1) {
                Integer saleNum = weList.get(i).getSaleSum();
                sumSaleNum = sumSaleNum + saleNum;
                for (int j = 0; j < 20; j++) {
                    if (rangeNo == j) {
                        if (saleNum != null && !saleNum.equals("")) {
                            saleNums.set(j, saleNum);
                        } else {
                            saleNums.set(j, 0);
                        }
                    }
                }
            } else if (type == 0) {
                Integer goodsNum = weList.get(i).getSaleSum();
                sumGoodsNum = sumGoodsNum + goodsNum;
                for (int j = 0; j < 20; j++) {
                    if (rangeNo == j) {
                        if (goodsNum != null && !goodsNum.equals("")) {
                            goodsNums.set(j, goodsNum);
                        } else {
                            goodsNums.set(j, 0);
                        }
                    }
                }
            }
        }
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("######.00");
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonPrice = new JSONArray();
        JSONArray jsonYhdGoodsNum = new JSONArray();
        JSONArray jsonYhdComtNum = new JSONArray();
        JSONArray jsonSaleNum = new JSONArray();
        JSONArray jsonGoodsNum = new JSONArray();

        for (int i = 0; i < 20; i++) {
            jsonPrice.add(prices.get(i));
            if (yhdgoodsNums.get(i) != 0) {
                jsonYhdGoodsNum.add(Double.parseDouble(df.format(yhdgoodsNums.get(i)*1.0/sumYhdGoodsNum)));
            } else {
                jsonYhdGoodsNum.add(0.0);
            }
            if (yhdcomtNums.get(i) != 0) {
                jsonYhdComtNum.add(Double.parseDouble(df.format(yhdcomtNums.get(i)*1.0/sumYhdComtNum)));
            } else {
                jsonYhdComtNum.add(0.0);
            }
            if (saleNums.get(i) != 0) {
                jsonSaleNum.add(Double.parseDouble(df.format(saleNums.get(i)*1.0/sumSaleNum)));
            } else {
                jsonSaleNum.add(0.0);
            }
            if (goodsNums.get(i) != 0) {
                jsonGoodsNum.add(Double.parseDouble(df.format(goodsNums.get(i)*1.0/sumGoodsNum)));
            } else {
                jsonGoodsNum.add(0.0);
            }
        }
        jsonObject.put("prices", jsonPrice);
        jsonObject.put("yhdgoodsSums", jsonYhdGoodsNum);
        jsonObject.put("yhdcomtSums", jsonYhdComtNum);
        jsonObject.put("saleSums", jsonSaleNum);
        jsonObject.put("goodsSums", jsonGoodsNum);
        jsonObject.put("sumYhdGoodsNum", sumYhdGoodsNum);
        jsonObject.put("sumYhdComtNum", sumYhdComtNum);
        jsonObject.put("sumSaleNum", sumSaleNum);
        jsonObject.put("sumGoodsNum", sumGoodsNum);
        return jsonObject.toString();
    }

    @RequestMapping("/categoryYhdItems")
    @ResponseBody
    public String categoryYhdItems(BootPage bootPage,
                                   @Param("categoryid") String categoryid,
                                   @Param("column") String column,
                                   @Param("order") String order) {
        Map param = new HashMap();
        if (categoryid.matches("^\\d+$")&& categoryid != null && !categoryid.equals("")) {
            param.put("categorySid", Integer.parseInt(categoryid));
        }
        if (column != null && !column.equals("") && order != null && !order.equals("")) {
            if (column.equals("favorableRate")) {
                column = "favorable_rate";
            }
            param.put("columnOrder", column + " " + order);
        }
        if (column == null || column.equals("") && order != null && !order.equals("")) {
            param.put("columnOrder", "comment" + " " + order);
        }
        Page<YhdItems> page = Page.startPage(YhdItems.class, bootPage);
        List<YhdItems> list = this.yhdItemsService.listPage(param);
        bootPage.setPage(page);
        String result = bootPage.printOut(list);
        return result;
    }

    @RequestMapping("/categoryYhdNewArrival")
    @ResponseBody
    public String categoryYhdNewArrival(BootPage bootPage,
                                        @Param("categoryid") String categoryid,
                                        @Param("column") String column,
                                        @Param("order") String order) {
        Map param = new HashMap();
        if (categoryid.matches("^\\d+$")&& categoryid != null && !categoryid.equals("")) {
            param.put("categorySid", Integer.parseInt(categoryid));
        }
        if (column != null && !column.equals("") && order != null && !order.equals("")) {
            if (column.equals("favorableRate")) {
                column = "favorable_rate";
            }
            param.put("columnOrder", column + " " + order);
        }
        if (column == null || column.equals("") && order != null && !order.equals("")) {
            param.put("columnOrder", "comment" + " " + order);
        }
        Page<YhdCategoryNewArrival> page = Page.startPage(YhdCategoryNewArrival.class, bootPage);
        List<YhdCategoryNewArrival> list = this.yhdCategoryNewArrivalService.listPage(param);
        bootPage.setPage(page);
        String result = bootPage.printOut(list);
        return result;
    }

    @RequestMapping("/categoryYhdBrandChoose")
    @ResponseBody
    public String categoryYhdBrandChoose(@Param("categorySid") String categorySid) {
        List<CategoryPerformanceBlYhdBrandContrast> list = this.categoryPerformanceBlYhdBrandContrastService.selectByCategoryId(Integer.parseInt(categorySid));
        JSONArray jsonArray = new JSONArray();
        JSONObject brands = new JSONObject();
        for (int i = 0; i < list.size(); i++) {
            jsonArray.add(list.get(i).getYhdBrand());
        }
        brands.put("brands", jsonArray);
        return brands.toString();
    }

}
