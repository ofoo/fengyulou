package com.guoguo.fengyulou.controller.user;

import com.guoguo.common.CommonConstant;
import com.guoguo.fengyulou.controller.BaseController;
import com.guoguo.util.ObjectUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController extends BaseController {
    /**
     * 登录页面
     *
     * @return
     */
    @RequestMapping("/")
    public String login(HttpSession session) {
        if (ObjectUtils.isNotNull(getUserId(session))) {
            return "redirect:" + CommonConstant.INDEX;
        }
        return "login";
    }
}
