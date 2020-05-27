package com.guoguo.fengyulou.entity.knowledge.instruct;

import com.guoguo.common.BaseEntity;
import lombok.Data;

/**
 * 指令
 */
@Data
public class Instruct extends BaseEntity {
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
     * 知识id
     */
    private String knowledgeId;
    /**
     * 用户id
     */
    private Long userId;

    /**
     * 知识名称
     */
    private String knowledgeName;
}