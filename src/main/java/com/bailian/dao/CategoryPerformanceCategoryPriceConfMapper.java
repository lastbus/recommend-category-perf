package com.bailian.dao;

import com.bailian.model.CategoryPerformanceCategoryPriceConf;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryPerformanceCategoryPriceConfMapper {
    int insert(CategoryPerformanceCategoryPriceConf record);
    int insertSelective(CategoryPerformanceCategoryPriceConf record);
    List<CategoryPerformanceCategoryPriceConf> selectById(Integer categorySid);
}