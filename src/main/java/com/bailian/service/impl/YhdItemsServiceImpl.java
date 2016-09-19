package com.bailian.service.impl;

import com.bailian.dao.YhdItemsMapper;
import com.bailian.model.YhdItems;
import com.bailian.service.YhdItemsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/18.
 */
@Service
public class YhdItemsServiceImpl implements YhdItemsService {
    @Resource
    private YhdItemsMapper yhdItemsMapper;
    @Override
    public List<YhdItems> listPage(Map map) {
        return this.yhdItemsMapper.listPage(map);
    }
}
