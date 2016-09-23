package com.bailian.dao;

import com.bailian.model.YhdCategoryNewArrival;
import com.bailian.model.YhdCategoryNewArrivalKey;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface YhdCategoryNewArrivalMapper {
    int deleteByPrimaryKey(YhdCategoryNewArrivalKey key);

    int insert(YhdCategoryNewArrival record);

    int insertSelective(YhdCategoryNewArrival record);

    YhdCategoryNewArrival selectByPrimaryKey(YhdCategoryNewArrivalKey key);

    int updateByPrimaryKeySelective(YhdCategoryNewArrival record);

    int updateByPrimaryKey(YhdCategoryNewArrival record);

    List<YhdCategoryNewArrival> listPage(Map param);

    List<YhdCategoryNewArrival> selectNewGoodsWithBrand(Map map);
    List<Map> selectNewGoodsWithoutBrand(Map map);
}