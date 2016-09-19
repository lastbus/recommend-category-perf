package com.bailian.dao;

import com.bailian.model.CategoryPerformanceGoodsShelfSalesRatio;
import com.bailian.model.CategoryPerformanceGoodsShelfSalesRatioKey;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CategoryPerformanceGoodsShelfSalesRatioMapper {
    int deleteByPrimaryKey(CategoryPerformanceGoodsShelfSalesRatioKey key);

    int insert(CategoryPerformanceGoodsShelfSalesRatio record);

    int insertSelective(CategoryPerformanceGoodsShelfSalesRatio record);

    CategoryPerformanceGoodsShelfSalesRatio selectByPrimaryKey(CategoryPerformanceGoodsShelfSalesRatioKey key);

    int updateByPrimaryKeySelective(CategoryPerformanceGoodsShelfSalesRatio record);

    int updateByPrimaryKey(CategoryPerformanceGoodsShelfSalesRatio record);
    List<CategoryPerformanceGoodsShelfSalesRatio> listPage(Map map);

}