<table class="table table-hover">
    <thead>
    <tr>
        <th width="2%"><input type="checkbox" class="checkall"></th>
        <th><strong>用户账号</strong></th>
        <th><strong>用户姓名</strong></th>
    </tr>
    </thead>
    <tbody>
            <#list pageInfo.list as data>
            <tr>
                <td><input type="checkbox" name="ids" value="${data.id}" class="checkbox"></td>
                <td>${(data.loginName)!}</td>
                <td>${(data.name)!"暂无"}</td>
            </tr>
            </#list>
    </tbody>
</table>
<#include "../common/layout-page.ftl">