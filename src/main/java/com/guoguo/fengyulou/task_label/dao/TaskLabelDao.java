package com.guoguo.fengyulou.task_label.dao;

import com.guoguo.fengyulou.task_label.entity.TaskLabel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TaskLabelDao {
    List<TaskLabel> getTaskLabelList(TaskLabel taskLabel);

    int insertTaskLabel(TaskLabel taskLabel);

    int getTaskLabelCountByTaskLabel(TaskLabel taskLabel);

    TaskLabel getTaskLabelByIdAndUserId(TaskLabel taskLabel);

    int updateTaskLabelByIdAndUserId(TaskLabel taskLabel);

    int getTaskLabelCountByNameAndUserId(TaskLabel taskLabel);

    int deleteTaskLabelByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);
}
