package com.bailian.model;

import java.util.Date;

public class CategoryPerformanceCategoryPopularity {
    private Integer categorySid;

    private String categoryName;

    private Integer level;

    private String month;

    private Integer pv;

    private Integer uv;

    private Integer numberOfCustomers;

    private Double pvRatio;

    private Double uvRatio;

    private Double customersRatio;

    private Double normPvRatio;

    private Double normUvRatio;

    private Double normCustRatio;

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

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month == null ? null : month.trim();
    }

    public Integer getPv() {
        return pv;
    }

    public void setPv(Integer pv) {
        this.pv = pv;
    }

    public Integer getUv() {
        return uv;
    }

    public void setUv(Integer uv) {
        this.uv = uv;
    }

    public Integer getNumberOfCustomers() {
        return numberOfCustomers;
    }

    public void setNumberOfCustomers(Integer numberOfCustomers) {
        this.numberOfCustomers = numberOfCustomers;
    }

    public Double getPvRatio() {
        return pvRatio;
    }

    public void setPvRatio(Double pvRatio) {
        this.pvRatio = pvRatio;
    }

    public Double getUvRatio() {
        return uvRatio;
    }

    public void setUvRatio(Double uvRatio) {
        this.uvRatio = uvRatio;
    }

    public Double getCustomersRatio() {
        return customersRatio;
    }

    public void setCustomersRatio(Double customersRatio) {
        this.customersRatio = customersRatio;
    }

    public Double getNormPvRatio() {
        return normPvRatio;
    }

    public void setNormPvRatio(Double normPvRatio) {
        this.normPvRatio = normPvRatio;
    }

    public Double getNormUvRatio() {
        return normUvRatio;
    }

    public void setNormUvRatio(Double normUvRatio) {
        this.normUvRatio = normUvRatio;
    }

    public Double getNormCustRatio() {
        return normCustRatio;
    }

    public void setNormCustRatio(Double normCustRatio) {
        this.normCustRatio = normCustRatio;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }
}