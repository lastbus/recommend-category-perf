package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceCategoryPriceConfMapper;
import com.bailian.model.CategoryPerformanceCategoryPriceConf;
import com.bailian.service.CategoryPerformanceCategoryPriceConfService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YQ85 on 2016/8/25.
 */
@Service
public class CategoryPerformanceCategoryPriceConfServiceImpl implements CategoryPerformanceCategoryPriceConfService{
    @Resource
    private CategoryPerformanceCategoryPriceConfMapper categoryPerformanceCategoryPriceConfMapper;
    @Override
    public List<CategoryPerformanceCategoryPriceConf> selectById(Integer categorySid) {
        return this.categoryPerformanceCategoryPriceConfMapper.selectById(categorySid);
    }
}
