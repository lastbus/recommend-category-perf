package com.bailian.dao;

import com.bailian.model.CategoryPerformanceCategorySaleScore;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CategoryPerformanceCategorySaleScoreMapper {
    int deleteByPrimaryKey(Integer categorySid);

    int insert(CategoryPerformanceCategorySaleScore record);

    int insertSelective(CategoryPerformanceCategorySaleScore record);

    CategoryPerformanceCategorySaleScore selectByPrimaryKey(Integer categorySid);

    int updateByPrimaryKeySelective(CategoryPerformanceCategorySaleScore record);

    int updateByPrimaryKey(CategoryPerformanceCategorySaleScore record);

}