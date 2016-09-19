package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceCategoryPopularityScoreMapper;
import com.bailian.model.CategoryPerformanceCategoryPopularityScore;
import com.bailian.service.CategoryPerformanceCategoryPopularityScoreService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/5.
 */
@Service
public class CategoryPerformanceCategoryPopularityScoreServiceImpl implements CategoryPerformanceCategoryPopularityScoreService {
    @Resource
    private CategoryPerformanceCategoryPopularityScoreMapper categoryPerformanceCategoryPopularityScoreMapper;

    @Override
    public CategoryPerformanceCategoryPopularityScore selectByCategorySid(Integer categorySid) {
        return this.categoryPerformanceCategoryPopularityScoreMapper.selectByCategorySid(categorySid);
    }

}
