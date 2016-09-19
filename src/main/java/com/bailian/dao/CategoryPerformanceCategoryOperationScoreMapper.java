package com.bailian.dao;

import com.bailian.model.CategoryPerformanceCategoryOperationScore;
import com.bailian.model.CategoryPerformanceCategoryOperationScoreKey;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryPerformanceCategoryOperationScoreMapper {
    int deleteByPrimaryKey(CategoryPerformanceCategoryOperationScoreKey key);

    int insert(CategoryPerformanceCategoryOperationScore record);

    int insertSelective(CategoryPerformanceCategoryOperationScore record);

    CategoryPerformanceCategoryOperationScore selectByPrimaryKey(CategoryPerformanceCategoryOperationScoreKey key);

    int updateByPrimaryKeySelective(CategoryPerformanceCategoryOperationScore record);

    int updateByPrimaryKey(CategoryPerformanceCategoryOperationScore record);
}