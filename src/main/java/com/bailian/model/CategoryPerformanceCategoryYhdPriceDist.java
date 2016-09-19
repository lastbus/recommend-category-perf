package com.bailian.model;

public class CategoryPerformanceCategoryYhdPriceDist {
    private Integer categorySid;

    private Integer rangeNo;

    private Double lowPrice;

    private Double highPrice;

    private Integer type;

    private Integer saleSum;

    private String yhdCateUrl;

    private Integer goodsSum;

    private Integer comtSum;

    public Integer getCategorySid() {
        return categorySid;
    }

    public void setCategorySid(Integer categorySid) {
        this.categorySid = categorySid;
    }

    public Integer getRangeNo() {
        return rangeNo;
    }

    public void setRangeNo(Integer rangeNo) {
        this.rangeNo = rangeNo;
    }

    public Double getLowPrice() {
        return lowPrice;
    }

    public void setLowPrice(Double lowPrice) {
        this.lowPrice = lowPrice;
    }

    public Double getHighPrice() {
        return highPrice;
    }

    public void setHighPrice(Double highPrice) {
        this.highPrice = highPrice;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getSaleSum() {
        return saleSum;
    }

    public void setSaleSum(Integer saleSum) {
        this.saleSum = saleSum;
    }

    public String getYhdCateUrl() {
        return yhdCateUrl;
    }

    public void setYhdCateUrl(String yhdCateUrl) {
        this.yhdCateUrl = yhdCateUrl == null ? null : yhdCateUrl.trim();
    }

    public Integer getGoodsSum() {
        return goodsSum;
    }

    public void setGoodsSum(Integer goodsSum) {
        this.goodsSum = goodsSum;
    }

    public Integer getComtSum() {
        return comtSum;
    }

    public void setComtSum(Integer comtSum) {
        this.comtSum = comtSum;
    }
}