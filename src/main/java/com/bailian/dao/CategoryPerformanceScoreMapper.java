package com.bailian.dao;

import com.bailian.model.CategoryPerformanceScore;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CategoryPerformanceScoreMapper {
    int deleteByPrimaryKey(Integer categorySid);

    int insert(CategoryPerformanceScore record);

    int insertSelective(CategoryPerformanceScore record);

    CategoryPerformanceScore selectByPrimaryKey(Integer categorySid);

    int updateByPrimaryKeySelective(CategoryPerformanceScore record);

    int updateByPrimaryKey(CategoryPerformanceScore record);
    List<CategoryPerformanceScore> listPageScore(Map map);
}