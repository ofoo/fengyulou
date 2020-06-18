package com.guoguo.fengyulou.member.entity;

import com.guoguo.common.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 人员
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Member extends BaseEntity {
    /**
     * 人员姓名
     */
    private String name;
    /**
     * 人员标签id
     */
    private Long memberLabelId;
    /**
     * 人员手机号
     */
    private String mobile;
    /**
     * 用户id
     */
    private Long userId;

    /**
     * 人员标签名称
     */
    private String memberLabelName;
}
