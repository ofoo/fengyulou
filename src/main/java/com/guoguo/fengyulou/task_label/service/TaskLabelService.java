package com.guoguo.fengyulou.task_label.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guoguo.common.ResponseCode;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.task_label.dao.TaskLabelDao;
import com.guoguo.fengyulou.task_label.entity.TaskLabel;
import com.guoguo.util.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskLabelService {

    @Autowired
    private TaskLabelDao taskLabelDao;

    /**
     * 按条件查询
     * @param taskLabel
     * @return
     */
    public List<TaskLabel> getTaskLabelList(TaskLabel taskLabel) {
        return taskLabelDao.getTaskLabelList(taskLabel);
    }

    /**
     * 按条件分页查询
     * @param taskLabel
     * @return
     */
    public PageInfo<TaskLabel> getTaskLabelListPage(TaskLabel taskLabel) {
        PageHelper.startPage(taskLabel.getPageNum() == null ? 1 : taskLabel.getPageNum(), taskLabel.getPageSize() == null ? 10 : taskLabel.getPageSize());
        List<TaskLabel> list = taskLabelDao.getTaskLabelList(taskLabel);
        PageInfo<TaskLabel> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存数据
     * @param taskLabel
     * @return
     */
    public ServerResponse saveTaskLabel(TaskLabel taskLabel) {
        // 去除空格
        taskLabel.setName(taskLabel.getName().trim());
        if (ObjectUtils.isNotNull(taskLabel.getId())) {
            // 验证数据是否重复
            int count = taskLabelDao.getTaskLabelCountByTaskLabel(taskLabel);
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }
            // 修改
            int rows = taskLabelDao.updateTaskLabelByIdAndUserId(taskLabel);
            if (rows > 0) {
                return ServerResponse.createBySuccess();
            }
        } else {
            // 验证数据是否重复
            int count = taskLabelDao.getTaskLabelCountByNameAndUserId(taskLabel);
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }
            // 添加
            int rows = taskLabelDao.insertTaskLabel(taskLabel);
            if (rows > 0) {
                return ServerResponse.createBySuccess(taskLabel.getId());
            }
        }
        return ServerResponse.createByError();
    }

    /**
     * 按id和用户id查询
     * @param taskLabel
     * @return
     */
    public TaskLabel getTaskLabelByIdAndUserId(TaskLabel taskLabel) {
        if (ObjectUtils.isNull(taskLabel.getId())) {
            return null;
        }
        return taskLabelDao.getTaskLabelByIdAndUserId(taskLabel);
    }

    /**
     * 按id和用户id删除
     * @param ids
     * @param userId
     * @return
     */
    public ServerResponse deleteTaskLabelByIdsAndUserId(List<Long> ids, Long userId) {
        int rows = taskLabelDao.deleteTaskLabelByIdsAndUserId(ids, userId);
        if (rows > 0) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }
}