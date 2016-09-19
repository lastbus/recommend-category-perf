package com.bailian.service;

import com.bailian.model.YhdCategory;

import java.util.List;
import java.util.Map;

/**
 * Created by YQ85 on 2016/9/9.
 */
public interface YhdCategoryService {
    YhdCategory selectByUrl(Integer categoryId);
    List<YhdCategory> getCategory();

    YhdCategory selectUrl(String yhdCategory);
}
