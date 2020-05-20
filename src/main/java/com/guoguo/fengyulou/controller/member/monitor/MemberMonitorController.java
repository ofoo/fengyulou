package com.guoguo.fengyulou.controller.member.monitor;

import com.guoguo.common.CurrentUserManager;
import com.guoguo.common.ServerResponse;
import com.guoguo.common.StaticObject;
import com.guoguo.fengyulou.entity.member.monitor.MemberMonitor;
import com.guoguo.fengyulou.entity.user.UserMember;
import com.guoguo.fengyulou.service.member.monitor.MemberMonitorService;
import com.guoguo.fengyulou.service.user.UserService;
import com.guoguo.util.ObjectUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 人员监听
 */
@Controller
@RequestMapping("/fyl")
public class MemberMonitorController {

    private static final Logger logger = LoggerFactory.getLogger(MemberMonitorController.class);

    @Autowired
    private MemberMonitorService memberMonitorService;
    @Autowired
    private CurrentUserManager currentUserManager;
    @Autowired
    private UserService userService;

    /**
     * 列表页面
     *
     * @return
     */
    @RequestMapping("/memberMonitor/list/page")
    public String list(HttpServletRequest request, HttpSession session, MemberMonitor memberMonitor) {
        List<UserMember> userList = userService.getUserMemberList();
        String json = StaticObject.gson.toJson(userList);
        request.setAttribute("ztreeData", json);

        memberMonitor.setUserIdTwo(currentUserManager.getUserId());
        List<MemberMonitor> memberMonitorList = memberMonitorService.getMemberMonitorList(memberMonitor);
        request.setAttribute("dataJson", StaticObject.gson.toJson(memberMonitorList));
        request.setAttribute("dataList", memberMonitorList);
        return "/member/monitor/member-monitor-list";
    }

    /**
     * ajax列表数据
     * @param request
     * @param memberMonitor
     * @return
     */
    @RequestMapping("/memberMonitor/ajax/list")
    public String ajaxList(HttpServletRequest request, MemberMonitor memberMonitor) {
        memberMonitor.setUserIdTwo(currentUserManager.getUserId());
        List<MemberMonitor> memberMonitorList = memberMonitorService.getMemberMonitorList(memberMonitor);
        request.setAttribute("dataList", memberMonitorList);
        return "/member/monitor/member-monitor-list-ajax";
    }

    /**
     * 保存数据
     *
     * @param memberMonitor
     * @return
     */
    @RequestMapping("/memberMonitor/ajax/save")
    @ResponseBody
    public ServerResponse ajaxSave(MemberMonitor memberMonitor, HttpSession session) {
        if (ObjectUtils.isNull(memberMonitor.getUserIdOne())) {
            return ServerResponse.createByError();
        }
        if (ObjectUtils.isNull(memberMonitor.getMemberId())) {
            return ServerResponse.createByError();
        }
        memberMonitor.setUserIdTwo(currentUserManager.getUserId());
        return memberMonitorService.saveMemberMonitor(memberMonitor);
    }
}
