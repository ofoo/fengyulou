package com.guoguo.test.verification_code;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class VerificationCodeController {
    /**
     * 生成验证码，字母和数字
     *
     * @return
     */
    @RequestMapping("/verification/code")
    public String verificationCode() {
        return "test/verification_code/verification-code";
    }

    /**
     * 生成验证码，字母和数字
     *
     * @param request
     * @param response
     * @param session
     */
    @RequestMapping("/verificationCode")
    public void verificationCode(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //1.清空浏览器缓存，目的为了清空浏览器的缓存，因为浏览器会对网站的资源文件和图片进行记忆存储，如果被浏览器加载过的图片就基益起来，记忆以后文件就不会和服务器在交互，如果我们验证码清空的话可能会造成一个问题就是，验证码刷新以后没有效果。
        response.setHeader("pragma", "no-cache");
        response.setHeader("cache-control", "no-cache");
        response.setHeader("expires", "0");

        //2.调用编写的生成验证码的工具
        String code = CaptcahCode.drawImage(response);
        session.setAttribute("code", code);
    }

    /**
     * 生成算术验证码
     *
     * @return
     */
    @RequestMapping("/verification/code2")
    public String verificationCode2() {
        return "test/verification_code/verification-code2";
    }

    /**
     * 生成算术验证码
     *
     * @param request
     * @param response
     * @param session
     */
    @RequestMapping("/verificationCode2")
    public void verificationCode2(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //1.清空浏览器缓存，目的为了清空浏览器的缓存，因为浏览器会对网站的资源文件和图片进行记忆存储，如果被浏览器加载过的图片就基益起来，记忆以后文件就不会和服务器在交互，如果我们验证码清空的话可能会造成一个问题就是，验证码刷新以后没有效果。
        response.setHeader("pragma", "no-cache");
        response.setHeader("cache-control", "no-cache");
        response.setHeader("expires", "0");

        //2.调用编写的生成验证码的工具
        String code = CaptcahCode.drawImageVerificate(response);
        session.setAttribute("code", code);
    }

    /**
     * 测试页面
     * @return
     */
    @RequestMapping("/test")
    public String test(){
        return "test/verification_code/test";
    }

    /**
     * 验证码判断测试
     * @param request
     * @return
     */
    @RequestMapping("/verificationTest")
    @ResponseBody
    public String verificationTest(HttpServletRequest request){
        //获取用户传递过来的验证码
        String code = request.getParameter("code");
        //获取生成的二维码
        String sessionCode= (String) request.getSession().getAttribute("code");
        if (code!=null&&sessionCode!=null){
            //如果用户输入的验证码和产生在服务器端生成的验证码一致，那么就告诉用户输入验证码
            if (code.equalsIgnoreCase(sessionCode)){
                //登录逻辑，注册逻辑等相关业务操作
                return "success";
            }
        }
        return "fail";
    }
}
