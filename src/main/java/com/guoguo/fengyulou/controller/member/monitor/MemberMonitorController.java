package com.guoguo.fengyulou.controller.member.monitor;

import com.guoguo.common.CurrentUserManager;
import com.guoguo.common.ServerResponse;
import com.guoguo.common.StaticObject;
import com.guoguo.fengyulou.entity.member.monitor.MemberMonitor;
import com.guoguo.fengyulou.entity.user.UserMember;
import com.guoguo.fengyulou.service.member.MemberService;
import com.guoguo.fengyulou.service.member.monitor.MemberMonitorService;
import com.guoguo.fengyulou.service.user.UserService;
import com.guoguo.util.ObjectUtils;
import com.guoguo.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private MemberService memberService;

    /**
     * 列表页面
     *
     * @return
     */
    @RequestMapping("/memberMonitor/list/page")
    public String list(HttpServletRequest request, HttpSession session, MemberMonitor memberMonitor) {
        List<UserMember> userList = userService.getUserMemberList();
        String json = StaticObject.gson.toJson(userList);
        System.out.println(json);
        request.setAttribute("ztreeData",json);
        return "/member/monitor/member-monitor-list";
    }

    /**
     * 添加页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/memberMonitor/insert")
    public String insert(HttpServletRequest request, HttpSession session) {
        request.setAttribute("pageTitle", "添加人员");
        // task=任务页面打开
        String str = request.getParameter("str");
        logger.info("str={}", str);
        request.setAttribute("str", str);
        return "member/monitor/memberMonitor-save";
    }

    /**
     * 修改页面
     *
     * @param request
     * @param session
     * @param memberMonitor
     * @return
     */
    @RequestMapping("/memberMonitor/update")
    public String update(HttpServletRequest request, HttpSession session, MemberMonitor memberMonitor) {
        request.setAttribute("pageTitle", "修改人员");
        //获取用户id
        Long userId = currentUserManager.getUserId();
        // 查询人员
        memberMonitor.setUserId(userId);
        request.setAttribute("data", memberMonitorService.getMemberMonitorByIdAndUserId(memberMonitor));
        return "member/monitor/memberMonitor-save";
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
        if (ObjectUtils.isNull(memberMonitor.getMemberId())) {
            return ServerResponse.createBySuccessMessage("请选择人员");
        }
        memberMonitor.setUserId(currentUserManager.getUserId());
        return memberMonitorService.saveMemberMonitor(memberMonitor);
    }

    /**
     * 删除数据
     *
     * @param ids
     * @return
     */
    @RequestMapping("/memberMonitor/ajax/delete")
    @ResponseBody
    public ServerResponse ajaxDelete(@RequestParam List<Long> ids, HttpSession session) {
        if (ObjectUtils.isNull(ids)) {
            return ServerResponse.createByErrorMessage("请选择数据");
        }
        return memberMonitorService.deleteMemberMonitorByIdsAndUserId(ids, currentUserManager.getUserId());
    }

    /**
     * 下拉选列表
     *
     * @param request
     * @return
     */
    @RequestMapping("/memberMonitor/ajax/list")
    public String ajaxList(HttpServletRequest request, HttpSession session) {
        MemberMonitor memberMonitor = new MemberMonitor();
        memberMonitor.setUserId(currentUserManager.getUserId());
        request.setAttribute("list", memberMonitorService.getMemberMonitorList(memberMonitor));
        return "common/select-item";
    }
}
