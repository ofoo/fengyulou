package com.guoguo.fengyulou.service.impl.member.monitor;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guoguo.common.ResponseCode;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.dao.member.monitor.MemberMonitorDao;
import com.guoguo.fengyulou.entity.member.monitor.MemberMonitor;
import com.guoguo.fengyulou.service.member.monitor.MemberMonitorService;
import com.guoguo.util.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberMonitorServiceImpl implements MemberMonitorService {

    @Autowired
    private MemberMonitorDao memberMonitorDao;

    @Override
    public List<MemberMonitor> getMemberMonitorList(MemberMonitor memberMonitor) {
        return memberMonitorDao.getMemberMonitorList(memberMonitor);
    }

    @Override
    public PageInfo<MemberMonitor> getMemberMonitorListPage(MemberMonitor memberMonitor) {
        PageHelper.startPage(memberMonitor.getPageNum() == null ? 1 : memberMonitor.getPageNum(), memberMonitor.getPageSize() == null ? 10 : memberMonitor.getPageSize());
        List<MemberMonitor> list = memberMonitorDao.getMemberMonitorList(memberMonitor);
        PageInfo<MemberMonitor> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public ServerResponse saveMemberMonitor(MemberMonitor memberMonitor) {
        // 去除空格
        memberMonitor.setName(memberMonitor.getName().trim());
        memberMonitor.setMobile(memberMonitor.getMobile().trim());
        if (ObjectUtils.isNotNull(memberMonitor.getId())) {
            if (StringUtils.isNotBlank(memberMonitor.getMobile())) {
                // 验证数据是否重复
                int count = memberMonitorDao.getMemberMonitorCountByMemberMonitor(memberMonitor);
                if (count > 0) {
                    return ServerResponse.createByError(ResponseCode.EXIST);
                }
            }
            // 修改
            int rows = memberMonitorDao.updateMemberMonitorByIdAndUserId(memberMonitor);
            if (rows > 0) {
                return ServerResponse.createBySuccess();
            }
        } else {
            if (StringUtils.isNotBlank(memberMonitor.getMobile())) {
                // 验证数据是否重复
                int count = memberMonitorDao.getMemberMonitorCountByMobileAndUserId(memberMonitor);
                if (count > 0) {
                    return ServerResponse.createByError(ResponseCode.EXIST);
                }
            }
            // 添加
            int rows = memberMonitorDao.insertMemberMonitor(memberMonitor);
            if (rows > 0) {
                return ServerResponse.createBySuccess(memberMonitor.getId());
            }
        }
        return ServerResponse.createByError();
    }

    @Override
    public MemberMonitor getMemberMonitorByIdAndUserId(MemberMonitor memberMonitor) {
        return memberMonitorDao.getMemberMonitorByIdAndUserId(memberMonitor);
    }

    @Override
    public ServerResponse deleteMemberMonitorByIdsAndUserId(List<Long> ids, Long userId) {
        int rows = memberMonitorDao.deleteMemberMonitorByIdsAndUserId(ids, userId);
        if (rows > 0) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }
}
