package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceCategoryMonthlySalesMapper;
import com.bailian.model.CategoryPerformanceCategoryMonthlySales;
import com.bailian.service.CategoryPerformanceCategoryMonthlySalesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/8/26.
 */
@Service
public class CategoryPerformanceCategoryMonthlySalesServiceImpl implements CategoryPerformanceCategoryMonthlySalesService {
    @Resource
    private CategoryPerformanceCategoryMonthlySalesMapper categoryPerformanceCategoryMonthlySalesMapper;
    @Override
    public List<CategoryPerformanceCategoryMonthlySales> selectById(Integer categorySid) {
        return this.categoryPerformanceCategoryMonthlySalesMapper.selectById(categorySid);
    }

    @Override
    public List<Map> selectTotalSales() {
        return this.categoryPerformanceCategoryMonthlySalesMapper.selectTotalSales();
    }

}
