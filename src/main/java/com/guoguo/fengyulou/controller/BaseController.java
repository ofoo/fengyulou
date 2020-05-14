package com.guoguo.fengyulou.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.guoguo.fengyulou.constant.UserConstant;
import com.guoguo.fengyulou.entity.user.User;
import com.guoguo.util.ObjectUtils;

import javax.servlet.http.HttpSession;

public class BaseController {
    protected static Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();

    /**
     * 获取用户id
     *
     * @param session
     * @return
     */
    public Long getUserId(HttpSession session) {
        User user = (User) session.getAttribute(UserConstant.CURRENT);
        if (ObjectUtils.isNull(user)) {
            return null;
        }
        return user.getId();
    }
}
