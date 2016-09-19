package com.bailian.dao;

import com.bailian.model.CategoryPerformanceProductLineScore;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryPerformanceProductLineScoreMapper {
    int deleteByPrimaryKey(Integer categorySid);

    int insert(CategoryPerformanceProductLineScore record);

    int insertSelective(CategoryPerformanceProductLineScore record);

    CategoryPerformanceProductLineScore selectByPrimaryKey(Integer categorySid);

    int updateByPrimaryKeySelective(CategoryPerformanceProductLineScore record);

    int updateByPrimaryKey(CategoryPerformanceProductLineScore record);
}