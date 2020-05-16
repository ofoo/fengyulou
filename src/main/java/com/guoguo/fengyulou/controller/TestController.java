package com.guoguo.fengyulou.controller;

import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 测试控制器
 */
@RestController
public class TestController {
    @RequestMapping("/pc")
    public Map<String,Object> pc(HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();

        UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
        OperatingSystem operatingSystem = userAgent.getOperatingSystem();
        System.out.println(operatingSystem.getId());

        return map;
    }
}
