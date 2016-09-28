package com.bailian.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bailian.model.*;
import com.bailian.page.Page;
import com.bailian.service.CategoryPerformanceBasicService;
import com.bailian.service.YhdCategoryService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/26.
 */
@RequestMapping("/category")
@Controller
public class CategoryMappingController {
    @Resource
    private CategoryPerformanceBasicService categoryPerformanceBasicService;
    @Resource
    private YhdCategoryService yhdCategoryService;

    @RequestMapping("categoryMapping.html")
    public String categoryMapping () {
        return "project1/categoryMapping";
    }
    @RequestMapping(value = "/getYhdCategoryTree", produces = {"text/json;charset=gb2312"})
    @ResponseBody
    public String getYhdCategoryTree() {
        List<String> list = this.yhdCategoryService.getCategory();
        JSONArray jsonArray =new JSONArray();
        int i = 0;
        for(String category:list)
        {
            net.sf.json.JSONObject jsonObject=new net.sf.json.JSONObject();
            jsonObject.put("id",++i);
            jsonObject.put("name",category);
            //判断所选择节点是否是父节点，如果是设置isParent属性为true,不是设置为false
            jsonObject.put("isParent","false");
            jsonObject.put("open","true");
            jsonArray.add(jsonObject);
        }
        return jsonArray.toString();
    }

    @RequestMapping("/updateYhdUrl")
    @ResponseBody
    public String updateYhdUrl(@Param("yhdCategory") String yhdCategoryTree) {
        String yhdCategoryUrl = this.yhdCategoryService.selectUrl(yhdCategoryTree);
        String result = JSONObject.toJSONString(yhdCategoryUrl);
        return result;
    }

   @RequestMapping("/updateCategoryBasic")
    @ResponseBody
    public String updateCategoryBasic(@Param("yhdCategoryTree") String yhdCategoryTree,
                                    @Param("categorySid") String categorySid) {
        CategoryPerformanceBasic basic = this.categoryPerformanceBasicService.selectByPrimaryKey(Integer.parseInt(categorySid));
        String yhdCategoryTreeTmp = basic.getYhdCategoryTree();
        if (yhdCategoryTreeTmp.equals(yhdCategoryTree)) {
            return "1";
        } else {
            String yhdCategoryUrl= this.yhdCategoryService.selectUrl(yhdCategoryTree);
            CategoryPerformanceBasic categoryPerformanceBasic = new CategoryPerformanceBasic();
            categoryPerformanceBasic.setYhdCategoryTree(yhdCategoryTree);
            categoryPerformanceBasic.setYhdCategoryUrl(yhdCategoryUrl);
            categoryPerformanceBasic.setMatchType(1);
            categoryPerformanceBasic.setCategorySid(Integer.parseInt(categorySid));
            this.categoryPerformanceBasicService.updateByPrimaryKeySelective(categoryPerformanceBasic);
            return "2";
        }
    }
    @RequestMapping("/categoryPerformanceBasicTable")
    @ResponseBody
    public String categoryPerformanceBasicTable( BootPage bootPage,
                                             @Param("categoryid") String categoryid,
                                             @Param("column") String column,
                                             @Param("order") String order) {
        Map param = new HashMap();
        if (categoryid.matches("^\\d+$")&& categoryid != null && !categoryid.equals("")) {
            param.put("categorySid", Integer.parseInt(categoryid));
        }
        if (column != null && !column.equals("") && order != null && !order.equals("")) {

            param.put("columnOrder", column + " " + order);
        }
        if (column == null || column.equals("") && order != null && !order.equals("")) {
            param.put("columnOrder", "level" + " " + order);
        }
        Page<CategoryPerformanceBasic> page = Page.startPage(CategoryPerformanceBasic.class, bootPage);
        List<CategoryPerformanceBasic> list = this.categoryPerformanceBasicService.listPage(param);
        bootPage.setPage(page);
        String result = bootPage.printOut(list);
        return result;
    }

}
