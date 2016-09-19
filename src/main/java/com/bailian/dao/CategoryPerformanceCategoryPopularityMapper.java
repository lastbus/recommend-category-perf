package com.bailian.dao;

import com.bailian.model.CategoryPerformanceCategoryPopularity;
import com.bailian.model.CategoryPerformanceCategoryPopularityScore;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CategoryPerformanceCategoryPopularityMapper {
    int insert(CategoryPerformanceCategoryPopularity record);
    int insertSelective(CategoryPerformanceCategoryPopularity record);

    List<CategoryPerformanceCategoryPopularity> selectByCategorySid(Integer categorySid);
    List<String> selectMonthByCategoryId(Integer categorySid);
    List<CategoryPerformanceCategoryPopularity> listPagePvUvDetail(Map map);
}