package com.guoguo.fengyulou.dao.computer;

import com.guoguo.fengyulou.entity.computer.Computer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ComputerDao {
    List<Computer> getComputerList(Computer computer);

    int deleteComputerByIds(List<Long> ids);

    Computer getComputerById(@Param("id") Long id);

    int updateComputerById(Computer computer);

    int insertComputer(Computer computer);

    int updateStatusByIds(List<Long> ids);

    Computer getComputerByIdAndUserId(Computer computer);

    int updateComputerByIdAndUserId(Computer computer);

    int deleteComputerByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);

    int getComputerCountByNameAndUserId(Computer computer);

    int getComputerCountByComputer(Computer computer);
}
