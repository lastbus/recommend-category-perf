package com.bailian.model;

import java.util.Date;

public class CategoryPerformanceCategoryMonthlyHotcakes {
    private Integer categorySid;

    private String categoryName;

    private String month;

    private Integer rank;

    private String goodsSid;

    private String goodsSaleName;

    private Double goodsSalePrice;

    private Integer saleAmount;

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

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month == null ? null : month.trim();
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public String getGoodsSid() {
        return goodsSid;
    }

    public void setGoodsSid(String goodsSid) {
        this.goodsSid = goodsSid == null ? null : goodsSid.trim();
    }

    public String getGoodsSaleName() {
        return goodsSaleName;
    }

    public void setGoodsSaleName(String goodsSaleName) {
        this.goodsSaleName = goodsSaleName == null ? null : goodsSaleName.trim();
    }

    public Double getGoodsSalePrice() {
        return goodsSalePrice;
    }

    public void setGoodsSalePrice(Double goodsSalePrice) {
        this.goodsSalePrice = goodsSalePrice;
    }

    public Integer getSaleAmount() {
        return saleAmount;
    }

    public void setSaleAmount(Integer saleAmount) {
        this.saleAmount = saleAmount;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }
}