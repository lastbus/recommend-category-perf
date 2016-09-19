package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceGoodsShelfSalesRatioMapper;
import com.bailian.model.CategoryPerformanceGoodsShelfSalesRatio;
import com.bailian.service.CategoryPerformanceGoodsShelfSalesRatioService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/9.
 */
@Service
public class CategoryPerformanceGoodsShelfSalesRatioServiceImpl implements CategoryPerformanceGoodsShelfSalesRatioService {
    @Resource
    private CategoryPerformanceGoodsShelfSalesRatioMapper categoryPerformanceGoodsShelfSalesRatioMapper;

    @Override
    public List<CategoryPerformanceGoodsShelfSalesRatio> listPage(Map map) {
        return this.categoryPerformanceGoodsShelfSalesRatioMapper.listPage(map);
    }
}
