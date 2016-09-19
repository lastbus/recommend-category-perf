package com.bailian.dao;

import com.bailian.model.CategoryPerformanceNote;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryPerformanceNoteMapper {
    int insert(CategoryPerformanceNote record);

    int insertSelective(CategoryPerformanceNote record);
    List<CategoryPerformanceNote> listPage();
}