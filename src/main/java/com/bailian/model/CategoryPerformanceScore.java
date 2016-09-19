package com.bailian.model;

import java.text.DecimalFormat;

public class CategoryPerformanceScore {
    private Integer categorySid;

    private String categoryName;

    private Integer parentSid;

    private Integer level;

    private Integer rank;

    private Integer rankingChange;

    private Double salesVolume;

    private Double drainage;

    private Double configuration;

    private Double operation;

    private Double performance;

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

    public Integer getParentSid() {
        return parentSid;
    }

    public void setParentSid(Integer parentSid) {
        this.parentSid = parentSid;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public Integer getRankingChange() {
        return rankingChange;
    }

    public void setRankingChange(Integer rankingChange) {
        this.rankingChange = rankingChange;
    }

    public Double getSalesVolume() {
        return salesVolume;
    }

    public void setSalesVolume(Double salesVolume) {
        this.salesVolume = salesVolume;
    }

    public Double getDrainage() {
        return drainage;
    }

    public void setDrainage(Double drainage) {
        this.drainage = drainage;
    }

    public Double getConfiguration() {
        return configuration;
    }

    public void setConfiguration(Double configuration) {
        this.configuration = configuration;
    }

    public Double getOperation() {
        return operation;
    }

    public void setOperation(Double operation) {
        this.operation = operation;
    }

    public Double getPerformance() {
        return performance;
    }

    public void setPerformance(Double performance) {
        this.performance = performance;
    }
}