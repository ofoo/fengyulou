package com.guoguo.fengyulou.entity.user;

import lombok.Data;

/**
 * 用户
 */
@Data
public class User {
    private Long id;
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
     * 0正常 1删除
     */
    private Integer delete;
    /**
     * 用户类型 0普通用户 1管理员
     */
    private Integer type;

    /**
     * 页码
     */
    private Integer pageNum;
    /**
     * 每页条数
     */
    private Integer pageSize;
}
