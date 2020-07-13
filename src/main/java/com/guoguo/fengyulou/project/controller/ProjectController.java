package com.guoguo.fengyulou.project.controller;

import com.github.pagehelper.PageInfo;
import com.guoguo.common.CurrentUserManager;
import com.guoguo.common.SelectEntity;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.project.entity.Project;
import com.guoguo.fengyulou.project.service.ProjectService;
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
 * 项目管理
 */
@Controller
@RequestMapping("/fyl")
public class ProjectController {

    @Autowired
    private ProjectService projectService;
    @Autowired
    private CurrentUserManager currentUserManager;

    /**
     * 列表页面
     *
     * @return
     */
    @RequestMapping("/project/list")
    public String list(HttpServletRequest request, HttpSession session, Project project) {
        project.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", projectService.getProjectListPage(project));
        request.setAttribute("data", project);
        return "page/project/project-list";
    }

    @RequestMapping("/project/ajax/list")
    public String ajaxList(HttpServletRequest request, HttpSession session, Project project) {
        project.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", projectService.getProjectListPage(project));
        request.setAttribute("data", project);
        return "page/project/project-list-ajax";
    }

    /**
     * 添加页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/project/insert")
    public String insert(HttpServletRequest request, HttpSession session) {
        request.setAttribute("pageTitle", "添加项目");
        return "page/project/project-save";
    }

    /**
     * 修改页面
     *
     * @param request
     * @param session
     * @param project
     * @return
     */
    @RequestMapping("/project/update")
    public String update(HttpServletRequest request, HttpSession session, Project project) {
        request.setAttribute("pageTitle", "修改项目");
        // 查询项目
        project.setUserId(currentUserManager.getUserId());
        request.setAttribute("data", projectService.getProjectByIdAndUserId(project));
        return "page/project/project-save";
    }

    /**
     * 保存数据
     *
     * @param project
     * @return
     */
    @RequestMapping("/project/ajax/save")
    @ResponseBody
    public ServerResponse ajaxSave(Project project, HttpSession session) {
        if (StringUtils.isBlank(project.getName())) {
            return ServerResponse.createByErrorMessage("请输入项目名称");
        }
        project.setUserId(currentUserManager.getUserId());
        return projectService.saveProject(project);
    }

    /**
     * 删除数据
     *
     * @param ids
     * @return
     */
    @RequestMapping("/project/ajax/delete")
    @ResponseBody
    public ServerResponse ajaxDelete(@RequestParam List<Long> ids, HttpSession session) {
        if (ObjectUtils.isNull(ids)) {
            return ServerResponse.createByErrorMessage("请选择数据");
        }
        return projectService.deleteProjectByIdsAndUserId(ids, currentUserManager.getUserId());
    }

    /**
     * 下拉选列表
     *
     * @param project
     * @return
     */
    @RequestMapping("/project/ajax/content")
    @ResponseBody
    public ServerResponse ajaxList(Project project) {
        //查询数据
        project.setUserId(currentUserManager.getUserId());
        PageInfo<Project> pageInfo = projectService.getProjectListPage(project);
        //处理数据
        List<SelectEntity> list = new ArrayList<>();
        for (Project p : pageInfo.getList()) {
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
