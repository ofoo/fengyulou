package com.guoguo.fengyulou.service.project;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guoguo.common.ResponseCode;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.dao.project.ProjectDao;
import com.guoguo.fengyulou.entity.project.Project;
import com.guoguo.util.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 项目
 */
@Service
public class ProjectService {

    @Autowired
    private ProjectDao projectDao;

    /**
     * 按条件查询
     * @param project
     * @return
     */
    public List<Project> getProjectList(Project project) {
        return projectDao.getProjectList(project);
    }

    /**
     * 按条件分页查询
     * @param project
     * @return
     */
    public PageInfo<Project> getProjectListPage(Project project) {
        PageHelper.startPage(project.getPageNum() == null ? 1 : project.getPageNum(), project.getPageSize() == null ? 10 : project.getPageSize());
        List<Project> list = projectDao.getProjectList(project);
        PageInfo<Project> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存项目
     * @param project
     * @return
     */
    public ServerResponse saveProject(Project project) {
        // 去除空格
        project.setName(project.getName().trim());
        if (ObjectUtils.isNotNull(project.getId())) {
            // 验证数据是否重复
            int count = projectDao.getProjectCountByProject(project);
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }
            // 修改
            int rows = projectDao.updateProjectByIdAndUserId(project);
            if (rows > 0) {
                return ServerResponse.createBySuccess();
            }
        } else {
            // 验证数据是否重复
            int count = projectDao.getProjectCountByNameAndUserId(project);
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }
            // 添加
            int rows = projectDao.insertProject(project);
            if (rows > 0) {
                return ServerResponse.createBySuccess(project.getId());
            }
        }
        return ServerResponse.createByError();
    }

    /**
     * 按id和用户id查询
     * @param project
     * @return
     */
    public Project getProjectByIdAndUserId(Project project) {
        if (ObjectUtils.isNull(project.getId())) {
            return null;
        }
        return projectDao.getProjectByIdAndUserId(project);
    }

    /**
     * 按id和用户id删除
     * @param ids
     * @param userId
     * @return
     */
    public ServerResponse deleteProjectByIdsAndUserId(List<Long> ids, Long userId) {
        int rows = projectDao.deleteProjectByIdsAndUserId(ids, userId);
        if (rows > 0) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }
}
