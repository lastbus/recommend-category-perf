package com.bailian.dao;

import com.bailian.model.CategoryPerformanceCategoryMonthlyHotcakes;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CategoryPerformanceCategoryMonthlyHotcakesMapper {
    int insert(CategoryPerformanceCategoryMonthlyHotcakes record);

    int insertSelective(CategoryPerformanceCategoryMonthlyHotcakes record);

    List<CategoryPerformanceCategoryMonthlyHotcakes> listPageHotcakes(Map map);
    List<String> selectMonthByCategoryId(Integer categorySid);
}