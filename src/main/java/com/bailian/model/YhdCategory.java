package com.bailian.model;

public class YhdCategory {
    private Integer id;

    private String categoryName;

    private String url;

    private Integer goodsnum;

    private Integer brandsnum;

    private String brands;

    private Double minPrice;

    private Double maxPrice;

    private String priceHistgram;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Integer getGoodsnum() {
        return goodsnum;
    }

    public void setGoodsnum(Integer goodsnum) {
        this.goodsnum = goodsnum;
    }

    public Integer getBrandsnum() {
        return brandsnum;
    }

    public void setBrandsnum(Integer brandsnum) {
        this.brandsnum = brandsnum;
    }

    public String getBrands() {
        return brands;
    }

    public void setBrands(String brands) {
        this.brands = brands == null ? null : brands.trim();
    }

    public Double getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Double minPrice) {
        this.minPrice = minPrice;
    }

    public Double getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Double maxPrice) {
        this.maxPrice = maxPrice;
    }

    public String getPriceHistgram() {
        return priceHistgram;
    }

    public void setPriceHistgram(String priceHistgram) {
        this.priceHistgram = priceHistgram == null ? null : priceHistgram.trim();
    }
}