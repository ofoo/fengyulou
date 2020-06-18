package com.guoguo.fengyulou.service.knowledge;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guoguo.common.ResponseCode;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.dao.knowledge.KnowledgeDao;
import com.guoguo.fengyulou.entity.knowledge.Knowledge;
import com.guoguo.fengyulou.service.knowledge.KnowledgeService;
import com.guoguo.util.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KnowledgeService {

    @Autowired
    private KnowledgeDao knowledgeDao;

    /**
     * 按条件查询
     *
     * @param knowledge
     * @return
     */
    public List<Knowledge> getKnowledgeList(Knowledge knowledge) {
        return knowledgeDao.getKnowledgeList(knowledge);
    }

    /**
     * 按条件分页查询
     *
     * @param knowledge
     * @return
     */
    public PageInfo<Knowledge> getKnowledgeListPage(Knowledge knowledge) {
        PageHelper.startPage(knowledge.getPageNum() == null ? 1 : knowledge.getPageNum(), knowledge.getPageSize() == null ? 10 : knowledge.getPageSize());
        List<Knowledge> list = knowledgeDao.getKnowledgeList(knowledge);
        PageInfo<Knowledge> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存项目
     *
     * @param knowledge
     * @return
     */
    public ServerResponse saveKnowledge(Knowledge knowledge) {
        // 去除空格
        knowledge.setName(knowledge.getName().trim());
        if (ObjectUtils.isNotNull(knowledge.getId())) {
            // 验证数据是否重复
            int count = knowledgeDao.getKnowledgeCountByKnowledge(knowledge);
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }
            // 修改
            int rows = knowledgeDao.updateKnowledgeByIdAndUserId(knowledge);
            if (rows > 0) {
                return ServerResponse.createBySuccess();
            }
        } else {
            // 验证数据是否重复
            int count = knowledgeDao.getKnowledgeCountByNameAndUserId(knowledge);
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }
            // 添加
            int rows = knowledgeDao.insertKnowledge(knowledge);
            if (rows > 0) {
                return ServerResponse.createBySuccess(knowledge.getId());
            }
        }
        return ServerResponse.createByError();
    }

    /**
     * 按id和用户id查询
     *
     * @param knowledge
     * @return
     */
    public Knowledge getKnowledgeByIdAndUserId(Knowledge knowledge) {
        if (ObjectUtils.isNull(knowledge.getId())) {
            return null;
        }
        return knowledgeDao.getKnowledgeByIdAndUserId(knowledge);
    }

    /**
     * 按id和用户id删除
     *
     * @param ids
     * @param userId
     * @return
     */
    public ServerResponse deleteKnowledgeByIdsAndUserId(List<Long> ids, Long userId) {
        int rows = knowledgeDao.deleteKnowledgeByIdsAndUserId(ids, userId);
        if (rows > 0) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }
}
