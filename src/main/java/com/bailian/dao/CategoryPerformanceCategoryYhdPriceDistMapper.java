package com.bailian.dao;

import com.bailian.model.CategoryPerformanceCategoryYhdPriceDist;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface CategoryPerformanceCategoryYhdPriceDistMapper {
    int insert(CategoryPerformanceCategoryYhdPriceDist record);

    int insertSelective(CategoryPerformanceCategoryYhdPriceDist record);

    List<CategoryPerformanceCategoryYhdPriceDist> selectById(int categoryId);
}