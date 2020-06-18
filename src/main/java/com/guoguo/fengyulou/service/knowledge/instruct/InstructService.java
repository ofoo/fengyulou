package com.guoguo.fengyulou.service.knowledge.instruct;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guoguo.common.ResponseCode;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.dao.knowledge.instruct.InstructDao;
import com.guoguo.fengyulou.entity.knowledge.instruct.Instruct;
import com.guoguo.fengyulou.service.knowledge.instruct.InstructService;
import com.guoguo.util.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InstructService {

    @Autowired
    private InstructDao instructDao;

    /**
     * 按条件查询
     *
     * @param instruct
     * @return
     */
    public List<Instruct> getInstructList(Instruct instruct) {
        return instructDao.getInstructList(instruct);
    }

    /**
     * 按条件分页查询
     *
     * @param instruct
     * @return
     */
    public PageInfo<Instruct> getInstructListPage(Instruct instruct) {
        PageHelper.startPage(instruct.getPageNum() == null ? 1 : instruct.getPageNum(), instruct.getPageSize() == null ? 10 : instruct.getPageSize());
        List<Instruct> list = instructDao.getInstructList(instruct);
        PageInfo<Instruct> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存数据
     *
     * @param instruct
     * @return
     */
    public ServerResponse saveInstruct(Instruct instruct) {
        // 去除空格
        instruct.setName(instruct.getName().trim());
        if (ObjectUtils.isNotNull(instruct.getId())) {
            // 检查数据是否重复
            int count = instructDao.getInstructCountByInstruct(instruct);
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }
            // 修改
            int rows = instructDao.updateInstructByIdAndUserId(instruct);
            if (rows > 0) {
                return ServerResponse.createBySuccess();
            }
        } else {
            // 检查数据是否重复
            int count = instructDao.getInstructCountByNameByUserId(instruct);
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }
            // 添加
            int rows = instructDao.insertInstruct(instruct);
            if (rows > 0) {
                return ServerResponse.createBySuccess(instruct.getId());
            }
        }
        return ServerResponse.createByError();
    }

    /**
     * 按id和用户id查询
     *
     * @param instruct
     * @return
     */
    public Instruct getInstructByIdAndUserId(Instruct instruct) {
        if (ObjectUtils.isNull(instruct.getId())) {
            return null;
        }
        return instructDao.getInstructByIdAndUserId(instruct);
    }

    /**
     * 按id和用户id删除
     *
     * @param ids
     * @param userId
     * @return
     */
    public ServerResponse deleteInstructByIdsAndUserId(List<Long> ids, Long userId) {
        int rows = instructDao.deleteInstructByIdsAndUserId(ids, userId);
        if (rows > 0) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }
}
