package com.bailian.model;

import java.util.Date;

public class CategoryPerformanceCategoryBrand {
    private Integer categorySid;

    private String categoryName;

    private Integer brandSid;

    private String brandName;

    private Double lowestPrice;

    private Double highestPrice;

    private Integer totalGoodsNum;

    private Integer offTheShelfGoods;

    private Integer outOfStockGoodsNum;

    private Date cdate;

    public Integer getCategorySid() {
        return categorySid;
    }

    public void setCategorySid(Integer categorySid) {
        this.categorySid = categorySid;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public Integer getBrandSid() {
        return brandSid;
    }

    public void setBrandSid(Integer brandSid) {
        this.brandSid = brandSid;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName == null ? null : brandName.trim();
    }

    public Double getLowestPrice() {
        return lowestPrice;
    }

    public void setLowestPrice(Double lowestPrice) {
        this.lowestPrice = lowestPrice;
    }

    public Double getHighestPrice() {
        return highestPrice;
    }

    public void setHighestPrice(Double highestPrice) {
        this.highestPrice = highestPrice;
    }

    public Integer getTotalGoodsNum() {
        return totalGoodsNum;
    }

    public void setTotalGoodsNum(Integer totalGoodsNum) {
        this.totalGoodsNum = totalGoodsNum;
    }

    public Integer getOffTheShelfGoods() {
        return offTheShelfGoods;
    }

    public void setOffTheShelfGoods(Integer offTheShelfGoods) {
        this.offTheShelfGoods = offTheShelfGoods;
    }

    public Integer getOutOfStockGoodsNum() {
        return outOfStockGoodsNum;
    }

    public void setOutOfStockGoodsNum(Integer outOfStockGoodsNum) {
        this.outOfStockGoodsNum = outOfStockGoodsNum;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }
}