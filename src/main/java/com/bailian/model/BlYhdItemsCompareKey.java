package com.bailian.model;

public class BlYhdItemsCompareKey {
    private String yhdGoodsUrl;

    private String yhdCategoryUrl;



    public String getYhdGoodsUrl() {
        return yhdGoodsUrl;
    }

    public void setYhdGoodsUrl(String yhdGoodsUrl) {
        this.yhdGoodsUrl = yhdGoodsUrl == null ? null : yhdGoodsUrl.trim();
    }

    public String getYhdCategoryUrl() {
        return yhdCategoryUrl;
    }

    public void setYhdCategoryUrl(String yhdCategoryUrl) {
        this.yhdCategoryUrl = yhdCategoryUrl == null ? null : yhdCategoryUrl.trim();
    }
}