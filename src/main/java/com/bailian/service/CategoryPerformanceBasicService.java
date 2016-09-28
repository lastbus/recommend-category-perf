package com.bailian.service;

import com.bailian.model.CategoryPerformanceBasic;

import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/8/24.
 */
public interface CategoryPerformanceBasicService {
    CategoryPerformanceBasic selectByPrimaryKey(Integer categorySid);

    List<Map> selectFirstLevel();

    Map selectIndexBasic();

    CategoryPerformanceBasic selectCategoryTree(Integer categorySid);

    void updateByPrimaryKeySelective(CategoryPerformanceBasic categoryPerformanceBasic);
    List<CategoryPerformanceBasic> listPage(Map map);

}
