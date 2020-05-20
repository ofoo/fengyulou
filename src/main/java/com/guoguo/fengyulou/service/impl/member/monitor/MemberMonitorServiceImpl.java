package com.guoguo.fengyulou.service.impl.member.monitor;

import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.dao.member.monitor.MemberMonitorDao;
import com.guoguo.fengyulou.entity.member.monitor.MemberMonitor;
import com.guoguo.fengyulou.service.member.monitor.MemberMonitorService;
import com.guoguo.util.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberMonitorServiceImpl implements MemberMonitorService {

    @Autowired
    private MemberMonitorDao memberMonitorDao;

    @Override
    public ServerResponse saveMemberMonitor(MemberMonitor memberMonitor) {
        if (memberMonitor.getChecked()) {
            MemberMonitor updateMemberMonitor = memberMonitorDao.getMemberMonitorByUserTwoIdAndMemberId(memberMonitor);
            if (ObjectUtils.isNotNull(updateMemberMonitor)) {
                //修改
                int rows = memberMonitorDao.updateMemberMonitor(updateMemberMonitor);
                if (rows > 0) {
                    return ServerResponse.createBySuccess();
                }
            } else {
                //添加
                int rows = memberMonitorDao.insertMemberMonitor(memberMonitor);
                if (rows > 0) {
                    return ServerResponse.createBySuccess();
                }
            }
        } else {
            //删除
            int rows = memberMonitorDao.deleteMemberMonitorByUserIdTwoAndMemberId(memberMonitor);
            if (rows > 0) {
                return ServerResponse.createBySuccess();
            }
        }
        return ServerResponse.createByError();
    }

    @Override
    public List<MemberMonitor> getMemberMonitorList(MemberMonitor memberMonitor) {
        return memberMonitorDao.getMemberMonitorList(memberMonitor);
    }

    @Override
    public List<MemberMonitor> getMemberMonitorListByUserIdOne(Long userIdOne) {
        return memberMonitorDao.getMemberMonitorListByUserIdOne(userIdOne);
    }

    @Override
    public List<MemberMonitor> getMemberMonitorListByUserIdOneAndMemberId(Long userIdOne, Long memberId) {
        return memberMonitorDao.getMemberMonitorListByUserIdOneAndMemberId(userIdOne,memberId);
    }
}
