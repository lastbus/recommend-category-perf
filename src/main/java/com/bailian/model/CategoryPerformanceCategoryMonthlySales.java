package com.bailian.model;


import java.util.Date;
public class CategoryPerformanceCategoryMonthlySales extends CategoryPerformanceCategoryMonthlySalesKey {
    private String categoryName;

    private Double sales;

    private Integer salesAmount;

    private Integer salesDistinctGoodsAmount;

    private Double fiftyPercentCnr;

    private Double eightyPercentCnr;

    private Double shelfSalesRatio;

    private Date cdate;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public Double getSales() {
        return sales;
    }

    public void setSales(Double sales) {
        this.sales = sales;
    }

    public Integer getSalesAmount() {
        return salesAmount;
    }

    public void setSalesAmount(Integer salesAmount) {
        this.salesAmount = salesAmount;
    }

    public Integer getSalesDistinctGoodsAmount() {
        return salesDistinctGoodsAmount;
    }

    public void setSalesDistinctGoodsAmount(Integer salesDistinctGoodsAmount) {
        this.salesDistinctGoodsAmount = salesDistinctGoodsAmount;
    }

    public Double getFiftyPercentCnr() {
        return fiftyPercentCnr;
    }

    public void setFiftyPercentCnr(Double fiftyPercentCnr) {
        this.fiftyPercentCnr = fiftyPercentCnr;
    }

    public Double getEightyPercentCnr() {
        return eightyPercentCnr;
    }

    public void setEightyPercentCnr(Double eightyPercentCnr) {
        this.eightyPercentCnr = eightyPercentCnr;
    }

    public Double getShelfSalesRatio() {
        return shelfSalesRatio;
    }

    public void setShelfSalesRatio(Double shelfSalesRatio) {
        this.shelfSalesRatio = shelfSalesRatio;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }
}