package com.bailian.service.impl;

import com.bailian.dao.DimManagementCategoryTreeMapper;
import com.bailian.model.DimManagementCategoryTree;
import com.bailian.service.DimManagementCategoryTreeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YQ85 on 2016/8/4.
 */
@Service
public class DimManagementCategoryTreeServiceImpl implements DimManagementCategoryTreeService{

    @Resource
    private DimManagementCategoryTreeMapper dimManagementCategoryTreeMapper;
    @Override
    public List<DimManagementCategoryTree> getCategory(String parentSid) {
        return this.dimManagementCategoryTreeMapper.getCategory(parentSid);
    }
}
