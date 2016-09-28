package com.bailian.dao;

import com.bailian.model.CategoryPerformanceBasic;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface CategoryPerformanceBasicMapper {
    int deleteByPrimaryKey(Integer categorySid);

    int insert(CategoryPerformanceBasic record);

    int insertSelective(CategoryPerformanceBasic record);

    CategoryPerformanceBasic selectByPrimaryKey(Integer categorySid);

    int updateByPrimaryKeySelective(CategoryPerformanceBasic record);

    int updateByPrimaryKey(CategoryPerformanceBasic record);

    List<Map> selectFirstLevel();

    Map selectIndexBasic();

    CategoryPerformanceBasic selectCategoryTree(Integer categorySid);
    List<CategoryPerformanceBasic> listPage(Map map);
}