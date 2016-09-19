package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceProductLineScoreMapper;
import com.bailian.model.CategoryPerformanceProductLineScore;
import com.bailian.service.CategoryPerformanceProductLineScoreService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by YQ85 on 2016/9/2.
 */
@Service
public class CategoryPerformanceProductLineScoreServiceImpl implements CategoryPerformanceProductLineScoreService {
    @Resource
    private CategoryPerformanceProductLineScoreMapper categoryPerformanceProductLineScoreMapper;

    @Override
    public CategoryPerformanceProductLineScore selectByPrimaryKey(Integer categorySid) {
        return this.categoryPerformanceProductLineScoreMapper.selectByPrimaryKey(categorySid);
    }
}
