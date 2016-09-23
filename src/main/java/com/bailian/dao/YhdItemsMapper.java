package com.bailian.dao;

import com.bailian.model.YhdItems;
import com.bailian.model.YhdItemsKey;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface YhdItemsMapper {
    int deleteByPrimaryKey(YhdItemsKey key);

    int insert(YhdItems record);

    int insertSelective(YhdItems record);

    YhdItems selectByPrimaryKey(YhdItemsKey key);

    int updateByPrimaryKeySelective(YhdItems record);

    int updateByPrimaryKey(YhdItems record);

    List<YhdItems> listPage(Map map);

    List<Map> selectNewGoodsWithoutBrand(Map map);

    List<YhdItems> selectNewGoodsWithBrand(Map map);
}