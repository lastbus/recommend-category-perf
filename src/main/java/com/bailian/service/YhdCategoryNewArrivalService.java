package com.bailian.service;

import com.bailian.model.YhdCategoryNewArrival;

import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/14.
 */
public interface YhdCategoryNewArrivalService {
    List<YhdCategoryNewArrival> listPage(Map param);
    List<YhdCategoryNewArrival> selectNewGoodsWithBrand(Map map);
    List<Map> selectNewGoodsWithoutBrand(Map map);

}
