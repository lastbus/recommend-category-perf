package com.bailian.model;

public class BlYhdItemsCompare extends BlYhdItemsCompareKey {
    private Integer blGoodsCategory;
    private Integer blGoodsSid;

    private String blGoodsName;

    private Double blGoodsPrice;

    private String yhdGoodsName;

    private Double yhdGoodsPrice;

    private Integer yhdGoodsType;


    public String getStrYhdGoodsType() {
        if (getYhdGoodsType() == 0) {
            strYhdGoodsType = "新品";
        } else if (getYhdGoodsType() == 1) {
            strYhdGoodsType = "热销";
        }
        return strYhdGoodsType;
    }

    public void setStrYhdGoodsType(String strYhdGoodsType) {
        this.strYhdGoodsType = strYhdGoodsType;
    }

    private String strYhdGoodsType;

    public Integer getBlGoodsSid() {
        return blGoodsSid;
    }

    public void setBlGoodsSid(Integer blGoodsSid) {
        this.blGoodsSid = blGoodsSid;
    }
    public Integer getBlGoodsCategory() {
        return blGoodsCategory;
    }

    public void setBlGoodsCategory(Integer blGoodsCategory) {
        this.blGoodsCategory = blGoodsCategory;
    }


    public String getBlGoodsName() {
        return blGoodsName;
    }

    public void setBlGoodsName(String blGoodsName) {
        this.blGoodsName = blGoodsName == null ? null : blGoodsName.trim();
    }

    public Double getBlGoodsPrice() {
        return blGoodsPrice;
    }

    public void setBlGoodsPrice(Double blGoodsPrice) {
        this.blGoodsPrice = blGoodsPrice;
    }

    public String getYhdGoodsName() {
        return yhdGoodsName;
    }

    public void setYhdGoodsName(String yhdGoodsName) {
        this.yhdGoodsName = yhdGoodsName == null ? null : yhdGoodsName.trim();
    }

    public Double getYhdGoodsPrice() {
        return yhdGoodsPrice;
    }

    public void setYhdGoodsPrice(Double yhdGoodsPrice) {
        this.yhdGoodsPrice = yhdGoodsPrice;
    }

    public Integer getYhdGoodsType() {
        return yhdGoodsType;
    }

    public void setYhdGoodsType(Integer yhdGoodsType) {
        this.yhdGoodsType = yhdGoodsType;
    }
}