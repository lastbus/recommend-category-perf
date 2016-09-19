package com.bailian.model;

public class CategoryPerformanceConfDetail {
    private String components;

    private String subComp;

    private String meaning;

    private Double weight;

    private Integer valid;

    public String getComponents() {
        return components;
    }

    public void setComponents(String components) {
        this.components = components == null ? null : components.trim();
    }

    public String getSubComp() {
        return subComp;
    }

    public void setSubComp(String subComp) {
        this.subComp = subComp == null ? null : subComp.trim();
    }

    public String getMeaning() {
        return meaning;
    }

    public void setMeaning(String meaning) {
        this.meaning = meaning == null ? null : meaning.trim();
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public Integer getValid() {
        return valid;
    }

    public void setValid(Integer valid) {
        this.valid = valid;
    }
}