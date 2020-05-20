package com.guoguo.fengyulou.entity.user;

import com.guoguo.common.BaseEntity;
import com.guoguo.fengyulou.entity.member.Member;
import lombok.Data;

import java.util.List;

/**
 * 用户和人员
 */
@Data
public class UserMember {
    private Long id;
    /**
     * 节点名称
     */
    private String name;
    /**
     * 子节点集合
     */
    private List<UserMember> children;
    /**
     * 设置节点是否隐藏 checkbox / radio [setting.check.enable = true 时有效]
     */
    private boolean nocheck;
}
