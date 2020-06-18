package com.guoguo.fengyulou.member_label.entity;

import com.guoguo.common.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 人员列表
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MemberLabel extends BaseEntity {
    /**
     * 名称
     */
    private String name;
    /**
     * 用户id
     */
    private Long userId;
}
