package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceBasicMapper;
import com.bailian.model.CategoryPerformanceBasic;
import com.bailian.service.CategoryPerformanceBasicService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/8/24.
 */
@Service
public class CategoryPerformanceBasicServiceImpl implements CategoryPerformanceBasicService{
    @Resource
    private CategoryPerformanceBasicMapper categoryPerformanceBasicMapper;

    @Override
    public CategoryPerformanceBasic selectByPrimaryKey(Integer categorySid) {
        return this.categoryPerformanceBasicMapper.selectByPrimaryKey(categorySid);
    }

    @Override
    public List<Map> selectFirstLevel() {
        return this.categoryPerformanceBasicMapper.selectFirstLevel();
    }

    @Override
    public Map selectIndexBasic() {
        return this.categoryPerformanceBasicMapper.selectIndexBasic();
    }

    @Override
    public CategoryPerformanceBasic selectCategoryTree(Integer categorySid) {
        return this.categoryPerformanceBasicMapper.selectCategoryTree(categorySid);
    }

    @Override
    public void updateByPrimaryKeySelective(CategoryPerformanceBasic categoryPerformanceBasic) {
        this.categoryPerformanceBasicMapper.updateByPrimaryKeySelective(categoryPerformanceBasic);
    }
}
