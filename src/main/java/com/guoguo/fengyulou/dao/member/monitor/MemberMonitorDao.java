package com.guoguo.fengyulou.dao.member.monitor;

import com.guoguo.fengyulou.entity.member.monitor.MemberMonitor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemberMonitorDao {
    List<MemberMonitor> getMemberMonitorList(MemberMonitor memberMonitor);

    int insertMemberMonitor(MemberMonitor memberMonitor);

    int getMemberMonitorCountByMemberMonitor(MemberMonitor memberMonitor);

    int updateMemberMonitorByIdAndUserId(MemberMonitor memberMonitor);

    int getMemberMonitorCountByMobileAndUserId(MemberMonitor memberMonitor);

    MemberMonitor getMemberMonitorByIdAndUserId(MemberMonitor memberMonitor);

    int deleteMemberMonitorByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);

    int deleteMemberMonitorByUserIdAndMemberId(MemberMonitor memberMonitor);
}
