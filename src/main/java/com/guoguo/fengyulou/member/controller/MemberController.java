package com.guoguo.fengyulou.member.controller;

import com.github.pagehelper.PageInfo;
import com.guoguo.common.CurrentUserManager;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.member.entity.Member;
import com.guoguo.fengyulou.member_label.entity.MemberLabel;
import com.guoguo.fengyulou.member.service.MemberService;
import com.guoguo.fengyulou.member_label.service.MemberLabelService;
import com.guoguo.util.ObjectUtils;
import com.guoguo.util.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 人员管理
 */
@Controller
@RequestMapping("/fyl")
@Slf4j
public class MemberController {

    @Autowired
    private MemberService memberService;
    @Autowired
    private MemberLabelService memberLabelService;
    @Autowired
    private CurrentUserManager currentUserManager;

    /**
     * 列表页面
     *
     * @return
     */
    @RequestMapping("/member/list")
    public String list(HttpServletRequest request, HttpSession session, Member member) {
        request.setAttribute("data", member);
        member.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", memberService.getMemberListPage(member));
        return "page/member/member-list";
    }

    @RequestMapping("/member/ajax/list")
    public String ajaxList(HttpServletRequest request, HttpSession session, Member member) {
        request.setAttribute("data", member);
        member.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", memberService.getMemberListPage(member));
        return "page/member/member-list-ajax";
    }

    /**
     * 添加页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/member/insert")
    public String insert(HttpServletRequest request, HttpSession session) {
        request.setAttribute("pageTitle", "添加人员");
        // 查询人员标签列表
        MemberLabel memberLabel = new MemberLabel();
        memberLabel.setUserId(currentUserManager.getUserId());
        request.setAttribute("memberLabelList", memberLabelService.getMemberLabelList(memberLabel));
        return "page/member/member-save";
    }

    /**
     * 修改页面
     *
     * @param request
     * @param session
     * @param member
     * @return
     */
    @RequestMapping("/member/update")
    public String update(HttpServletRequest request, HttpSession session, Member member) {
        request.setAttribute("pageTitle", "修改人员");
        //获取用户id
        Long userId = currentUserManager.getUserId();
        // 查询人员
        member.setUserId(userId);
        request.setAttribute("data", memberService.getMemberByIdAndUserId(member));
        // 查询人员标签列表
        MemberLabel memberLabel = new MemberLabel();
        memberLabel.setUserId(userId);
        request.setAttribute("memberLabelList", memberLabelService.getMemberLabelList(memberLabel));
        return "page/member/member-save";
    }

    /**
     * 保存数据
     *
     * @param member
     * @return
     */
    @RequestMapping("/member/ajax/save")
    @ResponseBody
    public ServerResponse ajaxSave(Member member, HttpSession session) {
        if (StringUtils.isBlank(member.getName())) {
            return ServerResponse.createByErrorMessage("请输入人员名称");
        }
        if (ObjectUtils.isNull(member.getMemberLabelId())) {
            return ServerResponse.createByErrorMessage("请选择人员标签");
        }
        member.setUserId(currentUserManager.getUserId());
        return memberService.saveMember(member);
    }

    /**
     * 删除数据
     *
     * @param ids
     * @return
     */
    @RequestMapping("/member/ajax/delete")
    @ResponseBody
    public ServerResponse ajaxDelete(@RequestParam List<Long> ids, HttpSession session) {
        if (ObjectUtils.isNull(ids)) {
            return ServerResponse.createByErrorMessage("请选择数据");
        }
        return memberService.deleteMemberByIdsAndUserId(ids, currentUserManager.getUserId());
    }

    /**
     * 下拉选列表
     *
     * @param request
     * @return
     */
    /*@RequestMapping("/member/ajax/content")
    public String ajaxList(HttpServletRequest request, HttpSession session) {
        Member member = new Member();
        member.setUserId(currentUserManager.getUserId());
        request.setAttribute("list", memberService.getMemberListPage(member));
        return "common/select-item";
    }*/
    /**
     * 下拉选列表
     *
     * @param member
     * @return
     */
    @RequestMapping("/member/ajax/content")
    @ResponseBody
    public ServerResponse ajaxList(Member member) {
        member.setUserId(currentUserManager.getUserId());
        PageInfo<Member> pageInfo = memberService.getMemberListPage(member);
        Map<String,Object> map = new HashMap<>();
        map.put("list",pageInfo.getList());
        map.put("pages",pageInfo.getPages());
        return ServerResponse.createBySuccess(map);    }
}
