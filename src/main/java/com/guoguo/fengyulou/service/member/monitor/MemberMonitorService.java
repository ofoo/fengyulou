package com.guoguo.fengyulou.service.member.monitor;

import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.entity.member.monitor.MemberMonitor;

import java.util.List;

public interface MemberMonitorService {

    /**
     * 保存数据
     *
     * @param memberMonitor
     * @return
     */
    ServerResponse saveMemberMonitor(MemberMonitor memberMonitor);

    /**
     * 按监听人id搜索列表
     * @param memberMonitor
     * @return
     */
    List<MemberMonitor> getMemberMonitorList(MemberMonitor memberMonitor);

    /**
     * 按被监听人id搜索
     * @param userIdOne
     * @return
     */
    List<MemberMonitor> getMemberMonitorListByUserIdOne(Long userIdOne);

    /**
     * 按被监听人id和人员id搜索
     * @param userIdOne
     * @param memberId
     * @return
     */
    List<MemberMonitor> getMemberMonitorListByUserIdOneAndMemberId(Long userIdOne, Long memberId);
}
