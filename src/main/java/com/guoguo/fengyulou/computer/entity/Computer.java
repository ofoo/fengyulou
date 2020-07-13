package com.guoguo.fengyulou.computer.entity;

import com.guoguo.common.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 云服务器
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Computer extends BaseEntity {
    /**
     * 项目id
     */
    private Long projectId;
    /**
     * 名称
     */
    private String name;
    /**
     * 主机
     */
    private String host;
    /**
     * 端口
     */
    private String port;
    /**
     * 账号
     */
    private String account;
    /**
     * 密码
     */
    private String password;
    /**
     * 用户id
     */
    private Long userId;

    /**
     * 项目名称
     */
    private String projectName;

}
