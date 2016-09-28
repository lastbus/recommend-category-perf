package com.bailian.controller;

import com.bailian.model.BootPage;
import com.bailian.model.CategoryPerformanceScore;
import com.bailian.model.DimManagementCategoryTree;
import com.bailian.page.Page;
import com.bailian.service.CategoryPerformanceScoreService;
import com.bailian.service.DimManagementCategoryTreeService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/8/18.
 */
@Controller
@RequestMapping("/category")
public class CategoryPerformanceController {
    @Resource
    private DimManagementCategoryTreeService dimManagementCategoryTreeService;
    @Resource
    private CategoryPerformanceScoreService categoryPerformanceScoreService;

    @RequestMapping("/categoryPerformance.html")
    public  String categoryPerformance() {return "project1/categoryPerformance";}

    @RequestMapping("/categoryPerformance")
    @ResponseBody
    public String selectcategoryPerformance( BootPage bootPage,
                                      @Param("categoryid") String categoryid,
                                      @Param("column") String column,
                                      @Param("parentSid") String parentSid,
                                      @Param("order") String order,
                                      @Param("level") String level) {
        Map param = new HashMap();
        if (categoryid.matches("^\\d+$")&& categoryid != null && !categoryid.equals("")) {
            param.put("categorySid", Integer.parseInt(categoryid));
        }
        if (level != null && !level.equals("")) {
            param.put("level", Integer.parseInt(level));
        }
        if (parentSid != null && !parentSid.equals("")) {
            param.put("parentSid", Integer.parseInt(parentSid));
        }
        if (column != null && !column.equals("") && order != null && !order.equals("")) {
            if (column.equals("salesVolume")) {
                column = "sales_volume";
            } else if(column.equals("cdateStr")){
                column = "cdate";
            }
            param.put("columnOrder", column + " " + order);
        }
        if (column == null || column.equals("") && order != null && !order.equals("")) {
            param.put("columnOrder", "level" + " " + order);
        }

        Page<CategoryPerformanceScore> page = Page.startPage(CategoryPerformanceScore.class, bootPage);
        List<CategoryPerformanceScore> list = this.categoryPerformanceScoreService.listPageScore(param);
        bootPage.setPage(page);
        String result = bootPage.printOut(list);
        return result;
    }

    @RequestMapping("/categoryPerformanceResult")
    @ResponseBody
    public String categoryPerformanceResult(@Param("categoryid") String categoryid,
                                      @Param("parentSid") String parentSid) {
        Map param = new HashMap();
        if (categoryid != null && !categoryid.equals("")) {
            param.put("categorySid", Integer.parseInt(categoryid));
        }
        if (parentSid != null && !parentSid.equals("")) {
            param.put("parentSid", Integer.parseInt(parentSid));
        }
        List<CategoryPerformanceScore> list = this.categoryPerformanceScoreService.listPageScore(param);
        if (list.isEmpty()) {
            return "0";
        }
        return "1";
    }

    @RequestMapping(value = "/getCategoryTree", produces = {"text/json;charset=gb2312"})
    @ResponseBody
    public String getGoodsCategory(HttpServletRequest request) {
        String parentSid = request.getParameter("id");
        List<DimManagementCategoryTree> list = this.dimManagementCategoryTreeService.getCategory(parentSid);
        JSONArray jsonArray=new JSONArray();
        for(DimManagementCategoryTree dmct:list)
        {
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("id",dmct.getSid());
            jsonObject.put("pid",dmct.getParentSid());
            jsonObject.put("name",dmct.getSid() + ":" + dmct.getName());

            //判断所选择节点是否是父节点，如果是设置isParent属性为true,不是设置为false
            List<DimManagementCategoryTree> isParent = this.dimManagementCategoryTreeService.getCategory(dmct.getSid());
            if(isParent.isEmpty())
            {
                jsonObject.put("isParent","false");
            } else {
                jsonObject.put("isParent","true");
            }
            jsonObject.put("open","false");
            jsonArray.add(jsonObject);

        }
        return jsonArray.toString();
    }

    @RequestMapping("/getBeforeCategoryLevel")
    @ResponseBody
    public String getBeforeCategoryLevel(@Param("categorySid") String categorySid) {
        CategoryPerformanceScore basic = this.categoryPerformanceScoreService.selectByPrimaryKey(Integer.parseInt(categorySid));
        JSONObject result = new JSONObject();
        int sid = basic.getParentSid();
        result.put("sid", sid);
        if (sid == 0) {
            return "0";
        } else {
            return result.toString();
        }
    }

}
