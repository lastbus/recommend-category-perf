package com.bailian.dao;

import com.bailian.model.CategoryPerformanceConf;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryPerformanceConfMapper {
    int insert(CategoryPerformanceConf record);

    int insertSelective(CategoryPerformanceConf record);

    List<CategoryPerformanceConf> listPage();
}