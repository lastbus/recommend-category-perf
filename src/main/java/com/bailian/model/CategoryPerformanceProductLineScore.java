package com.bailian.model;

public class CategoryPerformanceProductLineScore {
    private Integer categorySid;

    private String categoryName;

    private Double avgEightyPercentCnr;

    private Double eightyPercentCnrScore;

    private Double avgShelfSalesRatio;

    private Double shelfSalesRatioScore;

    private Double priceCorrelation;

    private Double priceCorrelationScore;

    private Double orgScore;

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

    public Double getAvgEightyPercentCnr() {
        return avgEightyPercentCnr;
    }

    public void setAvgEightyPercentCnr(Double avgEightyPercentCnr) {
        this.avgEightyPercentCnr = avgEightyPercentCnr;
    }

    public Double getEightyPercentCnrScore() {
        return eightyPercentCnrScore;
    }

    public void setEightyPercentCnrScore(Double eightyPercentCnrScore) {
        this.eightyPercentCnrScore = eightyPercentCnrScore;
    }

    public Double getAvgShelfSalesRatio() {
        return avgShelfSalesRatio;
    }

    public void setAvgShelfSalesRatio(Double avgShelfSalesRatio) {
        this.avgShelfSalesRatio = avgShelfSalesRatio;
    }

    public Double getShelfSalesRatioScore() {
        return shelfSalesRatioScore;
    }

    public void setShelfSalesRatioScore(Double shelfSalesRatioScore) {
        this.shelfSalesRatioScore = shelfSalesRatioScore;
    }

    public Double getPriceCorrelation() {
        return priceCorrelation;
    }

    public void setPriceCorrelation(Double priceCorrelation) {
        this.priceCorrelation = priceCorrelation;
    }

    public Double getPriceCorrelationScore() {
        return priceCorrelationScore;
    }

    public void setPriceCorrelationScore(Double priceCorrelationScore) {
        this.priceCorrelationScore = priceCorrelationScore;
    }

    public Double getOrgScore() {
        return orgScore;
    }

    public void setOrgScore(Double orgScore) {
        this.orgScore = orgScore;
    }
}