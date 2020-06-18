package com.guoguo.fengyulou.computer.dao;

import com.guoguo.fengyulou.computer.entity.Computer;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ComputerDao {
    List<Computer> getComputerList(Computer computer);

    Computer getComputerById(@Param("id") Long id);

    int insertComputer(Computer computer);

    Computer getComputerByIdAndUserId(Computer computer);

    int updateComputerByIdAndUserId(Computer computer);

    int deleteComputerByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);

    int getComputerCountByNameAndUserId(Computer computer);
}
