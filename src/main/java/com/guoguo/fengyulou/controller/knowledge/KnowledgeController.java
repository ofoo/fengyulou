package com.guoguo.fengyulou.controller.knowledge;

import com.guoguo.common.CurrentUserManager;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.entity.knowledge.Knowledge;
import com.guoguo.fengyulou.service.knowledge.KnowledgeService;
import com.guoguo.util.ObjectUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 项目管理
 */
@Controller
@RequestMapping("/fyl")
@Slf4j
public class KnowledgeController {

    @Autowired
    private KnowledgeService knowledgeService;
    @Autowired
    private CurrentUserManager currentUserManager;

    /**
     * 列表页面
     *
     * @return
     */
    @RequestMapping("/knowledge/list")
    public String list(HttpServletRequest request, Knowledge knowledge) {
        knowledge.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", knowledgeService.getKnowledgeListPage(knowledge));
        request.setAttribute("data", knowledge);
        return "knowledge/knowledge-list";
    }

    @RequestMapping("/knowledge/ajax/list")
    public String ajaxList(HttpServletRequest request, Knowledge knowledge) {
        knowledge.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", knowledgeService.getKnowledgeListPage(knowledge));
        request.setAttribute("data", knowledge);
        return "knowledge/knowledge-list-ajax";
    }

    /**
     * 添加页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/knowledge/insert")
    public String insert(HttpServletRequest request) {
        request.setAttribute("pageTitle", "添加知识");
        return "knowledge/knowledge-save";
    }

    /**
     * 修改页面
     *
     * @param request
     * @param knowledge
     * @return
     */
    @RequestMapping("/knowledge/update")
    public String update(HttpServletRequest request, Knowledge knowledge) {
        request.setAttribute("pageTitle", "修改知识");
        // 查询项目
        knowledge.setUserId(currentUserManager.getUserId());
        request.setAttribute("data", knowledgeService.getKnowledgeByIdAndUserId(knowledge));
        return "knowledge/knowledge-save";
    }

    /**
     * 保存数据
     *
     * @param knowledge
     * @return
     */
    @RequestMapping("/knowledge/ajax/save")
    @ResponseBody
    public ServerResponse ajaxSave(Knowledge knowledge) {
        if (StringUtils.isBlank(knowledge.getName())) {
            return ServerResponse.createByErrorMessage("请输入知识名称");
        }
        knowledge.setUserId(currentUserManager.getUserId());
        return knowledgeService.saveKnowledge(knowledge);
    }

    /**
     * 删除数据
     *
     * @param ids
     * @return
     */
    @RequestMapping("/knowledge/ajax/delete")
    @ResponseBody
    public ServerResponse ajaxDelete(@RequestParam List<Long> ids) {
        if (ObjectUtils.isNull(ids)) {
            return ServerResponse.createByErrorMessage("请选择数据");
        }
        return knowledgeService.deleteKnowledgeByIdsAndUserId(ids, currentUserManager.getUserId());
    }

    /**
     * 下拉选列表
     *
     * @param request
     * @return
     */
    @RequestMapping("/knowledge/ajax/content")
    public String ajaxList(HttpServletRequest request) {
        Knowledge knowledge = new Knowledge();
        knowledge.setUserId(currentUserManager.getUserId());
        request.setAttribute("list", knowledgeService.getKnowledgeList(knowledge));
        return "common/select-item";
    }
}
