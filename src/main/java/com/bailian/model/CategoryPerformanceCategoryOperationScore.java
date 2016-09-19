package com.bailian.model;

public class CategoryPerformanceCategoryOperationScore extends CategoryPerformanceCategoryOperationScoreKey {
    private String categoryName;

    private Double stockSkuRate;

    private Double avePropFillRate;

    private Double avePriceAdjustmentTime;

    private Double aveOnOffShelfTime;

    private Double shelfSaleRatio;

    private Double outOfStockScore;

    private Double propFillScore;

    private Double priceAdjScore;

    private Double offShelfScore;

    private Double stockSaleRatioScore;

    private Double operScore;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public Double getStockSkuRate() {
        return stockSkuRate;
    }

    public void setStockSkuRate(Double stockSkuRate) {
        this.stockSkuRate = stockSkuRate;
    }

    public Double getAvePropFillRate() {
        return avePropFillRate;
    }

    public void setAvePropFillRate(Double avePropFillRate) {
        this.avePropFillRate = avePropFillRate;
    }

    public Double getAvePriceAdjustmentTime() {
        return avePriceAdjustmentTime;
    }

    public void setAvePriceAdjustmentTime(Double avePriceAdjustmentTime) {
        this.avePriceAdjustmentTime = avePriceAdjustmentTime;
    }

    public Double getAveOnOffShelfTime() {
        return aveOnOffShelfTime;
    }

    public void setAveOnOffShelfTime(Double aveOnOffShelfTime) {
        this.aveOnOffShelfTime = aveOnOffShelfTime;
    }

    public Double getShelfSaleRatio() {
        return shelfSaleRatio;
    }

    public void setShelfSaleRatio(Double shelfSaleRatio) {
        this.shelfSaleRatio = shelfSaleRatio;
    }

    public Double getOutOfStockScore() {
        return outOfStockScore;
    }

    public void setOutOfStockScore(Double outOfStockScore) {
        this.outOfStockScore = outOfStockScore;
    }

    public Double getPropFillScore() {
        return propFillScore;
    }

    public void setPropFillScore(Double propFillScore) {
        this.propFillScore = propFillScore;
    }

    public Double getPriceAdjScore() {
        return priceAdjScore;
    }

    public void setPriceAdjScore(Double priceAdjScore) {
        this.priceAdjScore = priceAdjScore;
    }

    public Double getOffShelfScore() {
        return offShelfScore;
    }

    public void setOffShelfScore(Double offShelfScore) {
        this.offShelfScore = offShelfScore;
    }

    public Double getStockSaleRatioScore() {
        return stockSaleRatioScore;
    }

    public void setStockSaleRatioScore(Double stockSaleRatioScore) {
        this.stockSaleRatioScore = stockSaleRatioScore;
    }

    public Double getOperScore() {
        return operScore;
    }

    public void setOperScore(Double operScore) {
        this.operScore = operScore;
    }
}