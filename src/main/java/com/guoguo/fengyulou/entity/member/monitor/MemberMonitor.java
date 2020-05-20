package com.guoguo.fengyulou.entity.member.monitor;

import com.guoguo.common.BaseEntity;
import lombok.Data;

/**
 * 人员监听
 */
@Data
public class MemberMonitor extends BaseEntity {
    private Long id;
    /**
     * 被监听人id
     */
    private Long userIdOne;
    /**
     * 人员id
     */
    private Long memberId;
    /**
     * 监听人id
     */
    private Long userIdTwo;

    /**
     * true选中/false未选中
     */
    private Boolean checked;
    /**
     * 被监听用户名称
     */
    private String userOneName;
    /**
     * 人员名称
     */
    private String memberName;
}
