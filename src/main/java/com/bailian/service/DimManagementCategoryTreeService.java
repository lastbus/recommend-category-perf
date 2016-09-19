package com.bailian.service;

import com.bailian.model.DimManagementCategoryTree;

import java.util.List;

/**
 * Created by YQ85 on 2016/8/4.
 */

public interface DimManagementCategoryTreeService {
    List<DimManagementCategoryTree> getCategory(String parentSid);
}
