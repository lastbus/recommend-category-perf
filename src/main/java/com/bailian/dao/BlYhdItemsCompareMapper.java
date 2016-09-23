package com.bailian.dao;

import com.bailian.model.BlYhdItemsCompare;
import com.bailian.model.BlYhdItemsCompareKey;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface BlYhdItemsCompareMapper {
    int deleteByPrimaryKey(BlYhdItemsCompareKey key);

    int insert(BlYhdItemsCompare record);

    int insertSelective(BlYhdItemsCompare record);

    BlYhdItemsCompare selectByPrimaryKey(BlYhdItemsCompareKey key);

    int updateByPrimaryKeySelective(BlYhdItemsCompare record);

    int updateByPrimaryKey(BlYhdItemsCompare record);

    void insertList(List<BlYhdItemsCompare> blYhdItemsCompares);
    List<BlYhdItemsCompare> listPage(Map map);
}