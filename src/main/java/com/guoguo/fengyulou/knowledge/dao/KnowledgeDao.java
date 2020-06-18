package com.guoguo.fengyulou.knowledge.dao;

import com.guoguo.fengyulou.knowledge.entity.Knowledge;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface KnowledgeDao {
    List<Knowledge> getKnowledgeList(Knowledge knowledge);

    int insertKnowledge(Knowledge knowledge);

    int getKnowledgeCountByKnowledge(Knowledge knowledge);

    Knowledge getKnowledgeByIdAndUserId(Knowledge knowledge);

    int updateKnowledgeByIdAndUserId(Knowledge knowledge);

    int getKnowledgeCountByNameAndUserId(Knowledge knowledge);

    int deleteKnowledgeByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);
}
