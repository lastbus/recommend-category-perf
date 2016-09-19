package com.bailian.service.impl;

import com.bailian.dao.YhdCategoryMapper;
import com.bailian.model.YhdCategory;
import com.bailian.service.YhdCategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/9.
 */
@Service
public class YhdCategoryServiceImpl implements YhdCategoryService{
    @Resource
    private YhdCategoryMapper yhdCategoryMapper;

    @Override
    public YhdCategory selectByUrl(Integer categoryId) {
        return this.yhdCategoryMapper.selectByUrl(categoryId);
    }

    @Override
    public List<YhdCategory> getCategory() {
        return this.yhdCategoryMapper.getCategory();
    }

    @Override
    public YhdCategory selectUrl(String yhdCategory) {
        return this.yhdCategoryMapper.selectUrl(yhdCategory);
    }
}
