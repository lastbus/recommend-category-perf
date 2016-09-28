package com.bailian.dao;

import com.bailian.model.YhdCategory;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface YhdCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YhdCategory record);

    int insertSelective(YhdCategory record);

    YhdCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YhdCategory record);

    int updateByPrimaryKey(YhdCategory record);
    YhdCategory selectByUrl(Integer categoryId);

    List<String> getCategory();

    String selectUrl(String yhdCategory);
}