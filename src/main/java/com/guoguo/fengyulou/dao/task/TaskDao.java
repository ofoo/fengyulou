package com.guoguo.fengyulou.dao.task;

import com.guoguo.fengyulou.entity.task.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TaskDao {
    List<Task> getTaskList(Task task);

    int deleteTaskByIds(List<Long> ids);

    Task getTaskById(@Param("id") Long id);

    int updateTaskById(Task task);

    int insertTask(Task task);

    int updateStatusByIds(List<Long> ids);

    Task getTaskByIdAndUserId(Task task);

    int updateTaskByIdAndUserId(Task task);

    int deleteTaskByIdsAndUserId(List<Long> ids, Long userId);

    int updateStatusByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);
}
