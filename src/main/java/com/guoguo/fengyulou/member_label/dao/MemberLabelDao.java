package com.guoguo.fengyulou.member_label.dao;

import com.guoguo.fengyulou.member_label.entity.MemberLabel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MemberLabelDao {
    List<MemberLabel> getMemberLabelList(MemberLabel memberLabel);

    int getMemberLabelCountByMemberLabel(MemberLabel memberLabel);

    int insertMemberLabel(MemberLabel memberLabel);

    MemberLabel getMemberLabelByIdAndUserId(MemberLabel memberLabel);

    int getMemberLabelCountByNameByUserId(MemberLabel memberLabel);

    int updateMemberLabelByIdAndUserId(MemberLabel memberLabel);

    int deleteMemberLabelByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);
}
