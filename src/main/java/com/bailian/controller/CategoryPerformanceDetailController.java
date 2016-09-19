package com.bailian.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bailian.model.*;
import com.bailian.page.Page;
import com.bailian.service.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by YQ85 on 2016/8/22.
 */
@Controller
@RequestMapping("/category")
public class CategoryPerformanceDetailController {
    @Resource
    private CategoryPerformanceCategoryPriceConfService categoryPerformanceCategoryPriceConfService;
    @Resource
    private CategoryPerformanceCategoryMonthlySalesService categoryPerformanceCategoryMonthlySalesService;
    @Resource
    private CategoryPerformanceCategoryMonthlyHotcakesService categoryPerformanceCategoryMonthlyHotcakesService;
    @Resource
    private CategoryPerformanceCategorySaleScoreService categoryPerformanceCategorySaleScoreService;
    @Resource
    private CategoryPerformanceProductLineScoreService categoryPerformanceProductLineScoreService;
    @Resource
    private CategoryPerformanceCategoryPopularityService categoryPerformanceCategoryPopularityService;
    @Resource
    private CategoryPerformanceCategoryPopularityScoreService categoryPerformanceCategoryPopularityScoreService;
    @Resource
    private CategoryPerformanceCategoryOperationScoreService categoryPerformanceCategoryOperationScoreService;
    @Resource
    private CategoryPerformanceGoodsShelfSalesRatioService categoryPerformanceGoodsShelfSalesRatioService;
    @Resource
    private CategoryPerformanceBasicService categoryPerformanceBasicService;
    @Resource
    private YhdCategoryService yhdCategoryService;
    @Resource
    private CategoryPerformanceBlYhdBrandContrastService categoryPerformanceBlYhdBrandContrastService;

    @RequestMapping("categoryPerformanceDetail.html")
    public String categoryPerformanceDetail(Model model, String categoryId) {
        model.addAttribute("categoryId", categoryId);
        return "project1/categoryPerformanceDetail";
    }

    @RequestMapping("/categoryCompare.html")
    public String CategoryCompare(Model model, String categoryId) {
        model.addAttribute("categoryId", categoryId);
        return "project1/categoryCompare";
    }

    @RequestMapping("/categoryHotcakeCompare.html")
    public String categoryHotcakeCompare(Model model, String categoryId) {
        model.addAttribute("categoryId", categoryId);
        return "project1/categoryHotcakeCompare";
    }

    @RequestMapping("/categoryBasic")
    @ResponseBody
    public String categoryBasic(@Param("categorySid") String categorySid) {
        CategoryPerformanceBasic basic= this.categoryPerformanceBasicService.selectByPrimaryKey(Integer.parseInt(categorySid));
        String result = JSONObject.toJSONString(basic);
        return result;
    }

    //销售价格
    @RequestMapping("/categoryPrice")
    @ResponseBody
    public String categoryPrice(@Param("categorySid") String categorySid) {
        List<CategoryPerformanceCategoryPriceConf> list = this.categoryPerformanceCategoryPriceConfService.selectById(Integer.parseInt(categorySid));
        if (list.size() == 0) {
            return "0";
        }
        double measure = (list.get(0).getHighPrice() - list.get(0).getLowPrice());
        List<Integer> prices = new ArrayList<>();
        List<Integer> saleNums1 = new ArrayList<>();
        List<Integer> saleNums0 = new ArrayList<>();

        for (int i = 0; i < 20; i++) {
            prices.add(Integer.valueOf((int)(list.get(0).getLowPrice() + measure*i)));
            saleNums1.add(0);
            saleNums0.add(0);
        }
        //记录总数据量
        double sum0 = 0.0, sum1 = 0.0;
        for (int i = 0; i < list.size(); i++) {
            Integer rangeNo = list.get(i).getRangeNo();
            Integer type = list.get(i).getType();
            //type=0为商品数，type=1为销量
            if (type == 1) {
                Integer saleNum1 = list.get(i).getSaleSum();
                sum1 += saleNum1;
                for (int j = 0; j < 20; j++) {
                    if (rangeNo == j) {
                        if (saleNum1 != null && !saleNum1.equals("")) {
                            saleNums1.set(j, saleNum1);
                        } else {
                            saleNums1.set(j, 0);
                        }
                    }
                }
            } else if (type == 0) {
                Integer saleNum0 = list.get(i).getSaleSum();
                sum0 += saleNum0;
                for (int j = 0; j < 20; j++) {
                    if (rangeNo == j) {
                        if (saleNum0 != null && !saleNum0.equals("")) {
                            saleNums0.set(j, saleNum0);
                        } else {
                            saleNums0.set(j, 0);
                        }
                    }
                }
            }
        }
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("######.00");
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonPrice = new JSONArray();
        JSONArray jsonSales1 = new JSONArray();
        JSONArray jsonSales0 = new JSONArray();
        for (int i = 0; i < 20; i++) {
            jsonPrice.add(prices.get(i));
            if (saleNums0.get(i) != 0) {
                jsonSales0.add(Double.parseDouble(df.format(saleNums0.get(i)*1.0/sum0)));
            } else {
                jsonSales0.add(0.0);
            }
            if (saleNums1.get(i) != 0) {
                jsonSales1.add(Double.parseDouble(df.format(saleNums1.get(i)*1.0/sum1)));
            } else {
                jsonSales1.add(0.0);
            }
        }
        jsonObject.put("prices", jsonPrice);
        jsonObject.put("saleNums1", jsonSales1);
        jsonObject.put("saleNums0", jsonSales0);
        jsonObject.put("sum0", sum0);
        jsonObject.put("sum1", sum1);
        return jsonObject.toString();
    }

