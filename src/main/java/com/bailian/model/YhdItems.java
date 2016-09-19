package com.bailian.model;

import java.util.Date;

public class YhdItems extends YhdItemsKey {
    private String categoryUrl;

    private String goodsName;

    private Double price;

    private Integer comment;

    private Double favorableRate;

    private String seller;

    private Date dt;

    public String getCategoryUrl() {
        return categoryUrl;
    }

    public void setCategoryUrl(String categoryUrl) {
        this.categoryUrl = categoryUrl == null ? null : categoryUrl.trim();
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getComment() {
        return comment;
    }

    public void setComment(Integer comment) {
        this.comment = comment;
    }

    public Double getFavorableRate() {
        return favorableRate;
    }

    public void setFavorableRate(Double favorableRate) {
        this.favorableRate = favorableRate;
    }

    public String getSeller() {
        return seller;
    }

    public void setSeller(String seller) {
        this.seller = seller == null ? null : seller.trim();
    }

    public Date getDt() {
        return dt;
    }

    public void setDt(Date dt) {
        this.dt = dt;
    }
}