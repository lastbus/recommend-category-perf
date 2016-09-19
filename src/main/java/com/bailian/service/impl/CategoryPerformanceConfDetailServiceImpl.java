package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceConfDetailMapper;
import com.bailian.model.CategoryPerformanceConfDetail;
import com.bailian.service.CategoryPerformanceConfDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YQ85 on 2016/9/9.
 */
@Service
public class CategoryPerformanceConfDetailServiceImpl implements CategoryPerformanceConfDetailService{
    @Resource
    private CategoryPerformanceConfDetailMapper categoryPerformanceConfDetailMapper;
    @Override
    public List<CategoryPerformanceConfDetail> listPage() {
        return this.categoryPerformanceConfDetailMapper.listPage();
    }
}
