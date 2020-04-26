package com.guoguo.fengyulou.dao.member.label;

import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.entity.member.label.MemberLabel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemberLabelDao {
    List<MemberLabel> getMemberLabelList(MemberLabel memberLabel);

    MemberLabel getMemberLabelById(@Param("id") Long id);

    int deleteMemberLabelByIds(List<Long> ids);

    int getMemberLabelCountByMemberLabel(MemberLabel memberLabel);

    int updateMemberLabelById(MemberLabel memberLabel);

    int getMemberLabelCountByName(@Param("name") String name);

    int insertMemberLabel(MemberLabel memberLabel);

    MemberLabel getMemberLabelByIdAndUserId(MemberLabel memberLabel);

    int getMemberLabelCountByNameByUserId(MemberLabel memberLabel);

    int updateMemberLabelByIdAndUserId(MemberLabel memberLabel);

    int deleteMemberLabelByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);
}
