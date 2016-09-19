package com.bailian.service.impl;

import com.bailian.dao.CategoryPerformanceCategorySaleScoreMapper;
import com.bailian.model.CategoryPerformanceCategorySaleScore;
import com.bailian.service.CategoryPerformanceCategorySaleScoreService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/2.
 */
@Service
public class CategoryPerformanceCategorySaleScoreServiceImpl  implements CategoryPerformanceCategorySaleScoreService {
    @Resource
   private CategoryPerformanceCategorySaleScoreMapper categoryPerformanceCategorySaleScoreMapper;
    @Override
    public CategoryPerformanceCategorySaleScore selectByPrimaryKey(Integer categorySid) {
        return this.categoryPerformanceCategorySaleScoreMapper.selectByPrimaryKey(categorySid);
    }
}
