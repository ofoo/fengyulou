package com.guoguo.fengyulou.controller.knowledge.instruct;

import com.guoguo.common.CurrentUserManager;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.entity.knowledge.Knowledge;
import com.guoguo.fengyulou.entity.knowledge.instruct.Instruct;
import com.guoguo.fengyulou.service.knowledge.KnowledgeService;
import com.guoguo.fengyulou.service.knowledge.instruct.InstructService;
import com.guoguo.util.ObjectUtils;
import com.guoguo.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 指令管理
 */
@Controller
@RequestMapping("/fyl")
public class InstructController {

    @Autowired
    private InstructService instructService;
    @Autowired
    private CurrentUserManager currentUserManager;
    @Autowired
    private KnowledgeService knowledgeService;

    /**
     * 列表页面
     *
     * @param request
     * @param instruct
     * @return
     */
    @RequestMapping("/instruct/list")
    public String list(HttpServletRequest request, Instruct instruct) {
        request.setAttribute("data", instruct);
        instruct.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", instructService.getInstructListPage(instruct));
        return "/knowledge/instruct/knowledge-instruct-list";
    }

    @RequestMapping("/instruct/ajax/list")
    public String ajaxList(HttpServletRequest request, Instruct instruct) {
        request.setAttribute("data", instruct);
        instruct.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", instructService.getInstructListPage(instruct));
        return "/knowledge/instruct/knowledge-instruct-list-ajax";
    }

    /**
     * 添加页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/instruct/insert")
    public String insert(HttpServletRequest request) {
        request.setAttribute("pageTitle", "添加指令");
        Knowledge knowledge = new Knowledge();
        knowledge.setUserId(currentUserManager.getUserId());
        request.setAttribute("knowledgeList", knowledgeService.getKnowledgeList(knowledge));
        return "knowledge/instruct/knowledge-instruct-save";
    }

    /**
     * 修改页面
     *
     * @param request
     * @param instruct
     * @return
     */
    @RequestMapping("/instruct/update")
    public String update(HttpServletRequest request, Instruct instruct) {
        request.setAttribute("pageTitle", "修改指令");
        //知识列表
        Knowledge knowledge = new Knowledge();
        knowledge.setUserId(currentUserManager.getUserId());
        request.setAttribute("knowledgeList", knowledgeService.getKnowledgeList(knowledge));
        // 查询人员标签
        instruct.setUserId(currentUserManager.getUserId());
        request.setAttribute("data", instructService.getInstructByIdAndUserId(instruct));
        return "knowledge/instruct/knowledge-instruct-save";
    }

    /**
     * 保存数据
     *
     * @param instruct
     * @return
     */
    @RequestMapping("/instruct/ajax/save")
    @ResponseBody
    public ServerResponse ajaxSave(Instruct instruct) {
        if (StringUtils.isBlank(instruct.getName())) {
            return ServerResponse.createByErrorMessage("请输入指令名称");
        }
        instruct.setUserId(currentUserManager.getUserId());
        return instructService.saveInstruct(instruct);
    }

    /**
     * 按id删除数据
     *
     * @param ids
     * @return
     */
    @RequestMapping("/instruct/ajax/delete")
    @ResponseBody
    public ServerResponse ajaxDelete(@RequestParam List<Long> ids) {
        if (ObjectUtils.isNull(ids)) {
            return ServerResponse.createByErrorMessage("请选择数据");
        }
        return instructService.deleteInstructByIdsAndUserId(ids, currentUserManager.getUserId());
    }
}