    //销量
    @RequestMapping("/categorySalesMoney")
    @ResponseBody
    public String categorySaleVolume(@Param("categorySid") String categorySid) {
        List<CategoryPerformanceCategoryMonthlySales> list = this.categoryPerformanceCategoryMonthlySalesService.selectById(Integer.parseInt(categorySid));
        if (list.size() == 0) {
            return "0";
        }

        List<String> months = new ArrayList<>();
        List<Double> sales = new ArrayList<>();
        //构建月份的Y轴, X轴
        for (int i = 0; i < 10; i++) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
            Date date = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.MONTH, i - 10 + 1);
            months.add(sdf.format(cal.getTime()));
            sales.add(0.0);
        }
        for (int i = 0; i < list.size(); i++) {
            String month = list.get(i).getMonth();
            Double sale = list.get(i).getSales();
            for (int j=0; j < months.size(); j++) {
                if (months.get(j).equals(month)) {
                    if (sale != null && !sale.equals("")) {
                        sales.set(j, sale);
                    } else {
                        sales.set(j, 0.0);
                    }
                }
            }
        }
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonSale = new JSONArray();
        JSONArray jsonMonth = new JSONArray();

        for (int i = 0; i < 10; i++) {
            jsonSale.add(sales.get(i));
            jsonMonth.add(months.get(i));
        }

        jsonObject.put("sales", jsonSale);
        jsonObject.put("months", jsonMonth);
        return jsonObject.toString();
    }

    //销量占比
    @RequestMapping("/categorySalesPerformance")
    @ResponseBody
    public String categorySalesPerformance(@Param("categorySid") String categorySid) {
        //获取全站每月月销售额
        List<Map> map = this.categoryPerformanceCategoryMonthlySalesService.selectTotalSales();
        List<CategoryPerformanceCategoryMonthlySales> list = this.categoryPerformanceCategoryMonthlySalesService.selectById(Integer.parseInt(categorySid));
        if (list.size() == 0) {
            return "0";
        }
        List<String> months = new ArrayList<>();
        List<Double> volumes = new ArrayList<>();
        List<Double> total = new ArrayList<>();
        //构建月份的Y轴, X轴
        for (int i = 0; i < 10; i++) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
            Date date = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.MONTH, i - 10 + 1);
            months.add(sdf.format(cal.getTime()));
            volumes.add(0.0);
            total.add(1.0);
        }
        double sumVolumes = 0.0;
        java.text.DecimalFormat   df   = new   java.text.DecimalFormat("####.00");
        for (int i = 0; i < list.size(); i++) {
            String month = list.get(i).getMonth();
            Double volume = list.get(i).getSales();
            sumVolumes = sumVolumes +  volume;
            for (int j=0; j < months.size(); j++) {
                if (months.get(j).equals(month)) {
                    for (int m = 0; m < map.size(); m++) {
                        if (map.get(m).get("month").equals(month)) {
                            if (volume != null && !volume.equals("")) {
                                volumes.set(j, Double.parseDouble(df.format(volume/Double.valueOf(map.get(m).get("totalSales").toString()))));
                            } else {
                                volumes.set(j, 0.0);
                            }
                        }
                    }
                }
            }
        }
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonVolume = new JSONArray();
        JSONArray jsonMonth = new JSONArray();
        JSONArray jsonTotal = new JSONArray();
        for (int i = 0; i < 10; i++) {
            jsonVolume.add(Double.parseDouble(df.format(volumes.get(i)*100)));
            jsonMonth.add(months.get(i));
            if(volumes.get(i) == 0.0) {
                jsonTotal.add((int)(total.get(i)*100));
            } else {
                jsonTotal.add((int)(total.get(i)*100 - volumes.get(i)*100));
            }
        }
        jsonObject.put("volumes", jsonVolume);
        jsonObject.put("months", jsonMonth);
        jsonObject.put("total", jsonTotal);
        return jsonObject.toString();
    }

    //销售绩效的table值
    @RequestMapping("/categorySalesPerformanceTable")
    @ResponseBody
    public String categorySalesPerformanceTable(@Param("categorySid") String categorySid) {
        CategoryPerformanceCategorySaleScore score = this.categoryPerformanceCategorySaleScoreService.selectByPrimaryKey(Integer.parseInt(categorySid));
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("####.00");
        if (score != null && !score.equals("")) {
            score.setSalesScore(Double.parseDouble(df.format(score.getSalesScore())));
            score.setAveGrowthRate(Double.parseDouble(df.format(score.getAveGrowthRate())));
            score.setAveGrowthRateScore(Double.parseDouble(df.format(score.getAveGrowthRateScore())));
            score.setNinetyDaySalesRatio(Double.parseDouble(df.format(score.getNinetyDaySalesRatio())));
            score.setNinetyDaySalesScore(Double.parseDouble(df.format(score.getNinetyDaySalesScore())));
            score.setSingleSkuSalesRatio(Double.parseDouble(df.format(score.getSingleSkuSalesRatio())));
            score.setSingleSkuSalesScore(Double.parseDouble(df.format(score.getSingleSkuSalesScore())));
        }
        String result = JSONObject.toJSONString(score);
        return result;
    }

    @RequestMapping("/categoryHotcakes")
    @ResponseBody
    public String categoryHotcakes(BootPage bootPage,
                                   @Param("categoryid") String categoryid,
                                   @Param("month") String month,
                                   @Param("column") String column,
                                   @Param("order") String order) {
        Map param = new HashMap();
        if (categoryid != null && !categoryid.equals("")) {
            param.put("categorySid", Integer.parseInt(categoryid));
        }
        if (month != null && !month.equals("") && !month.equals("all")) {
            param.put("month", month);
        }
        if (column != null && !column.equals("") && order != null && !order.equals("")) {
            if (column.equals("saleAmount")) {
                column = "sale_amount";
            } else if(column.equals("goodsSalePrice")){
                column = "goods_sale_price";
            }
            param.put("columnOrder", column + " " + order);
        }
        Page<CategoryPerformanceCategoryMonthlyHotcakes> page = Page.startPage(CategoryPerformanceCategoryMonthlyHotcakes.class, bootPage);
        List<CategoryPerformanceCategoryMonthlyHotcakes> list = this.categoryPerformanceCategoryMonthlyHotcakesService.listPageHotcakes(param);
        bootPage.setPage(page);
        String result = bootPage.printOut(list);
        return result;
    }

    @RequestMapping("/getCategoryHotcakesMonth")
    @ResponseBody
    public String getCategoryHotcakesMonth(@Param("categorySid") String categorySid) {
        List<String> list = this.categoryPerformanceCategoryMonthlyHotcakesService.selectMonthByCategoryId(Integer.parseInt(categorySid));
        JSONArray months = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        for (int i = 0; i < list.size(); i++) {
            months.add(list.get(i));
        }
        jsonObject.put("months", months);
        return jsonObject.toString();
    }

    //动销率
    @RequestMapping("/CategorySaleRatio")
    @ResponseBody
    public String CategorySaleRatio(@Param("categorySid") String categorySid) {
        List<CategoryPerformanceCategoryMonthlySales> list = this.categoryPerformanceCategoryMonthlySalesService.selectById(Integer.parseInt(categorySid));
        if (list.size() == 0) {
            return "0";
        }
        List<String> months = new ArrayList<>();
        List<Double> saleRatios = new ArrayList<>();
        //构建月份的Y轴, X轴
        for (int i = 0; i < 10; i++) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
            Date date = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.MONTH, i - 10 + 1);
            months.add(sdf.format(cal.getTime()));
            saleRatios.add(0.0);
        }
        for (int i = 0; i < list.size(); i++) {
            String month = list.get(i).getMonth();
            Double saleRatio = list.get(i).getShelfSalesRatio();
            for (int j=0; j < months.size(); j++) {
                if (months.get(j).equals(month)) {
                    if (saleRatio != null && !saleRatio.equals("")) {
                        saleRatios.set(j, saleRatio);
                    } else {
                        saleRatios.set(j, 0.0);
                    }
                }
            }
        }
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonSaleRatio = new JSONArray();
        JSONArray jsonMonth = new JSONArray();
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("####.00");
        for (int i = 0; i < 10; i++) {
            jsonSaleRatio.add(Double.parseDouble(df.format(saleRatios.get(i))));
            jsonMonth.add(months.get(i));
        }
        jsonObject.put("SaleRatios", jsonSaleRatio);
        jsonObject.put("months", jsonMonth);
        return jsonObject.toString();
    }

    //集中度
    @RequestMapping("/CategorySaleConcentrationRatio")
    @ResponseBody
    public String CategorySaleConcentrationRatio(@Param("categorySid") String categorySid) {
        List<CategoryPerformanceCategoryMonthlySales> list = this.categoryPerformanceCategoryMonthlySalesService.selectById(Integer.parseInt(categorySid));
        if (list.size() == 0) {
            return "0";
        }
        List<String> months = new ArrayList<>();
        List<Double> saleRatio80s = new ArrayList<>();
        List<Double> saleRatio50s = new ArrayList<>();
        //构建月份的Y轴, X轴
        for (int i = 0; i < 10; i++) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
            Date date = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.MONTH, i - 10 + 1);
            months.add(sdf.format(cal.getTime()));
            saleRatio80s.add(0.0);
            saleRatio50s.add(0.0);
        }
        for (int i = 0; i < list.size(); i++) {
            String month = list.get(i).getMonth();
            Double saleRatio50 = list.get(i).getFiftyPercentCnr();
            Double saleRatio80 = list.get(i).getEightyPercentCnr();
            for (int j=0; j < months.size(); j++) {
                if (months.get(j).equals(month)) {
                    if (saleRatio50 != null && !saleRatio50.equals("")) {
                        saleRatio50s.set(j, saleRatio50);
                    } else {
                        saleRatio50s.set(j, 0.0);
                    }
                    if (saleRatio80 != null && !saleRatio80.equals("")) {
                        saleRatio80s.set(j, saleRatio80);
                    } else {
                        saleRatio80s.set(j, 0.0);
                    }

                }
            }
        }

        JSONObject jsonObject = new JSONObject();
        JSONArray jsonSaleRatio50 = new JSONArray();
        JSONArray jsonSaleRatio80 = new JSONArray();
        JSONArray jsonMonth = new JSONArray();
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("####.00");
        for (int i = 0; i < 10; i++) {
            jsonSaleRatio50.add(Double.parseDouble(df.format(saleRatio50s.get(i)*100)));
            jsonSaleRatio80.add(Double.parseDouble(df.format(saleRatio80s.get(i)*100)));
            jsonMonth.add(months.get(i));
        }
        jsonObject.put("SaleRatiofifty", jsonSaleRatio50);
        jsonObject.put("SaleRatioeighty", jsonSaleRatio80);
        jsonObject.put("months", jsonMonth);
        return jsonObject.toString();
    }

    @RequestMapping("/categorySalePerformancePriceTable")
    @ResponseBody
    public String categorySalePerformancePriceTable(@Param("categorySid") String categorySid) {
        CategoryPerformanceProductLineScore score = this.categoryPerformanceProductLineScoreService.selectByPrimaryKey(Integer.parseInt(categorySid));
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("####.00");
        if (score != null && !score.equals("")) {
            score.setShelfSalesRatioScore(Double.parseDouble(df.format(score.getShelfSalesRatioScore())));
            score.setAvgShelfSalesRatio(Double.parseDouble(df.format(score.getAvgShelfSalesRatio())));
            score.setAvgEightyPercentCnr(Double.parseDouble(df.format(score.getAvgEightyPercentCnr())));
            score.setEightyPercentCnrScore(Double.parseDouble(df.format(score.getEightyPercentCnrScore())));
            score.setPriceCorrelation(Double.parseDouble(df.format(score.getPriceCorrelation())));
            score.setPriceCorrelationScore(Double.parseDouble(df.format(score.getPriceCorrelationScore())));
            score.setOrgScore(Double.parseDouble(df.format(score.getOrgScore())));
        }
        String result = JSONObject.toJSONString(score);
        return result;
    }

    //pv uv
    @RequestMapping("/categoryPvUv")
    @ResponseBody
    public String categoryPvUv(@Param("categorySid") String categorySid) {
        List<CategoryPerformanceCategoryPopularity> list = this.categoryPerformanceCategoryPopularityService.selectByCategorySid(Integer.parseInt(categorySid));
        if (list.isEmpty()) {
            return "0";
        }
        List<String> months = new ArrayList<>();
        List<Double> pvs = new ArrayList<>();
        List<Double> uvs = new ArrayList<>();
        List<Double> customers = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
            Date date = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.MONTH, i - 10 + 1);
            months.add(sdf.format(cal.getTime()));
            pvs.add(0.0);
            uvs.add(0.0);
            customers.add(0.0);
        }
        for (int i = 0; i < list.size(); i++) {
            String month = list.get(i).getMonth();
            Double pv = list.get(i).getPvRatio();
            Double uv = list.get(i).getUvRatio();
            Double customer = list.get(i).getCustomersRatio();
            for (int j=0; j < months.size(); j++) {
                if (months.get(j).equals(month)) {
                    if (pv != null && !pv.equals("")) {
                        pvs.set(j, pv);
                    } else {
                        pvs.set(j, 0.0);
                    }
                    if (uv != null && !uv.equals("")) {
                        uvs.set(j, uv);
                    } else {
                        uvs.set(j, 0.0);
                    }
                    if (customer != null && !customer.equals("")) {
                        customers.set(j, customer);
                    } else {
                        customers.set(j, 0.0);
                    }
                }
            }
        }

        JSONObject jsonObject = new JSONObject();
        JSONArray jsonSalePv = new JSONArray();
        JSONArray jsonSaleUv = new JSONArray();
        JSONArray jsonSaleCust = new JSONArray();
        JSONArray jsonMonth = new JSONArray();
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("####.00");
        for (int i = 0; i < 10; i++) {
            jsonSalePv.add(Double.parseDouble(df.format(pvs.get(i))));
            jsonSaleUv.add(Double.parseDouble(df.format(uvs.get(i))));
            jsonSaleCust.add(Double.parseDouble(df.format(customers.get(i))));
            jsonMonth.add(months.get(i));
        }
        jsonObject.put("salePv", jsonSalePv);
        jsonObject.put("saleUv", jsonSaleUv);
        jsonObject.put("saleCustomer", jsonSaleCust);
        jsonObject.put("months", jsonMonth);
        return jsonObject.toString();

    }

    @RequestMapping("/categoryPvUvTable")
    @ResponseBody
    public String categoryPvUvTable(@Param("categorySid") String categorySid) {
        CategoryPerformanceCategoryPopularityScore score = this.categoryPerformanceCategoryPopularityScoreService.selectByCategorySid(Integer.parseInt(categorySid));
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("####.00");
        if (score != null && !score.equals("")) {
            score.setCustomersRatio(Double.parseDouble(df.format(score.getCustomersRatio())));
            score.setCustomerScore(Double.parseDouble(df.format(score.getCustomerScore())));
            score.setPvRatio(Double.parseDouble(df.format(score.getPvRatio())));
            score.setPvScore(Double.parseDouble(df.format(score.getPvScore())));
            score.setUvRatio(Double.parseDouble(df.format(score.getUvRatio())));
            score.setUvScore(Double.parseDouble(df.format(score.getUvScore())));
            score.setPopScore(Double.parseDouble(df.format(score.getPopScore())));
        }
        String result = JSONObject.toJSONString(score);
        return result;
    }
    @RequestMapping("/getCategoryPvUvMonth")
    @ResponseBody
    public String getCategoryPvUvMonth(@Param("categorySid") String categorySid) {
        List<String> list = this.categoryPerformanceCategoryPopularityService.selectMonthByCategoryId(Integer.parseInt(categorySid));
        JSONArray months = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        for (int i = 0; i < list.size(); i++) {
            months.add(list.get(i));
        }
        jsonObject.put("months", months);
        return jsonObject.toString();
    }
    @RequestMapping("/categoryPvUvDetailTable")
    @ResponseBody
    public String categoryPvUvDetailTable(BootPage bootPage,
                                          @Param("categoryid") String categoryid,
                                          @Param("column") String column,
                                          @Param("order") String order) {
        Map param = new HashMap();
        if (categoryid != null && !categoryid.equals("")) {
            param.put("categorySid", Integer.parseInt(categoryid));
        }
        if (column != null && !column.equals("") && order != null && !order.equals("")) {
            if (column.equals("saleAmount")) {
                column = "sale_amount";
            } else if(column.equals("goodsSalePrice")){
                column = "goods_sale_price";
            }
            param.put("columnOrder", column + " " + order);
        }
        Page<CategoryPerformanceCategoryPopularity> page = Page.startPage(CategoryPerformanceCategoryPopularity.class, bootPage);
        List<CategoryPerformanceCategoryPopularity> list = this.categoryPerformanceCategoryPopularityService.listPagePvUvDetail(param);
        bootPage.setPage(page);
        String result = bootPage.printOut(list);
        return result;
    }

    @RequestMapping("/categoryOperationTable")
    @ResponseBody
    public String categoryOperationTable(@Param("categorySid") String categorySid) {
        CategoryPerformanceCategoryOperationScoreKey key = new CategoryPerformanceCategoryOperationScoreKey();
        key.setCategorySid(Integer.parseInt(categorySid));
        CategoryPerformanceCategoryOperationScore score = this.categoryPerformanceCategoryOperationScoreService.selectByPrimaryKey(key);
        java.text.DecimalFormat   df   =new   java.text.DecimalFormat("####.00");
        if (score != null && !score.equals("")) {
            score.setOperScore(Double.parseDouble(df.format(score.getOperScore())));
            score.setAvePriceAdjustmentTime(Double.parseDouble(df.format(score.getAvePriceAdjustmentTime())));
            score.setPriceAdjScore(Double.parseDouble(df.format(score.getPriceAdjScore())));
            score.setAvePropFillRate(Double.parseDouble(df.format(score.getAvePropFillRate())));
            score.setPropFillScore(Double.parseDouble(df.format(score.getPropFillScore())));
            score.setStockSkuRate(Double.parseDouble(df.format(score.getStockSkuRate())));
            score.setOutOfStockScore(Double.parseDouble(df.format(score.getOutOfStockScore())));
            score.setAveOnOffShelfTime(Double.parseDouble(df.format(score.getAveOnOffShelfTime())));
            score.setOffShelfScore(Double.parseDouble(df.format(score.getOffShelfScore())));
            score.setShelfSaleRatio(Double.parseDouble(df.format(score.getShelfSaleRatio())));
            score.setStockSaleRatioScore(Double.parseDouble(df.format(score.getStockSaleRatioScore())));
        }
        String result = JSONObject.toJSONString(score);
        return result;
    }

    @RequestMapping("/CategoryExpendSale")
    @ResponseBody
    public String selectCategoryExpendSale( BootPage bootPage,
                                             @Param("categoryid") String categoryid,
                                             @Param("column") String column,
                                             @Param("order") String order) {
        Map param = new HashMap();
        if (categoryid.matches("^\\d+$")&& categoryid != null && !categoryid.equals("")) {
            param.put("categorySid", Integer.parseInt(categoryid));
        }
        if (column != null && !column.equals("") && order != null && !order.equals("")) {
            if (column.equals("salesVolume")) {
                column = "sales_volume";
            } else if(column.equals("avgDaySaleSum")){
                column = "avg_day_sale_sum";
            }
            param.put("columnOrder", column + " " + order);
        }

        Page<CategoryPerformanceGoodsShelfSalesRatio> page = Page.startPage(CategoryPerformanceGoodsShelfSalesRatio.class, bootPage);
        List<CategoryPerformanceGoodsShelfSalesRatio> list = this.categoryPerformanceGoodsShelfSalesRatioService.listPage(param);
        bootPage.setPage(page);
        String result = bootPage.printOut(list);
        return result;
    }

    @RequestMapping(value = "/getYhdCategoryTree", produces = {"text/json;charset=gb2312"})
    @ResponseBody
    public String getYhdCategoryTree(HttpServletRequest request, @org.apache.ibatis.annotations.Param("categoryId") String categoryId) {
        Integer categorySid = null;
        /*if (categoryId != null && !categoryId.equals("")) {
            categorySid = Integer.parseInt(categoryId);
        }
        CategoryPerformanceBasic basic = this.categoryPerformanceBasicService.selectCategoryTree(categorySid);
        String keyword = null;
        if (basic != null) {
            keyword = "'%" + basic.getCategoryTree().split(">")[0] + "%'";
        }
        Map map = new HashMap();
        map.put("keyword", keyword);*/
        List<YhdCategory> list = this.yhdCategoryService.getCategory();
        JSONArray jsonArray =new JSONArray();
        for(YhdCategory category:list)
        {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id",category.getId());
            jsonObject.put("pid",category.getId());
            jsonObject.put("name",category.getCategoryName());
            jsonObject.put("isParent","false");
            jsonObject.put("open","true");
            jsonArray.add(jsonObject);
        }
        return jsonArray.toString();
    }

    @RequestMapping("/updateYhdUrl")
    @ResponseBody
    public String updateYhdUrl(@org.apache.ibatis.annotations.Param("yhdCategory") String yhdCategory) {
        YhdCategory yhdCategory1 = this.yhdCategoryService.selectUrl(yhdCategory);
        String result = JSONObject.toJSONString(yhdCategory1.getCategoryName());
        return result;
    }
    @RequestMapping("/updateCategoryBasic")
    @ResponseBody
    public void updateCategoryBasic(@org.apache.ibatis.annotations.Param("yhdCategory") String yhdCategory,
                                    @org.apache.ibatis.annotations.Param("categoryid") String categoryid) {
        YhdCategory yhdCategory1 = this.yhdCategoryService.selectUrl(yhdCategory);
        String url = yhdCategory1.getCategoryName();
        CategoryPerformanceBasic categoryPerformanceBasic = new CategoryPerformanceBasic();
        categoryPerformanceBasic.setYhdCategoryTree(yhdCategory);
        categoryPerformanceBasic.setYhdCategoryUrl(url);
        if (categoryid != null && categoryid.equals("")) {
            categoryPerformanceBasic.setCategorySid(Integer.parseInt(categoryid));
        }
        this.categoryPerformanceBasicService.updateByPrimaryKeySelective(categoryPerformanceBasic);
    }


    @RequestMapping("/categoryYhdBasic")
    @ResponseBody
    public String categoryYhdBasic(@org.apache.ibatis.annotations.Param("categoryId") String categoryId) {
        Integer category = null;
        if (categoryId != null && !categoryId.equals("")) {
            category = Integer.parseInt(categoryId);
        }
        YhdCategory yhdCategory = this.yhdCategoryService.selectByUrl(category);
        String result = JSONObject.toJSONString(yhdCategory);
        return result;
    }

    @RequestMapping("/categoryBrands")
    @ResponseBody
    public String categoryBrands(BootPage bootPage,
                                 @org.apache.ibatis.annotations.Param("categoryId") String categoryId) {
        Integer category = null;
        if (categoryId != null && !categoryId.equals("")) {
            category = Integer.parseInt(categoryId);
        }
        Page<CategoryPerformanceBlYhdBrandContrast> page = Page.startPage(CategoryPerformanceBlYhdBrandContrast.class, bootPage);
        List<CategoryPerformanceBlYhdBrandContrast> list = this.categoryPerformanceBlYhdBrandContrastService.listPage(category);
        bootPage.setPage(page);
        String result = bootPage.printOut(list);
        return result;
    }

}