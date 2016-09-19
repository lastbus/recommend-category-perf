package com.bailian.dao;

import com.bailian.model.CategoryPerformanceCategoryMonthlySales;
import com.bailian.model.CategoryPerformanceCategoryMonthlySalesKey;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CategoryPerformanceCategoryMonthlySalesMapper {
    int deleteByPrimaryKey(CategoryPerformanceCategoryMonthlySalesKey key);

    int insert(CategoryPerformanceCategoryMonthlySales record);

    int insertSelective(CategoryPerformanceCategoryMonthlySales record);

    CategoryPerformanceCategoryMonthlySales selectByPrimaryKey(CategoryPerformanceCategoryMonthlySalesKey key);

    int updateByPrimaryKeySelective(CategoryPerformanceCategoryMonthlySales record);

    int updateByPrimaryKey(CategoryPerformanceCategoryMonthlySales record);

    List<CategoryPerformanceCategoryMonthlySales> selectById(Integer categorySid);
    List<Map> selectTotalSales();

}