package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceBlYhdBrandContrastMapper;
import com.bailian.model.CategoryPerformanceBlYhdBrandContrast;
import com.bailian.service.CategoryPerformanceBlYhdBrandContrastService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/14.
 */
@Service
public class CategoryPerformanceBlYhdBrandContrastServiceImpl implements CategoryPerformanceBlYhdBrandContrastService {
    @Resource
    private CategoryPerformanceBlYhdBrandContrastMapper categoryPerformanceBlYhdBrandContrastMapper;

    @Override
    public List<CategoryPerformanceBlYhdBrandContrast> listPage(Integer categoryId) {
        return this.categoryPerformanceBlYhdBrandContrastMapper.listPage(categoryId);
    }

    @Override
    public List<CategoryPerformanceBlYhdBrandContrast> selectByCategoryId(Integer categoryId) {
        return this.categoryPerformanceBlYhdBrandContrastMapper.selectByCategoryId(categoryId);
    }
}
