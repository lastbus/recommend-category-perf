package com.bailian.dao;

import com.bailian.model.CategoryPerformanceBlYhdBrandContrast;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CategoryPerformanceBlYhdBrandContrastMapper {
    int insert(CategoryPerformanceBlYhdBrandContrast record);

    int insertSelective(CategoryPerformanceBlYhdBrandContrast record);
    List<CategoryPerformanceBlYhdBrandContrast> listPage(Integer categoryId);

    List<CategoryPerformanceBlYhdBrandContrast> selectByCategoryId(Integer categoryId);
}