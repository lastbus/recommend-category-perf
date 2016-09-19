package com.bailian.model;

import java.util.Date;

public class CategoryPerformanceBasic {
    private Integer categorySid;

    private String categoryName;

    private Integer level;

    private Integer parentSid;

    private String categoryTree;

    private Integer totalGoodsNum;

    private Integer offTheShelfGoodsNum;

    private Integer outOfStockGoodsNum;

    private Integer brandNum;

    private Double lowestPrice;

    private Double highestPrice;

    private String yhdCategoryTree;

    private String yhdCategoryUrl;

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

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getParentSid() {
        return parentSid;
    }

    public void setParentSid(Integer parentSid) {
        this.parentSid = parentSid;
    }

    public String getCategoryTree() {
        return categoryTree;
    }

    public void setCategoryTree(String categoryTree) {
        this.categoryTree = categoryTree == null ? null : categoryTree.trim();
    }

    public Integer getTotalGoodsNum() {
        return totalGoodsNum;
    }

    public void setTotalGoodsNum(Integer totalGoodsNum) {
        this.totalGoodsNum = totalGoodsNum;
    }

    public Integer getOffTheShelfGoodsNum() {
        return offTheShelfGoodsNum;
    }

    public void setOffTheShelfGoodsNum(Integer offTheShelfGoodsNum) {
        this.offTheShelfGoodsNum = offTheShelfGoodsNum;
    }

    public Integer getOutOfStockGoodsNum() {
        return outOfStockGoodsNum;
    }

    public void setOutOfStockGoodsNum(Integer outOfStockGoodsNum) {
        this.outOfStockGoodsNum = outOfStockGoodsNum;
    }

    public Integer getBrandNum() {
        return brandNum;
    }

    public void setBrandNum(Integer brandNum) {
        this.brandNum = brandNum;
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

    public String getYhdCategoryTree() {
        return yhdCategoryTree;
    }

    public void setYhdCategoryTree(String yhdCategoryTree) {
        this.yhdCategoryTree = yhdCategoryTree == null ? null : yhdCategoryTree.trim();
    }

    public String getYhdCategoryUrl() {
        return yhdCategoryUrl;
    }

    public void setYhdCategoryUrl(String yhdCategoryUrl) {
        this.yhdCategoryUrl = yhdCategoryUrl == null ? null : yhdCategoryUrl.trim();
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }
}