package com.guoguo.fengyulou.knowledge_instruct.entity;

import com.guoguo.common.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 指令
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Instruct extends BaseEntity {
    /**
     * 名称
     */
    private String name;
    /**
     * 简述
     */
    private String sketch;
    /**
     * 知识id
     */
    private Long knowledgeId;
    /**
     * 用户id
     */
    private Long userId;

    /**
     * 知识名称
     */
    private String knowledgeName;
}
