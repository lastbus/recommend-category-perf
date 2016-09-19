package com.bailian.service;

import com.bailian.model.CategoryPerformanceCategoryYhdPriceDist;

import java.util.List;

/**
 * Created by YQ85 on 2016/9/12.
 */
public interface CategoryPerformanceCategoryYhdPriceDistService {
    List<CategoryPerformanceCategoryYhdPriceDist> selectById(int categoryId);
}
