package com.bailian.service;

import com.bailian.model.CategoryPerformanceCategoryPopularityScore;

import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/5.
 */
public interface CategoryPerformanceCategoryPopularityScoreService {

    CategoryPerformanceCategoryPopularityScore selectByCategorySid(Integer categorySid);

}
