package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceCategoryOperationScoreMapper;
import com.bailian.model.CategoryPerformanceCategoryOperationScore;
import com.bailian.model.CategoryPerformanceCategoryOperationScoreKey;
import com.bailian.service.CategoryPerformanceCategoryOperationScoreService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by YQ85 on 2016/9/6.
 */
@Service
public class CategoryPerformanceCategoryOperationScoreServiceImpl implements CategoryPerformanceCategoryOperationScoreService {
    @Resource
    private CategoryPerformanceCategoryOperationScoreMapper categoryPerformanceCategoryOperationScoreMapper;
    @Override
    public CategoryPerformanceCategoryOperationScore selectByPrimaryKey(CategoryPerformanceCategoryOperationScoreKey key) {
        return this.categoryPerformanceCategoryOperationScoreMapper.selectByPrimaryKey(key);
    }
}
