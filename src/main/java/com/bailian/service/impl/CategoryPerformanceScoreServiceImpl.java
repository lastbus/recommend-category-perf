package com.bailian.service.impl;


import com.bailian.dao.CategoryPerformanceScoreMapper;
import com.bailian.model.CategoryPerformanceScore;
import com.bailian.service.CategoryPerformanceScoreService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/8/18.
 */
@Service
public class CategoryPerformanceScoreServiceImpl implements CategoryPerformanceScoreService {
    @Resource
    CategoryPerformanceScoreMapper categoryPerformanceScoreMapper;

    @Override
    public List<CategoryPerformanceScore> listPageScore(Map map) {
        return this.categoryPerformanceScoreMapper.listPageScore(map);
    }

    @Override
    public CategoryPerformanceScore selectByPrimaryKey(Integer categorySid) {
        return this.categoryPerformanceScoreMapper.selectByPrimaryKey(categorySid);
    }

}
