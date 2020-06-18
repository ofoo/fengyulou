package com.guoguo.fengyulou.project.dao;

import com.guoguo.fengyulou.project.entity.Project;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProjectDao {
    List<Project> getProjectList(Project project);

    int insertProject(Project project);

    int getProjectCountByProject(Project project);

    Project getProjectByIdAndUserId(Project project);

    int updateProjectByIdAndUserId(Project project);

    int getProjectCountByNameAndUserId(Project project);

    int deleteProjectByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);
}
