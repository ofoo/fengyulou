<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${packName}.dao.${entity?lower_case}.${entity?cap_first}Dao">
    <insert id="insert${entity?cap_first}" useGeneratedKeys="true" keyProperty="id" keyColumn="id">
        insert into ${tablePrefix}${entity?lower_case}(<#list fieldList as field>`${field}`,</#list>insert_time) values (<#list attrList as attr>#${"{"}${attr.name}${"}"},</#list>now())
    </insert>
    <update id="update${entity?cap_first}ByIdAndUserId">
        update ${tablePrefix}${entity?lower_case} set <#list updateFieldList as field>${field},</#list>update_time=now() where id=#${"{id}"} and user_id=#${"{userId}"}  and `delete`=0
    </update>
    <update id="delete${entity?cap_first}ByIdsAndUserId">
        update ${tablePrefix}${entity?lower_case} set `delete`=1,delete_time=now() where id in
        <foreach collection="ids" item="item" open="(" separator="," close=")">
        #${"{item}"}
        </foreach>
        and user_id=#${"{userId}"}
        and `delete`=0
    </update>

    <select id="get${entity?cap_first}List" resultType="${packName}.entity.${entity?lower_case}.${entity?cap_first}">
        select id,<#list fieldList as field>`${field}`,</#list>insert_time
        from ${tablePrefix}${entity?lower_case}
        <where>
            `delete`=0
            and user_id=#${"{userId}"}
            <#list selectFieldList as field>
                ${field}
            </#list>
        </where>
        order by id desc
    </select>
    <select id="get${entity?cap_first}CountBy${entity?cap_first}" resultType="java.lang.Integer">
        select ifnull(count(1),0) from ${tablePrefix}${entity?lower_case} where <#if soleWhere=="">name=#${"{name}"}<#else>${soleWhere}</#if> and user_id=#${"{userId}"} and id!=#${"{id}"}  and `delete`=0
    </select>
    <select id="get${entity?cap_first}ByIdAndUserId" resultType="${packName}.entity.${entity?lower_case}.${entity?cap_first}">
        select id,<#list fieldList as field>`${field}`,</#list>insert_time from ${tablePrefix}${entity?lower_case} where id=#${"{id}"} and user_id=#${"{userId}"}  and `delete`=0 limit 1
    </select>
    <select id="get${entity?cap_first}CountByNameAndUserId" resultType="java.lang.Integer">
        select ifnull(count(1),0) from ${tablePrefix}${entity?lower_case} where <#if soleWhere=="">name=#${"{name}"}<#else>${soleWhere}</#if> and user_id=#${"{userId}"} and `delete`=0
    </select>
</mapper>