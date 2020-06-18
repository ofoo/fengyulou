package com.guoguo.fengyulou.knowledge.entity;

import com.guoguo.common.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 知识
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Knowledge extends BaseEntity {
    /**
     * 名称
     */
    private String name;
    /**
     * 简述
     */
    private String sketch;
    /**
     * 用户id
     */
    private Long userId;
}
