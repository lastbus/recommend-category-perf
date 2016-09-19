package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceNoteMapper;
import com.bailian.model.CategoryPerformanceNote;
import com.bailian.service.CategoryPerformanceNoteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YQ85 on 2016/9/9.
 */
@Service
public class CategoryPerformanceNoteServiceImpl implements CategoryPerformanceNoteService{
    @Resource
    private CategoryPerformanceNoteMapper categoryPerformanceNoteMapper;
    @Override
    public List<CategoryPerformanceNote> listPage() {
        return this.categoryPerformanceNoteMapper.listPage();
    }
}
