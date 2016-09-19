package com.bailian.controller;

import com.bailian.model.BootPage;
import com.bailian.model.CategoryPerformanceConf;
import com.bailian.model.CategoryPerformanceConfDetail;
import com.bailian.model.CategoryPerformanceNote;
import com.bailian.page.Page;
import com.bailian.service.CategoryPerformanceConfDetailService;
import com.bailian.service.CategoryPerformanceConfService;
import com.bailian.service.CategoryPerformanceNoteService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by YQ85 on 2016/9/9.
 */
@Controller
@RequestMapping("/category")
public class CategoryConfigurationController {
    @Resource
    private CategoryPerformanceConfService categoryPerformanceConfService;
    @Resource
    private CategoryPerformanceConfDetailService categoryPerformanceConfDetailService;
    @Resource
    private CategoryPerformanceNoteService categoryPerformanceNoteService;
    @RequestMapping("/categoryConfiguration.html")
    public String categoryConfiguration() {
        return "project1/categoryConfiguration";
    }

    @RequestMapping("/categoryConf")
    @ResponseBody
    public String categoryConf(BootPage bootPage) {
        Page<CategoryPerformanceConf> page = Page.startPage(CategoryPerformanceConf.class, bootPage);
        List<CategoryPerformanceConf> list = this.categoryPerformanceConfService.listPage();
        bootPage.setPage(page);
        String result = bootPage.printOut(list);
        return result;
    }
    @RequestMapping("/categoryConfDetail")
    @ResponseBody
    public String categoryConfDetail(BootPage bootPage) {
        Page<CategoryPerformanceConfDetail> page = Page.startPage(CategoryPerformanceConfDetail.class, bootPage);
        List<CategoryPerformanceConfDetail> list = this.categoryPerformanceConfDetailService.listPage();
        bootPage.setPage(page);
        String result = bootPage.printOut(list);
        return result;
    }
    @RequestMapping("/categoryNote")
    @ResponseBody
    public String categoryNote(BootPage bootPage) {
        Page<CategoryPerformanceNote> page = Page.startPage(CategoryPerformanceNote.class, bootPage);
        List<CategoryPerformanceNote> list = this.categoryPerformanceNoteService.listPage();
        bootPage.setPage(page);
        String result = bootPage.printOut(list);
        return result;
    }


}
