package com.bailian.service.impl;

import com.bailian.dao.BlYhdItemsCompareMapper;
import com.bailian.model.BlYhdItemsCompare;
import com.bailian.model.BlYhdItemsCompareKey;
import com.bailian.service.BlYhdItemsCompareService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/22.
 */
@Service
public class BlYhdItemsCompareServiceImpl implements BlYhdItemsCompareService {
    @Resource
    private BlYhdItemsCompareMapper blYhdItemsCompareMapper;

    @Override
    public void insertList(List<BlYhdItemsCompare> blYhdItemsCompares) {
        this.blYhdItemsCompareMapper.insertList(blYhdItemsCompares);
    }

    @Override
    public BlYhdItemsCompare selectByPrimaryKey(BlYhdItemsCompareKey key) {
        return this.blYhdItemsCompareMapper.selectByPrimaryKey(key);
    }

    @Override
    public int insert(BlYhdItemsCompare record) {
        return this.blYhdItemsCompareMapper.insert(record);
    }

    @Override
    public List<BlYhdItemsCompare> listPage(Map map) {
        return this.blYhdItemsCompareMapper.listPage(map);
    }

    @Override
    public int deleteByPrimaryKey(BlYhdItemsCompareKey key) {
        return this.blYhdItemsCompareMapper.deleteByPrimaryKey(key);
    }
}
