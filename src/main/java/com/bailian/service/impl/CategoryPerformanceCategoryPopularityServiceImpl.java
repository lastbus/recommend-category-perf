package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceCategoryPopularityMapper;
import com.bailian.model.CategoryPerformanceCategoryPopularity;
import com.bailian.model.CategoryPerformanceCategoryPopularityScore;
import com.bailian.service.CategoryPerformanceCategoryPopularityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/5.
 */
@Service
public class CategoryPerformanceCategoryPopularityServiceImpl implements CategoryPerformanceCategoryPopularityService {
    @Resource
    private CategoryPerformanceCategoryPopularityMapper categoryPerformanceCategoryPopularityMapper;

    @Override
    public List<CategoryPerformanceCategoryPopularity> selectByCategorySid(Integer categorySid) {
        return this.categoryPerformanceCategoryPopularityMapper.selectByCategorySid(categorySid);
    }

    @Override
    public List<String> selectMonthByCategoryId(Integer categorySid) {
        return this.categoryPerformanceCategoryPopularityMapper.selectMonthByCategoryId(categorySid);
    }

    @Override
    public List<CategoryPerformanceCategoryPopularity> listPagePvUvDetail(Map map) {
        return this.categoryPerformanceCategoryPopularityMapper.listPagePvUvDetail(map);
    }
}
