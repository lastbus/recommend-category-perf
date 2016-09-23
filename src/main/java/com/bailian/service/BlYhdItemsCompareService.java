package com.bailian.service;

import com.bailian.model.BlYhdItemsCompare;
import com.bailian.model.BlYhdItemsCompareKey;

import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/22.
 */
public interface BlYhdItemsCompareService {
    void insertList(List<BlYhdItemsCompare> blYhdItemsCompares);
    BlYhdItemsCompare selectByPrimaryKey(BlYhdItemsCompareKey key);
    int insert(BlYhdItemsCompare record);
    List<BlYhdItemsCompare> listPage(Map map);



}
