package com.guoguo.fengyulou.member_label.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guoguo.common.ResponseCode;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.member_label.dao.MemberLabelDao;
import com.guoguo.fengyulou.member_label.entity.MemberLabel;
import com.guoguo.util.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberLabelService {

    @Autowired
    private MemberLabelDao memberLabelDao;

    /**
     * 按条件查询
     * @param memberLabel
     * @return
     */
    public List<MemberLabel> getMemberLabelList(MemberLabel memberLabel) {
        return memberLabelDao.getMemberLabelList(memberLabel);
    }

    /**
     * 按条件分页查询
     * @param memberLabel
     * @return
     */
    public PageInfo<MemberLabel> getMemberLabelListPage(MemberLabel memberLabel) {
        PageHelper.startPage(memberLabel.getPageNum() == null ? 1 : memberLabel.getPageNum(), memberLabel.getPageSize() == null ? 10 : memberLabel.getPageSize());
        List<MemberLabel> list = memberLabelDao.getMemberLabelList(memberLabel);
        PageInfo<MemberLabel> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存数据
     * @param memberLabel
     * @return
     */
    public ServerResponse saveMemberLabel(MemberLabel memberLabel) {
        // 去除空格
        memberLabel.setName(memberLabel.getName().trim());
        if (ObjectUtils.isNotNull(memberLabel.getId())) {
            // 检查数据是否重复
            int count = memberLabelDao.getMemberLabelCountByMemberLabel(memberLabel);
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }
            // 修改
            int rows = memberLabelDao.updateMemberLabelByIdAndUserId(memberLabel);
            if (rows > 0) {
                return ServerResponse.createBySuccess();
            }
        } else {
            // 检查数据是否重复
            int count = memberLabelDao.getMemberLabelCountByNameByUserId(memberLabel);
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }
            // 添加
            int rows = memberLabelDao.insertMemberLabel(memberLabel);
            if (rows > 0) {
                return ServerResponse.createBySuccess(memberLabel.getId());
            }
        }
        return ServerResponse.createByError();
    }

    /**
     * 按id和用户id查询
     * @param memberLabel
     * @return
     */
    public MemberLabel getMemberLabelByIdAndUserId(MemberLabel memberLabel) {
        if (ObjectUtils.isNull(memberLabel.getId())) {
            return null;
        }
        return memberLabelDao.getMemberLabelByIdAndUserId(memberLabel);
    }

    /**
     * 按id和用户id删除
     * @param ids
     * @param userId
     * @return
     */
    public ServerResponse deleteMemberLabelByIdsAndUserId(List<Long> ids, Long userId) {
        int rows = memberLabelDao.deleteMemberLabelByIdsAndUserId(ids, userId);
        if (rows > 0) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }
}
