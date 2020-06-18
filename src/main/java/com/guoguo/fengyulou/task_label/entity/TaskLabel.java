package com.guoguo.fengyulou.task_label.entity;

import com.guoguo.common.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 任务标签
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TaskLabel extends BaseEntity {
    /**
     * 名称
     */
    private String name;
    /**
     * 用户id
     */
    private Long userId;
}
