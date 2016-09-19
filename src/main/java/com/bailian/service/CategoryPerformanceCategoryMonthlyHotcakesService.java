package com.bailian.service;

import com.bailian.model.CategoryPerformanceCategoryMonthlyHotcakes;

import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/8/30.
 */
public interface CategoryPerformanceCategoryMonthlyHotcakesService {
    List<CategoryPerformanceCategoryMonthlyHotcakes> listPageHotcakes(Map map);
    List<String> selectMonthByCategoryId(Integer categorySid);
}
