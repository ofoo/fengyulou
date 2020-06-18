package com.guoguo.fengyulou.service.member;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guoguo.common.ResponseCode;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.dao.member.MemberDao;
import com.guoguo.fengyulou.entity.member.Member;
import com.guoguo.fengyulou.service.member.MemberService;
import com.guoguo.util.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    private MemberDao memberDao;

    /**
     * 按条件查询
     * @param member
     * @return
     */
    public List<Member> getMemberList(Member member) {
        return memberDao.getMemberList(member);
    }

    /**
     * 按条件分页查询
     * @param member
     * @return
     */
    public PageInfo<Member> getMemberListPage(Member member) {
        PageHelper.startPage(member.getPageNum() == null ? 1 : member.getPageNum(), member.getPageSize() == null ? 10 : member.getPageSize());
        List<Member> list = memberDao.getMemberList(member);
        PageInfo<Member> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存数据
     * @param member
     * @return
     */
    public ServerResponse saveMember(Member member) {
        // 去除空格
        member.setName(member.getName().trim());
        member.setMobile(member.getMobile().trim());
        if (ObjectUtils.isNotNull(member.getId())) {
            if (StringUtils.isNotBlank(member.getMobile())) {
                // 验证数据是否重复
                int count = memberDao.getMemberCountByMember(member);
                if (count > 0) {
                    return ServerResponse.createByError(ResponseCode.EXIST);
                }
            }
            // 修改
            int rows = memberDao.updateMemberByIdAndUserId(member);
            if (rows > 0) {
                return ServerResponse.createBySuccess();
            }
        } else {
            if (StringUtils.isNotBlank(member.getMobile())) {
                // 验证数据是否重复
                int count = memberDao.getMemberCountByMobileAndUserId(member);
                if (count > 0) {
                    return ServerResponse.createByError(ResponseCode.EXIST);
                }
            }
            // 添加
            int rows = memberDao.insertMember(member);
            if (rows > 0) {
                return ServerResponse.createBySuccess(member.getId());
            }
        }
        return ServerResponse.createByError();
    }

    /**
     * 按id和用户id查询
     * @param member
     * @return
     */
    public Member getMemberByIdAndUserId(Member member) {
        return memberDao.getMemberByIdAndUserId(member);
    }

    /**
     * 按id和用户id删除
     * @param ids
     * @param userId
     * @return
     */
    public ServerResponse deleteMemberByIdsAndUserId(List<Long> ids, Long userId) {
        int rows = memberDao.deleteMemberByIdsAndUserId(ids, userId);
        if (rows > 0) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }
}
