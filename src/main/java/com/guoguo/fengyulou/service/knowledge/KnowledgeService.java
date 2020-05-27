package com.guoguo.fengyulou.service.knowledge;

import com.github.pagehelper.PageInfo;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.entity.knowledge.Knowledge;

import java.util.List;

public interface KnowledgeService {
    /**
     * 按条件查询
     *
     * @param knowledge
     * @return
     */
    List<Knowledge> getKnowledgeList(Knowledge knowledge);

    /**
     * 按条件分页查询
     *
     * @param knowledge
     * @return
     */
    PageInfo<Knowledge> getKnowledgeListPage(Knowledge knowledge);

    /**
     * 保存项目
     * @param knowledge
     * @return
     */
    ServerResponse saveKnowledge(Knowledge knowledge);

    /**
     * 按id和用户id查询
     * @param knowledge
     * @return
     */
    Knowledge getKnowledgeByIdAndUserId(Knowledge knowledge);

    /**
     * 按id和用户id删除
     * @param ids
     * @param userId
     * @return
     */
    ServerResponse deleteKnowledgeByIdsAndUserId(List<Long> ids, Long userId);
}
