package com.bailian.dao;

import com.bailian.model.CategoryPerformanceCategoryPopularityScore;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CategoryPerformanceCategoryPopularityScoreMapper {
    int insert(CategoryPerformanceCategoryPopularityScore record);

    int insertSelective(CategoryPerformanceCategoryPopularityScore record);

    CategoryPerformanceCategoryPopularityScore selectByCategorySid(Integer categorySid);


}