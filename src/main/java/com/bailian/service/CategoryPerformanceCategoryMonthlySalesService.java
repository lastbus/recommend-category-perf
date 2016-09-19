package com.bailian.service;

import com.bailian.model.CategoryPerformanceCategoryMonthlySales;

import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/8/26.
 */
public interface CategoryPerformanceCategoryMonthlySalesService {
    List<CategoryPerformanceCategoryMonthlySales> selectById(Integer categorySid);
    List<Map> selectTotalSales();
}
