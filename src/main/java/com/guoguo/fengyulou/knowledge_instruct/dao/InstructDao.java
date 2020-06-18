package com.guoguo.fengyulou.knowledge_instruct.dao;

import com.guoguo.fengyulou.knowledge_instruct.entity.Instruct;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface InstructDao {
    List<Instruct> getInstructList(Instruct instruct);

    int getInstructCountByInstruct(Instruct instruct);

    int insertInstruct(Instruct instruct);

    Instruct getInstructByIdAndUserId(Instruct instruct);

    int getInstructCountByNameByUserId(Instruct instruct);

    int updateInstructByIdAndUserId(Instruct instruct);

    int deleteInstructByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);
}
