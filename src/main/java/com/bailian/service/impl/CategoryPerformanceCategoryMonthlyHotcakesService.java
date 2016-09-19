package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceCategoryMonthlyHotcakesMapper;

import com.bailian.model.CategoryPerformanceCategoryMonthlyHotcakes;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/8/30.
 */
@Service
public class CategoryPerformanceCategoryMonthlyHotcakesService implements com.bailian.service.CategoryPerformanceCategoryMonthlyHotcakesService{
    @Resource
    private CategoryPerformanceCategoryMonthlyHotcakesMapper categoryPerformanceCategoryMonthlyHotcakesMapper;

    @Override
    public List<CategoryPerformanceCategoryMonthlyHotcakes> listPageHotcakes(Map map) {
        return this.categoryPerformanceCategoryMonthlyHotcakesMapper.listPageHotcakes(map);
    }

    @Override
    public List<String> selectMonthByCategoryId(Integer categorySid) {
        return this.categoryPerformanceCategoryMonthlyHotcakesMapper.selectMonthByCategoryId(categorySid);
    }
}
