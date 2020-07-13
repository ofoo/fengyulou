package com.guoguo.fengyulou.member_label.controller;

import com.github.pagehelper.PageInfo;
import com.guoguo.common.CurrentUserManager;
import com.guoguo.common.SelectEntity;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.member_label.entity.MemberLabel;
import com.guoguo.fengyulou.member_label.service.MemberLabelService;
import com.guoguo.util.ObjectUtils;
import com.guoguo.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 人员标签管理
 */
@Controller
@RequestMapping("/fyl")
public class MemberLabelController {

    @Autowired
    private MemberLabelService memberLabelService;
    @Autowired
    private CurrentUserManager currentUserManager;

    /**
     * 列表页面
     *
     * @param request
     * @param memberLabel
     * @return
     */
    @RequestMapping("/memberLabel/list")
    public String list(HttpServletRequest request, HttpSession session, MemberLabel memberLabel) {
        request.setAttribute("data", memberLabel);
        memberLabel.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", memberLabelService.getMemberLabelListPage(memberLabel));
        return "page/member_label/member-label-list";
    }

    @RequestMapping("/memberLabel/ajax/list")
    public String ajaxList(HttpServletRequest request, HttpSession session, MemberLabel memberLabel) {
        request.setAttribute("data", memberLabel);
        memberLabel.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", memberLabelService.getMemberLabelListPage(memberLabel));
        return "page/member_label/member-label-list-ajax";
    }

    /**
     * 添加页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/memberLabel/insert")
    public String insert(HttpServletRequest request, HttpSession session) {
        request.setAttribute("pageTitle", "添加人员标签");
        return "page/member_label/member-label-save";
    }

    /**
     * 修改页面
     *
     * @param request
     * @param session
     * @param memberLabel
     * @return
     */
    @RequestMapping("/memberLabel/update")
    public String update(HttpServletRequest request, HttpSession session, MemberLabel memberLabel) {
        request.setAttribute("pageTitle", "修改人员标签");
        // 查询人员标签
        memberLabel.setUserId(currentUserManager.getUserId());
        request.setAttribute("data", memberLabelService.getMemberLabelByIdAndUserId(memberLabel));
        return "page/member_label/member-label-save";
    }

    /**
     * 保存数据
     *
     * @param memberLabel
     * @return
     */
    @RequestMapping("/memberLabel/ajax/save")
    @ResponseBody
    public ServerResponse ajaxSave(MemberLabel memberLabel, HttpSession session) {
        if (StringUtils.isBlank(memberLabel.getName())) {
            return ServerResponse.createByErrorMessage("请输入人员标签名称");
        }
        memberLabel.setUserId(currentUserManager.getUserId());
        return memberLabelService.saveMemberLabel(memberLabel);
    }

    /**
     * 按id删除数据
     *
     * @param ids
     * @return
     */
    @RequestMapping("/memberLabel/ajax/delete")
    @ResponseBody
    public ServerResponse ajaxDelete(@RequestParam List<Long> ids, HttpSession session) {
        if (ObjectUtils.isNull(ids)) {
            return ServerResponse.createByErrorMessage("请选择数据");
        }
        return memberLabelService.deleteMemberLabelByIdsAndUserId(ids, currentUserManager.getUserId());
    }

    /**
     * 下拉选列表
     *
     * @param memberLabel
     * @return
     */
    @RequestMapping("/memberLabel/ajax/content")
    @ResponseBody
    public ServerResponse ajaxList(MemberLabel memberLabel) {
        //查询数据
        memberLabel.setUserId(currentUserManager.getUserId());
        PageInfo<MemberLabel> pageInfo = memberLabelService.getMemberLabelListPage(memberLabel);
        //处理数据
        List<SelectEntity> list = new ArrayList<>();
        for (MemberLabel p : pageInfo.getList()) {
            SelectEntity select = new SelectEntity();
            select.setValue(p.getId());
            select.setName(p.getName());
            list.add(select);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("pages", pageInfo.getPages());
        return ServerResponse.createBySuccess(map);
    }
}
