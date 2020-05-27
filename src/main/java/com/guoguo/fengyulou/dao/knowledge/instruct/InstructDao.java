package com.guoguo.fengyulou.dao.knowledge.instruct;

import com.guoguo.fengyulou.entity.knowledge.instruct.Instruct;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InstructDao {
    List<Instruct> getInstructList(Instruct instruct);

    int getInstructCountByInstruct(Instruct instruct);

    int insertInstruct(Instruct instruct);

    Instruct getInstructByIdAndUserId(Instruct instruct);

    int getInstructCountByNameByUserId(Instruct instruct);

    int updateInstructByIdAndUserId(Instruct instruct);

    int deleteInstructByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);
}
