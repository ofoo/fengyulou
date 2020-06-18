package com.guoguo.fengyulou.service.task;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.dao.task.TaskDao;
import com.guoguo.fengyulou.entity.task.Task;
import com.guoguo.fengyulou.service.task.TaskService;
import com.guoguo.util.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService {

    @Autowired
    private TaskDao taskDao;

    /**
     * 按条件查询查询
     * @param task
     * @return
     */
    public List<Task> getTaskList(Task task) {
        return taskDao.getTaskList(task);
    }

    /**
     * 按条件分页查询
     * @param task
     * @return
     */
    public PageInfo<Task> getTaskListPage(Task task) {
        PageHelper.startPage(task.getPageNum() == null ? 1 : task.getPageNum(), task.getPageSize() == null ? 10 : task.getPageSize());
        List<Task> list = taskDao.getTaskList(task);
        PageInfo<Task> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存数据
     * @param task
     * @return
     */
    public ServerResponse saveTask(Task task) {
        // 去除空格
        task.setSketch(task.getSketch().trim());
        if (ObjectUtils.isNotNull(task.getId())) {
            // 按id修改数据
            int rows = taskDao.updateTaskByIdAndUserId(task);
            if (rows > 0) {
                return ServerResponse.createBySuccess();
            }
        } else {
            // 添加数据
            int rows = taskDao.insertTask(task);
            if (rows > 0) {
                return ServerResponse.createBySuccess(task.getId());
            }
        }
        return ServerResponse.createByError();
    }

    /**
     * 按id和用户id查询
     * @param task
     * @return
     */
    public Task getTaskByIdAndUserId(Task task) {
        if (ObjectUtils.isNull(task.getId())) {
            return null;
        }
        return taskDao.getTaskByIdAndUserId(task);
    }

    /**
     * 按id和用户删除
     * @param ids
     * @param userId
     * @return
     */
    public ServerResponse deleteTaskByIdsAndUserId(List<Long> ids, Long userId) {
        int rows = taskDao.deleteTaskByIdsAndUserId(ids, userId);
        if (rows > 0) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }

    /**
     * 按id和用户id修改任务状态
     * @param ids
     * @param userId
     * @return
     */
    public ServerResponse updateStatusByIdsAndUserId(List<Long> ids, Long userId) {
        int rows = taskDao.updateStatusByIdsAndUserId(ids, userId);
        if (rows > 0) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }
}
