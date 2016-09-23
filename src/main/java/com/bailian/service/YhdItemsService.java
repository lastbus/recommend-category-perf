package com.bailian.service;

import com.bailian.model.YhdItems;

import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/18.
 */
public interface YhdItemsService {
    List<YhdItems> listPage(Map map);

    List<Map> selectNewGoodsWithoutBrand(Map map);

    List<YhdItems> selectNewGoodsWithBrand(Map map);
}
