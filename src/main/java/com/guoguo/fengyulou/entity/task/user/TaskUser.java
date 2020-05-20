package com.guoguo.fengyulou.entity.task.user;

import com.guoguo.common.BaseEntity;
import lombok.Data;

/**
 * 任务用户
 */
@Data
public class TaskUser extends BaseEntity {
    private Long id;
    /**
     * 人员id
     */
    private Long taskId;
    /**
     * 用户id
     */
    private Long userId;
    /**
     * 0正常 1禁用（其他用户创建的任务，不可以修改，只可以修改任务状态）
     */
    private Integer disabled;
}
