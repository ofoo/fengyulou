package com.guoguo.fengyulou.dao.task.label;

import com.guoguo.fengyulou.entity.task.label.TaskLabel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TaskLabelDao {
    List<TaskLabel> getTaskLabelList(TaskLabel taskLabel);

    TaskLabel getTaskLabelById(@Param("id") Long id);

    int updateTaskLabelById(TaskLabel taskLabel);

    int getTaskLabelCountByName(@Param("name") String name);

    int insertTaskLabel(TaskLabel taskLabel);

    int deleteTaskLabelByIds(List<Long> ids);

    int getTaskLabelCountByTaskLabel(TaskLabel taskLabel);

    TaskLabel getTaskLabelByIdAndUserId(TaskLabel taskLabel);

    int updateTaskLabelByIdAndUserId(TaskLabel taskLabel);

    int getTaskLabelCountByNameAndUserId(TaskLabel taskLabel);

    int deleteTaskLabelByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);
}
