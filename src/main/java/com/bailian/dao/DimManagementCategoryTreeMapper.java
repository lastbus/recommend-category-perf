package com.bailian.dao;

import com.bailian.model.DimManagementCategoryTree;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DimManagementCategoryTreeMapper {
    int deleteByPrimaryKey(String sid);

    int insert(DimManagementCategoryTree record);

    int insertSelective(DimManagementCategoryTree record);

    DimManagementCategoryTree selectByPrimaryKey(String sid);

    int updateByPrimaryKeySelective(DimManagementCategoryTree record);

    int updateByPrimaryKey(DimManagementCategoryTree record);

    List<DimManagementCategoryTree> getCategory(String parentSid);



}