package com.bailian.dao;

import com.bailian.model.CategoryPerformanceConfDetail;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryPerformanceConfDetailMapper {
    int insert(CategoryPerformanceConfDetail record);

    int insertSelective(CategoryPerformanceConfDetail record);

    List<CategoryPerformanceConfDetail> listPage();
}