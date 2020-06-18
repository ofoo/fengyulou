package com.guoguo.fengyulou.member.dao;

import com.guoguo.fengyulou.member.entity.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MemberDao {
    List<Member> getMemberList(Member member);

    int insertMember(Member member);

    int getMemberCountByMember(Member member);

    int updateMemberByIdAndUserId(Member member);

    int getMemberCountByMobileAndUserId(Member member);

    Member getMemberByIdAndUserId(Member member);

    int deleteMemberByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);
}
