package com.guoguo.fengyulou.entity.knowledge;

import com.guoguo.common.BaseEntity;
import lombok.Data;

/**
 * 知识
 */
@Data
public class Knowledge extends BaseEntity {
    private Long id;
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
