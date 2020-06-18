package com.guoguo.fengyulou.user.entity;

import com.guoguo.common.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 用户
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class User extends BaseEntity {
    /**
     * 用户账号
     */
    private String loginName;
    /**
     * 用户密码
     */
    private String password;
    /**
     * 用户姓名
     */
    private String name;
    /**
     * 用户类型 0普通用户 1管理员
     */
    private Integer type;
}
