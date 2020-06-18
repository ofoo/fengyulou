package ${packName}.dao.${entity?lower_case};

import ${packName}.entity.${entity?lower_case}.${entity?cap_first};
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ${explain}
 */
public interface ${entity?cap_first}Dao {
    List<${entity?cap_first}> get${entity?cap_first}List(${entity?cap_first} ${entity?lower_case});

    int insert${entity?cap_first}(${entity?cap_first} ${entity?lower_case});

    int get${entity?cap_first}CountBy${entity?cap_first}(${entity?cap_first} ${entity?lower_case});

    ${entity?cap_first} get${entity?cap_first}ByIdAndUserId(${entity?cap_first} ${entity?lower_case});

    int update${entity?cap_first}ByIdAndUserId(${entity?cap_first} ${entity?lower_case});

    int get${entity?cap_first}CountByNameAndUserId(${entity?cap_first} ${entity?lower_case});

    int delete${entity?cap_first}ByIdsAndUserId(@Param("ids") List<Long> ids, @Param("userId") Long userId);
}
