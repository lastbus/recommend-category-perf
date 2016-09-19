package com.bailian.model;

import com.alibaba.fastjson.JSONObject;
import com.bailian.page.Page;

import java.util.List;

/**
 * author: zhangwenming
 * Date: 2016/7/11
 * Time: 12:08
 * version: 1.0
 */
public class BootPage<E> {

    private Integer limit;

    private Integer offset;

    private Long total;

    private List<E> rows;


    public void setPage(Page<E> page) {
        this.setTotal(page.getTotalRecords());
    }

    public String printOut() {
        return handleBootPage().toString();
    }

    public String printOut(List<E> rows) {
        this.setRows(rows);
        return handleBootPage().toString();
    }

    private JSONObject handleBootPage() {
        JSONObject resutlt = new JSONObject();
        resutlt.put("limit", this.getLimit());
        resutlt.put("offset", this.getOffset());
        resutlt.put("total", this.getTotal());
        resutlt.put("rows", this.getRows());
        return resutlt;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<E> getRows() {
        return rows;
    }

    public void setRows(List<E> rows) {
        this.rows = rows;
    }
}
