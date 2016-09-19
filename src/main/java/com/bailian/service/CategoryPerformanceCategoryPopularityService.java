package com.bailian.service;

import com.bailian.model.CategoryPerformanceCategoryPopularity;
import com.bailian.model.CategoryPerformanceCategoryPopularityScore;

import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/5.
 */
public interface CategoryPerformanceCategoryPopularityService {
    List<CategoryPerformanceCategoryPopularity> selectByCategorySid(Integer categorySid);

    List<String> selectMonthByCategoryId(Integer categorySid);

    List<CategoryPerformanceCategoryPopularity> listPagePvUvDetail(Map map);
}
