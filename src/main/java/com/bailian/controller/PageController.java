package com.bailian.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName: PageController 
 * @Description: 视图控制器,返回jsp视图给前端
 * @author zhangwenming
 * @date 2015年11月27日 下午2:49:02
 */
@Controller
@RequestMapping("/")
public class PageController {

    @RequestMapping("/index")
    public String index() {
    	return "/layout/main";
    }

}