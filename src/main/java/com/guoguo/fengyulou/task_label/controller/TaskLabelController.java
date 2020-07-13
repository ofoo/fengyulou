package com.guoguo.fengyulou.task_label.controller;

import com.github.pagehelper.PageInfo;
import com.guoguo.common.CurrentUserManager;
import com.guoguo.common.SelectEntity;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.task_label.entity.TaskLabel;
import com.guoguo.fengyulou.task_label.service.TaskLabelService;
import com.guoguo.util.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
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
 * 任务标签标签管理
 */
@Controller
@RequestMapping("/fyl")
public class TaskLabelController {

    @Autowired
    private TaskLabelService taskLabelService;
    @Autowired
    private CurrentUserManager currentUserManager;

    /**
     * 列表页面
     *
     * @param request
     * @param taskLabel
     * @return
     */
    @RequestMapping("/taskLabel/list")
    public String list(HttpServletRequest request, HttpSession session, TaskLabel taskLabel) {
        taskLabel.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", taskLabelService.getTaskLabelListPage(taskLabel));
        request.setAttribute("data", taskLabel);
        return "page/task_label/task-label-list";
    }

    @RequestMapping("/taskLabel/ajax/list")
    public String ajaxList(HttpServletRequest request, HttpSession session, TaskLabel taskLabel) {
        taskLabel.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", taskLabelService.getTaskLabelListPage(taskLabel));
        request.setAttribute("data", taskLabel);
        return "page/task_label/task-label-list-ajax";
    }

    /**
     * 添加页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/taskLabel/insert")
    public String insert(HttpServletRequest request, HttpSession session) {
        request.setAttribute("pageTitle", "添加任务标签");
        return "page/task_label/task-label-save";
    }

    /**
     * 修改页面
     *
     * @param request
     * @param session
     * @param taskLabel
     * @return
     */
    @RequestMapping("/taskLabel/update")
    public String update(HttpServletRequest request, HttpSession session, TaskLabel taskLabel) {
        request.setAttribute("pageTitle", "修改任务标签");
        // 查询任务标签
        taskLabel.setUserId(currentUserManager.getUserId());
        request.setAttribute("data", taskLabelService.getTaskLabelByIdAndUserId(taskLabel));
        return "page/task_label/task-label-save";
    }

    /**
     * 保存数据
     *
     * @param taskLabel
     * @return
     */
    @RequestMapping("/taskLabel/ajax/save")
    @ResponseBody
    public ServerResponse ajaxSave(TaskLabel taskLabel, HttpSession session) {
        if (StringUtils.isBlank(taskLabel.getName())) {
            return ServerResponse.createByErrorMessage("请输入任务标签名称");
        }
        taskLabel.setUserId(currentUserManager.getUserId());
        return taskLabelService.saveTaskLabel(taskLabel);
    }

    /**
     * 删除数据
     *
     * @param ids
     * @return
     */
    @RequestMapping("/taskLabel/ajax/delete")
    @ResponseBody
    public ServerResponse ajaxDelete(@RequestParam List<Long> ids, HttpSession session) {
        if (ObjectUtils.isNull(ids)) {
            return ServerResponse.createByErrorMessage("请选择数据");
        }
        return taskLabelService.deleteTaskLabelByIdsAndUserId(ids, currentUserManager.getUserId());
    }

    /**
     * 下拉选子项
     *
     * @return
     */
    /*@RequestMapping("/taskLabel/ajax/content")
    public String ajaxList(HttpServletRequest request, HttpSession session) {
        TaskLabel taskLabel = new TaskLabel();
        taskLabel.setUserId(currentUserManager.getUserId());
        request.setAttribute("list", taskLabelService.getTaskLabelList(taskLabel));
        return "/common/select-item";
    }*/

    /**
     * 下拉选子项
     *
     * @return
     */
    @RequestMapping("/taskLabel/ajax/content")
    @ResponseBody
    public ServerResponse ajaxList(TaskLabel taskLabel) {
        //查询数据
        taskLabel.setUserId(currentUserManager.getUserId());
        PageInfo<TaskLabel> pageInfo = taskLabelService.getTaskLabelListPage(taskLabel);
        //处理数据
        List<SelectEntity> list = new ArrayList<>();
        for (TaskLabel p : pageInfo.getList()) {
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

