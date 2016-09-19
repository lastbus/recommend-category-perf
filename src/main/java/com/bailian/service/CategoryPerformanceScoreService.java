package com.bailian.service;

import com.bailian.model.CategoryPerformanceScore;

import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/8/18.
 */
public interface CategoryPerformanceScoreService {
    List<CategoryPerformanceScore> listPageScore(Map map);
    CategoryPerformanceScore selectByPrimaryKey(Integer categorySid);

}
