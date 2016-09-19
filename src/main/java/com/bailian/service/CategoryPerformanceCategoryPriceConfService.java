package com.bailian.service;

import com.bailian.model.CategoryPerformanceCategoryPriceConf;

import java.util.List;

/**
 * Created by YQ85 on 2016/8/25.
 */
public interface CategoryPerformanceCategoryPriceConfService {
    List<CategoryPerformanceCategoryPriceConf> selectById(Integer categorySid);
}
