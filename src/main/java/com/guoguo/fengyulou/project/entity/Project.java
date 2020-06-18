package com.guoguo.fengyulou.project.entity;

import com.guoguo.common.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 项目
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Project extends BaseEntity {
    /**
     * 名称
     */
    private String name;
    /**
     * 用户id
     */
    private Long userId;
}
