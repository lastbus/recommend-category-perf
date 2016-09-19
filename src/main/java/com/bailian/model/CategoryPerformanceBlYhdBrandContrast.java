package com.bailian.model;

public class CategoryPerformanceBlYhdBrandContrast {
    private Integer categorySid;

    private String categoryName;

    private String yhdCateUrl;

    private String yhdBrand;

    private String blBrand;

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

    public String getYhdCateUrl() {
        return yhdCateUrl;
    }

    public void setYhdCateUrl(String yhdCateUrl) {
        this.yhdCateUrl = yhdCateUrl == null ? null : yhdCateUrl.trim();
    }

    public String getYhdBrand() {
        return yhdBrand;
    }

    public void setYhdBrand(String yhdBrand) {
        this.yhdBrand = yhdBrand == null ? null : yhdBrand.trim();
    }

    public String getBlBrand() {
        return blBrand;
    }

    public void setBlBrand(String blBrand) {
        this.blBrand = blBrand == null ? null : blBrand.trim();
    }
}