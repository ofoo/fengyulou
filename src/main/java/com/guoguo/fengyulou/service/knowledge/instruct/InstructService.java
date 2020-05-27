package com.guoguo.fengyulou.service.knowledge.instruct;

import com.github.pagehelper.PageInfo;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.entity.knowledge.instruct.Instruct;

import java.util.List;

public interface InstructService {
    /**
     * 按条件查询
     *
     * @param instruct
     * @return
     */
    List<Instruct> getInstructList(Instruct instruct);

    /**
     * 按条件分页查询
     *
     * @param instruct
     * @return
     */
    PageInfo<Instruct> getInstructListPage(Instruct instruct);

    /**
     * 保存数据
     *
     * @param instruct
     * @return
     */
    ServerResponse saveInstruct(Instruct instruct);

    /**
     * 按id和用户id查询
     *
     * @param instruct
     * @return
     */
    Instruct getInstructByIdAndUserId(Instruct instruct);

    /**
     * 按id和用户id删除
     *
     * @param ids
     * @param userId
     * @return
     */
    ServerResponse deleteInstructByIdsAndUserId(List<Long> ids, Long userId);
}
