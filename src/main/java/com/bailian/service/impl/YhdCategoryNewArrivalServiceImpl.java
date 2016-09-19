package com.bailian.service.impl;

import com.bailian.dao.YhdCategoryNewArrivalMapper;
import com.bailian.model.YhdCategoryNewArrival;
import com.bailian.service.YhdCategoryNewArrivalService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/14.
 */
@Service
public class YhdCategoryNewArrivalServiceImpl implements YhdCategoryNewArrivalService {
    @Resource
    private YhdCategoryNewArrivalMapper yhdCategoryNewArrivalMapper;
    @Override
    public List<YhdCategoryNewArrival> listPage(Map param) {
        return this.yhdCategoryNewArrivalMapper.listPage(param);
    }
}
