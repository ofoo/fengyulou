package com.guoguo.fengyulou.dao.task.user;

import com.guoguo.fengyulou.entity.task.user.TaskUser;

import java.util.List;

public interface TaskUserDao {

    int insertTaskUserBatch(List<TaskUser> taskUserList);
}
