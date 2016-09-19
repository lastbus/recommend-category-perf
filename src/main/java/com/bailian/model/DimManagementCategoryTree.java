package com.bailian.model;

public class DimManagementCategoryTree {
    private String sid;

    private String parentSid;

    private Long lev;

    private String name;

    private Long rootSid;

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid == null ? null : sid.trim();
    }

    public String getParentSid() {
        return parentSid;
    }

    public void setParentSid(String parentSid) {
        this.parentSid = parentSid == null ? null : parentSid.trim();
    }

    public Long getLev() {
        return lev;
    }

    public void setLev(Long lev) {
        this.lev = lev;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getRootSid() {
        return rootSid;
    }

    public void setRootSid(Long rootSid) {
        this.rootSid = rootSid;
    }
}