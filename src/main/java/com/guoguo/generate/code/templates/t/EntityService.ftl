package com.guoguo.fengyulou.service.aaa.${entity?lower_case};

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guoguo.common.ResponseCode;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.dao.${entity?lower_case}.${entity?cap_first}Dao;
import com.guoguo.fengyulou.entity.${entity?lower_case}.${entity?cap_first};
import com.guoguo.util.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ${explain}
 */
@Service
public class ${entity?cap_first}Service {

    @Autowired
    private ${entity?cap_first}Dao ${entity?lower_case}Dao;

    /**
     * 按条件查询
     *
     * @param ${entity?lower_case}
     * @return
     */
    public List<${entity?cap_first}> get${entity?cap_first}List(${entity?cap_first} ${entity?lower_case}) {
        return ${entity?lower_case}Dao.get${entity?cap_first}List(${entity?lower_case});
    }

    /**
     * 按条件分页查询
     *
     * @param ${entity?lower_case}
     * @return
     */
    public PageInfo<${entity?cap_first}> get${entity?cap_first}ListPage(${entity?cap_first} ${entity?lower_case}) {
        PageHelper.startPage(${entity?lower_case}.getPageNum() == null ? 1 : ${entity?lower_case}.getPageNum(), ${entity?lower_case}.getPageSize() == null ? 10 : ${entity?lower_case}.getPageSize());
        List<${entity?cap_first}> list = ${entity?lower_case}Dao.get${entity?cap_first}List(${entity?lower_case});
        PageInfo<${entity?cap_first}> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 保存
     *
     * @param ${entity?lower_case}
     * @return
     */
    public ServerResponse save${entity?cap_first}(${entity?cap_first} ${entity?lower_case}) {
        // 去除空格
        ${entity?lower_case}.setName(${entity?lower_case}.getName().trim());
        if (ObjectUtils.isNotNull(${entity?lower_case}.getId())) {
            // 验证数据是否重复
<#if soleWhere=="">
//            int count = projectDao.getProjectCountByProject(project);
//            if (count > 0) {
//                return ServerResponse.createByError(ResponseCode.EXIST);
//            }
<#else>
            int count = ${entity?lower_case}Dao.get${entity?cap_first}CountBy${entity?cap_first}(${entity?lower_case});
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }
</#if>
            // 修改
            int rows = ${entity?lower_case}Dao.update${entity?cap_first}ByIdAndUserId(${entity?lower_case});
            if (rows > 0) {
                return ServerResponse.createBySuccess();
            }
        } else {
            // 验证数据是否重复
<#if soleWhere=="">
//            int count = projectDao.getProjectCountByNameAndUserId(project);
//            if (count > 0) {
//                return ServerResponse.createByError(ResponseCode.EXIST);
//            }
<#else>
            int count = ${entity?lower_case}Dao.get${entity?cap_first}CountByNameAndUserId(${entity?lower_case});
            if (count > 0) {
                return ServerResponse.createByError(ResponseCode.EXIST);
            }
</#if>
            // 添加
            int rows = ${entity?lower_case}Dao.insert${entity?cap_first}(${entity?lower_case});
            if (rows > 0) {
                return ServerResponse.createBySuccess(${entity?lower_case}.getId());
            }
        }
        return ServerResponse.createByError();
    }

    /**
     * 按id和用户id查询
     *
     * @param ${entity?lower_case}
     * @return
     */
    public ${entity?cap_first} get${entity?cap_first}ByIdAndUserId(${entity?cap_first} ${entity?lower_case}) {
        if (ObjectUtils.isNull(${entity?lower_case}.getId())) {
            return null;
        }
        return ${entity?lower_case}Dao.get${entity?cap_first}ByIdAndUserId(${entity?lower_case});
    }

    /**
     * 按id和用户id删除
     *
     * @param ids
     * @param userId
     * @return
     */
    public ServerResponse delete${entity?cap_first}ByIdsAndUserId(List<Long> ids, Long userId) {
        int rows = ${entity?lower_case}Dao.delete${entity?cap_first}ByIdsAndUserId(ids, userId);
        if (rows > 0) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }
}
