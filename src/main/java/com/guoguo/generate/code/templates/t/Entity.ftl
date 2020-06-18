package ${packName}.entity.${entity?lower_case};

import com.guoguo.common.BaseEntity;
import lombok.Data;

import java.util.Date;
<#list attrTypeList as type>
    ${type.name}
<#else>

</#list>
/**
 * ${explain}
 */
@Data
public class ${entity?cap_first} extends BaseEntity {
<#list attrList as attr>
    /**
     * ${attr.desc}
     */
    private ${attr.type} ${attr.name};
</#list>
}
