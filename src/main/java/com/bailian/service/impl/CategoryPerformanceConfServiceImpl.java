package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceConfMapper;
import com.bailian.model.CategoryPerformanceConf;
import com.bailian.service.CategoryPerformanceConfService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YQ85 on 2016/9/9.
 */
@Service
public class CategoryPerformanceConfServiceImpl implements CategoryPerformanceConfService{
    @Resource
    private CategoryPerformanceConfMapper categoryPerformanceConfMapper;

    @Override
    public List<CategoryPerformanceConf> listPage() {
        return this.categoryPerformanceConfMapper.listPage();
    }
}
