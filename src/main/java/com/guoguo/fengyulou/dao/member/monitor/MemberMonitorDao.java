package com.guoguo.fengyulou.dao.member.monitor;

import com.guoguo.fengyulou.entity.member.monitor.MemberMonitor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemberMonitorDao {
    List<MemberMonitor> getMemberMonitorList(MemberMonitor memberMonitor);

    int insertMemberMonitor(MemberMonitor memberMonitor);

    int deleteMemberMonitorByUserIdTwoAndMemberId(MemberMonitor memberMonitor);

    MemberMonitor getMemberMonitorByUserTwoIdAndMemberId(MemberMonitor memberMonitor);

    int updateMemberMonitor(MemberMonitor memberMonitor);

    List<MemberMonitor> getMemberMonitorListByUserIdOne(@Param("userIdOne") Long userIdOne);

    List<MemberMonitor> getMemberMonitorListByUserIdOneAndMemberId(@Param("userIdOne") Long userIdOne, @Param("memberId") Long memberId);
}
