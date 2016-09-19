package com.bailian.controller;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.deserializer.DateDeserializer;
import com.alibaba.fastjson.serializer.DoubleArraySerializer;
import com.bailian.service.CategoryPerformanceBasicService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/category")
public class CategoryIndexController {
    @Resource
    private CategoryPerformanceBasicService categoryPerformanceBasicService;

    @RequestMapping("/categoryIndex.html")
    public String categoryPerformanceIndex() {
        return "project1/categoryIndex";
    }

    @RequestMapping("/CategoryPerformance")
    @ResponseBody
    public String CategoryPerformance() {
        List<Map> list = this.categoryPerformanceBasicService.selectFirstLevel();
        if (list.size() == 0) {
            return "0";
        }
        List<String> categorys = new ArrayList<>();
        List<Double> performances = new ArrayList<>();
        //构建月份的Y轴, X轴
        for (int i = 0; i < list.size(); i++) {
            categorys.add(list.get(i).get("category_name").toString());
            performances.add((double)(list.get(i).get("performance")));
        }
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonCategory = new JSONArray();
        JSONArray jsonperformance = new JSONArray();

        for (int i = 0; i < performances.size(); i++) {
            jsonCategory.add(categorys.get(i));
            jsonperformance.add(performances.get(i));
        }

        jsonObject.put("categorys", jsonCategory);
        jsonObject.put("performances", jsonperformance);
        return jsonObject.toString();
    }

    @RequestMapping("/categorySales")
    @ResponseBody
    public String categorySales() {
        List<Map> list = this.categoryPerformanceBasicService.selectFirstLevel();
        if (list.size() == 0) {
            return "0";
        }
        List<String> categorys = new ArrayList<>();
        List<Double> sales = new ArrayList<>();
        //构建月份的Y轴, X轴
        for (int i = 0; i < list.size(); i++) {
            categorys.add(list.get(i).get("category_name").toString());
            sales.add((double)(list.get(i).get("ninety_day_sales")));
        }
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonCategory = new JSONArray();
        JSONArray jsonSales = new JSONArray();
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("#########.00");

        for (int i = 0; i < sales.size(); i++) {
            jsonCategory.add(categorys.get(i));
            jsonSales.add(Double.parseDouble(df.format(sales.get(i))));
        }

        jsonObject.put("categorys", jsonCategory);
        jsonObject.put("sales", jsonSales);
        return jsonObject.toString();
    }

    @RequestMapping("/categoryGoodsNumber")
    @ResponseBody
    public String categoryGoodsNumber() {
        List<Map> list = this.categoryPerformanceBasicService.selectFirstLevel();
        if (list.size() == 0) {
            return "0";
        }
        List<String> categorys = new ArrayList<>();
        List<Long> goodsNums1 = new ArrayList<>();
        List<Long> goodsNums2 = new ArrayList<>();

        for (int i = 0; i < list.size(); i++) {
            categorys.add(list.get(i).get("category_name").toString());
            goodsNums1.add((long)(list.get(i).get("goodsNum1")));
            goodsNums2.add((long)(list.get(i).get("goodsNum2")));
        }
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonCategory = new JSONArray();
        JSONArray jsonGoodsNum1 = new JSONArray();
        JSONArray jsonGoodsNum2 = new JSONArray();

        for (int i = 0; i < categorys.size(); i++) {
            jsonCategory.add(categorys.get(i));
            jsonGoodsNum1.add(goodsNums1.get(i));
            jsonGoodsNum2.add(goodsNums2.get(i));
        }

        jsonObject.put("categorys", jsonCategory);
        jsonObject.put("goodsNum1", jsonGoodsNum1);
        jsonObject.put("goodsNum2", jsonGoodsNum2);
        return jsonObject.toString();
    }

    @RequestMapping("/CategoryBrandsNmuber")
    @ResponseBody
    public String CategoryBrandsNmuber() {
        List<Map> list = this.categoryPerformanceBasicService.selectFirstLevel();
        if (list.size() == 0) {
            return "0";
        }
        List<String> categorys = new ArrayList<>();
        List<Integer> brandNums = new ArrayList<>();
        //构建月份的Y轴, X轴
        for (int i = 0; i < list.size(); i++) {
            categorys.add(list.get(i).get("category_name").toString());
            brandNums.add((int)(list.get(i).get("brand_num")));
        }
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonCategory = new JSONArray();
        JSONArray jsonGoodsNum = new JSONArray();

        for (int i = 0; i < brandNums.size(); i++) {
            jsonCategory.add(categorys.get(i));
            jsonGoodsNum.add(brandNums.get(i));
        }

        jsonObject.put("categorys", jsonCategory);
        jsonObject.put("brandNums", jsonGoodsNum);
        return jsonObject.toString();
    }

    @RequestMapping("/CategoryAllRatio")
    @ResponseBody
    public String CategoryAllRatio() {
        List<Map> list = this.categoryPerformanceBasicService.selectFirstLevel();
        if (list.size() == 0) {
            return "0";
        }
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("####.00");
        List<String> categorys = new ArrayList<>();
        List<Long> skus = new ArrayList<>();
        List<Integer> brandNums = new ArrayList<>();
        List<Double> sales = new ArrayList<>();
        Long skuAll = 0l;
        Integer brandNumsAll = 0;
        Double salesAll = 0.0;
        for (int i = 0; i < list.size(); i++) {
            Long sku = (long)(list.get(i).get("goodsNum1"));
            Integer brandNum = (int)(list.get(i).get("brand_num"));
            Double sale = (double)(list.get(i).get("ninety_day_sales"));
            categorys.add(list.get(i).get("category_name").toString());
            skus.add(sku);
            brandNums.add(brandNum);
            sales.add(sale);
            skuAll = skuAll + sku;
            brandNumsAll = brandNumsAll + brandNum;
            salesAll = salesAll + sale;
        }
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonCategory = new JSONArray();
        JSONArray skuRatio = new JSONArray();
        JSONArray brandRatio = new JSONArray();
        JSONArray salesRatio = new JSONArray();

        for (int i = 0; i < categorys.size(); i++) {
            jsonCategory.add(categorys.get(i));
            skuRatio.add(Double.parseDouble(df.format(skus.get(i)*1.0/skuAll)));
            brandRatio.add(Double.parseDouble(df.format(brandNums.get(i)*1.0/brandNumsAll)));
            salesRatio.add(Double.parseDouble(df.format(sales.get(i)*1.0/salesAll)));
        }

        jsonObject.put("categorys", jsonCategory);
        jsonObject.put("skuRatio", skuRatio);
        jsonObject.put("brandRatio", brandRatio);
        jsonObject.put("salesRatio", salesRatio);
        return jsonObject.toString();
    }

    @RequestMapping("/categoryIndexBasic")
    @ResponseBody
    public String categoryIndexBasic() {
        Map map  = this.categoryPerformanceBasicService.selectIndexBasic();
        if (map.size() == 0) {
            return "0";
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("brandNum", map.get("brand_num"));
        jsonObject.put("totalNum", map.get("total_num"));
        jsonObject.put("sales", map.get("sales"));
        return jsonObject.toString();
    }


}
