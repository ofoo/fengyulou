<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th width="2%"><input type="checkbox" class="checkall"></th>
        <th width="30%"><strong>知识名称</strong></th>
        <th><strong>知识简述</strong></th>
    </tr>
    </thead>
    <tbody>
            <#list pageInfo.list as data>
            <tr>
                <td><input type="checkbox" name="ids" value="${data.id}" class="checkbox"></td>
                <td>${(data.name)!}</td>
                <td>${(data.sketch)!}</td>
            </tr>
            </#list>
    </tbody>
</table>
<#include "../common/layout-page.ftl">