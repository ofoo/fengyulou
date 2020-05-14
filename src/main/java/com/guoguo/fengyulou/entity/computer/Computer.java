package com.guoguo.fengyulou.entity.computer;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 云服务器
 */
@Data
public class Computer {
    private Long id;
    /**
     * 项目id
     */
    private Long projectId;
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
     * 0正常 1删除
     */
    private Integer delete;
    /**
     * 用户id
     */
    private Long userId;

    /**
     * 页码
     */
    private Integer pageNum;
    /**
     * 每页条数
     */
    private Integer pageSize;
    /**
     * 项目名称
     */
    private String projectName;

}
