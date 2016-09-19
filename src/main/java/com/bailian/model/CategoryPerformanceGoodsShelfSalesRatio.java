package com.bailian.model;

import java.util.Date;

public class CategoryPerformanceGoodsShelfSalesRatio extends CategoryPerformanceGoodsShelfSalesRatioKey {
    private String categoryName;

    private Integer level;

    private String goodsSalesName;

    private Integer stock;

    private Double avgDaySaleSum;

    private Double ratio;

    private Date cdate;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getGoodsSalesName() {
        return goodsSalesName;
    }

    public void setGoodsSalesName(String goodsSalesName) {
        this.goodsSalesName = goodsSalesName == null ? null : goodsSalesName.trim();
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Double getAvgDaySaleSum() {
        return avgDaySaleSum;
    }

    public void setAvgDaySaleSum(Double avgDaySaleSum) {
        this.avgDaySaleSum = avgDaySaleSum;
    }

    public Double getRatio() {
        return ratio;
    }

    public void setRatio(Double ratio) {
        this.ratio = ratio;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }
}