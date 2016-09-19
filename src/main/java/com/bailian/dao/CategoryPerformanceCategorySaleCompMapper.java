package com.bailian.dao;

import com.bailian.model.CategoryPerformanceCategorySaleComp;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryPerformanceCategorySaleCompMapper {
    int insert(CategoryPerformanceCategorySaleComp record);
    int insertSelective(CategoryPerformanceCategorySaleComp record);
}