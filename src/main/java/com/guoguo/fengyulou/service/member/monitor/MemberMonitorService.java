package com.guoguo.fengyulou.service.member.monitor;

import com.github.pagehelper.PageInfo;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.entity.member.monitor.MemberMonitor;

import java.util.List;

public interface MemberMonitorService {
    /**
     * 按条件查询
     *
     * @param memberMonitor
     * @return
     */
    List<MemberMonitor> getMemberMonitorList(MemberMonitor memberMonitor);

    /**
     * 按条件分页查询
     *
     * @param memberMonitor
     * @return
     */
    PageInfo<MemberMonitor> getMemberMonitorListPage(MemberMonitor memberMonitor);

    /**
     * 保存数据
     *
     * @param memberMonitor
     * @return
     */
    ServerResponse saveMemberMonitor(MemberMonitor memberMonitor);

    /**
     * 按id和用户id查询
     *
     * @param memberMonitor
     * @return
     */
    MemberMonitor getMemberMonitorByIdAndUserId(MemberMonitor memberMonitor);

    /**
     * 按id和用户id删除
     *
     * @param ids
     * @param userId
     * @return
     */
    ServerResponse deleteMemberMonitorByIdsAndUserId(List<Long> ids, Long userId);
}
