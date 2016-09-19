package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceCategoryYhdPriceDistMapper;
import com.bailian.model.CategoryPerformanceCategoryYhdPriceDist;
import com.bailian.service.CategoryPerformanceCategoryYhdPriceDistService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YQ85 on 2016/9/12.
 */
@Service
public class CategoryPerformanceCategoryYhdPriceDistServiceImpl implements CategoryPerformanceCategoryYhdPriceDistService {
    @Resource
    private CategoryPerformanceCategoryYhdPriceDistMapper categoryPerformanceCategoryYhdPriceDistMapper;
    @Override
    public List<CategoryPerformanceCategoryYhdPriceDist> selectById(int categoryId) {
        return this.categoryPerformanceCategoryYhdPriceDistMapper.selectById(categoryId);
    }
}
