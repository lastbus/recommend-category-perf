package com.bailian.model;

public class CategoryPerformanceCategoryPriceConf {
    private Integer categorySid;

    private Integer rangeNo;

    private Double lowPrice;

    private Double highPrice;

    //1代表销售的数量，0代表库存的数量
    private Integer type;

    private Integer saleSum;

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
}