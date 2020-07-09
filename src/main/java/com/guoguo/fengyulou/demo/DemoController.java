package com.guoguo.fengyulou.demo;

import com.guoguo.fengyulou.knowledge.entity.Knowledge;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 项目管理
 */
@Controller
@Slf4j
public class DemoController {


    /**
     * 列表页面
     *
     * @return
     */
    @RequestMapping("/demo")
    public String demo(HttpServletRequest request, Knowledge knowledge) {
        return "demo";
    }

}
