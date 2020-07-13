package com.guoguo.fengyulou.task.controller;

import com.guoguo.common.CurrentUserManager;
import com.guoguo.common.SelectEntity;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.member.entity.Member;
import com.guoguo.fengyulou.project.entity.Project;
import com.guoguo.fengyulou.task.entity.Task;
import com.guoguo.fengyulou.task_label.entity.TaskLabel;
import com.guoguo.fengyulou.member.service.MemberService;
import com.guoguo.fengyulou.project.service.ProjectService;
import com.guoguo.fengyulou.task.service.TaskService;
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
import java.util.List;

/**
 * 任务管理
 */
@Controller
@RequestMapping("/fyl")
public class TaskController {

    @Autowired
    private TaskService taskService;
    @Autowired
    private TaskLabelService taskLabelService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private CurrentUserManager currentUserManager;

    /**
     * 列表页面
     *
     * @return
     */
    @RequestMapping("/task/list")
    public String list(HttpServletRequest request, HttpSession session, Task task) {
        task.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", taskService.getTaskListPage(task));
        request.setAttribute("data", task);
        return "page/task/task-list";
    }

    @RequestMapping("/task/ajax/list")
    public String ajaxList(HttpServletRequest request, HttpSession session, Task task) {
        task.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", taskService.getTaskListPage(task));
        request.setAttribute("data", task);
        return "page/task/task-list-ajax";
    }

    /**
     * 添加页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/task/insert")
    public String insert(HttpServletRequest request) {
        request.setAttribute("pageTitle", "添加任务");
        //获取用户id
        Long userId = currentUserManager.getUserId();
        // 查询项目列表
        Project project = new Project();
        project.setUserId(userId);
        request.setAttribute("projectList", projectService.getProjectList(project));
        // 查询任务标签列表
        TaskLabel taskLabel = new TaskLabel();
        taskLabel.setUserId(userId);
        request.setAttribute("taskLabelList", taskLabelService.getTaskLabelList(taskLabel));
        // 查询人员列表
        Member member = new Member();
        member.setUserId(userId);
        request.setAttribute("memberList", memberService.getMemberList(member));
        return "page/task/task-save";
    }

    /**
     * 修改页面
     *
     * @param request
     * @param session
     * @param task
     * @return
     */
    @RequestMapping("/task/update")
    public String update(HttpServletRequest request, HttpSession session, Task task) {
        request.setAttribute("pageTitle", "修改任务");
        //获取用户id
        Long userId = currentUserManager.getUserId();
        // 查询任务
        task.setUserId(userId);
        request.setAttribute("data", taskService.getTaskByIdAndUserId(task));
        // 查询项目列表
        Project project = new Project();
        project.setUserId(userId);
        request.setAttribute("projectList", projectService.getProjectList(project));
        // 查询任务标签列表
        TaskLabel taskLabel = new TaskLabel();
        taskLabel.setUserId(userId);
        request.setAttribute("taskLabelList", taskLabelService.getTaskLabelList(taskLabel));
        // 查询人员列表
        Member member = new Member();
        member.setUserId(userId);
        request.setAttribute("memberList", memberService.getMemberList(member));
        return "page/task/task-save";
    }

    /**
     * 保存数据
     *
     * @param task
     * @return
     */
    @RequestMapping("/task/ajax/save")
    @ResponseBody
    private ServerResponse ajaxSave(HttpSession session, Task task) {
        if (StringUtils.isBlank(task.getSketch())) {
            return ServerResponse.createByErrorMessage("请输入任务简述");
        }
        if (ObjectUtils.isNull(task.getProjectId())) {
            return ServerResponse.createByErrorMessage("请选择项目名称");
        }
        if (ObjectUtils.isNull(task.getTaskLabelId())) {
            return ServerResponse.createByErrorMessage("请选择任务标签");
        }
        if (ObjectUtils.isNull(task.getMemberId())) {
            return ServerResponse.createByErrorMessage("请选择执行人");
        }
        if (task.getStatus() == null || (task.getStatus() < 0 && task.getStatus() > 1)) {
            return ServerResponse.createByErrorMessage("请选择任务状态");
        }
        task.setUserId(currentUserManager.getUserId());
        return taskService.saveTask(task);
    }

    /**
     * 根据id删除
     *
     * @param ids
     * @return
     */
    @RequestMapping("/task/ajax/delete")
    @ResponseBody
    private ServerResponse ajaxDelete(@RequestParam List<Long> ids, HttpSession session) {
        if (ObjectUtils.isNull(ids)) {
            return ServerResponse.createByErrorMessage("请选择数据");
        }
        return taskService.deleteTaskByIdsAndUserId(ids, currentUserManager.getUserId());
    }

    /**
     * 修改任务状态完成
     */
    @RequestMapping("/task/ajax/updateStatus")
    @ResponseBody
    public ServerResponse ajaxUpdateStatus(@RequestParam List<Long> ids, HttpSession session) {
        return taskService.updateStatusByIdsAndUserId(ids, currentUserManager.getUserId());
    }

    /**
     * 获取任务项目
     *
     * @param project
     * @return
     */
    @RequestMapping("/task/ajax/project")
    @ResponseBody
    public SelectEntity ajaxTaskProject(Project project) {
        //获取数据
        project.setUserId(currentUserManager.getUserId());
        project = projectService.getProjectByIdAndUserId(project);
        //处理数据
        SelectEntity select = new SelectEntity();
        select.setValue(project.getId());
        select.setName(project.getName());
        return select;
    }

    /**
     * 获取任务标签
     *
     * @param taskLabel
     * @return
     */
    @RequestMapping("/task/ajax/label")
    @ResponseBody
    public SelectEntity ajaxTaskLabel(TaskLabel taskLabel) {
        //获取数据
        taskLabel.setUserId(currentUserManager.getUserId());
        taskLabel = taskLabelService.getTaskLabelByIdAndUserId(taskLabel);
        //处理数据
        SelectEntity select = new SelectEntity();
        select.setValue(taskLabel.getId());
        select.setName(taskLabel.getName());
        return select;
    }

    /**
     * 获取任务执行人
     *
     * @param member
     * @return
     */
    @RequestMapping("/task/ajax/member")
    @ResponseBody
    public SelectEntity ajaxTaskMember(Member member) {
        //获取数据
        member.setUserId(currentUserManager.getUserId());
        member = memberService.getMemberByIdAndUserId(member);
        //处理数据
        SelectEntity select = new SelectEntity();
        select.setValue(member.getId());
        select.setName(member.getName());
        return select;
    }
}
