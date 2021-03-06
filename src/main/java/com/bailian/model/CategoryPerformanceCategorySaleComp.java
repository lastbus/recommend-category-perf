package com.bailian.model;

import java.util.Date;

public class CategoryPerformanceCategorySaleComp {
    private Integer categorySid;

    private Integer level;

    private Double ninetyDaySales;

    private Double ninetyDaySalesRatio;

    private Double normNinetyDaySalesRatio;

    private Double singleSkuSales;

    private Double singleSkuSalesRatio;

    private Double normSingleSkuSalesRatio;

    private Double aveGrowthRate;

    private Double normAveGrowthRate;

    private Date cdate;

    public Integer getCategorySid() {
        return categorySid;
    }

    public void setCategorySid(Integer categorySid) {
        this.categorySid = categorySid;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Double getNinetyDaySales() {
        return ninetyDaySales;
    }

    public void setNinetyDaySales(Double ninetyDaySales) {
        this.ninetyDaySales = ninetyDaySales;
    }

    public Double getNinetyDaySalesRatio() {
        return ninetyDaySalesRatio;
    }

    public void setNinetyDaySalesRatio(Double ninetyDaySalesRatio) {
        this.ninetyDaySalesRatio = ninetyDaySalesRatio;
    }

    public Double getNormNinetyDaySalesRatio() {
        return normNinetyDaySalesRatio;
    }

    public void setNormNinetyDaySalesRatio(Double normNinetyDaySalesRatio) {
        this.normNinetyDaySalesRatio = normNinetyDaySalesRatio;
    }

    public Double getSingleSkuSales() {
        return singleSkuSales;
    }

    public void setSingleSkuSales(Double singleSkuSales) {
        this.singleSkuSales = singleSkuSales;
    }

    public Double getSingleSkuSalesRatio() {
        return singleSkuSalesRatio;
    }

    public void setSingleSkuSalesRatio(Double singleSkuSalesRatio) {
        this.singleSkuSalesRatio = singleSkuSalesRatio;
    }

    public Double getNormSingleSkuSalesRatio() {
        return normSingleSkuSalesRatio;
    }

    public void setNormSingleSkuSalesRatio(Double normSingleSkuSalesRatio) {
        this.normSingleSkuSalesRatio = normSingleSkuSalesRatio;
    }

    public Double getAveGrowthRate() {
        return aveGrowthRate;
    }

    public void setAveGrowthRate(Double aveGrowthRate) {
        this.aveGrowthRate = aveGrowthRate;
    }

    public Double getNormAveGrowthRate() {
        return normAveGrowthRate;
    }

    public void setNormAveGrowthRate(Double normAveGrowthRate) {
        this.normAveGrowthRate = normAveGrowthRate;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }
}