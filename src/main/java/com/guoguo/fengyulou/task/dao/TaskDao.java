package com.guoguo.fengyulou.task.dao;

import com.guoguo.fengyulou.task.entity.Task;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TaskDao {
    List<Task> getTaskList(Task task);

    int insertTask(Task task);

    Task getTaskByIdAndUserId(Task task);

    int updateTaskByIdAndUserId(Task task);

    int deleteTaskByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);

    int updateStatusByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);
}
