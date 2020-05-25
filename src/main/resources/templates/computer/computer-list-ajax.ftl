<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th width="2%"><input type="checkbox" class="checkall"></th>
        <th width="15%"><strong>项目名称</strong></th>
        <th width="15%"><strong>主机</strong></th>
        <th width="15%"><strong>端口</strong></th>
        <th width="15%"><strong>账号</strong></th>
        <th><strong>密码</strong></th>
    </tr>
    </thead>
    <tbody>
            <#list pageInfo.list as data>
            <tr>
                <td><input type="checkbox" name="ids" value="${data.id}" class="checkbox"></td>
                <td><span class="label label-success">${(data.projectName)!}</span></td>
                <td>${(data.host)!}</td>
                <td><span class="text-danger">${(data.port)!}</span></td>
                <td>${(data.account)!}</td>
                <td>${(data.password)!}</td>
            </tr>
            </#list>
    </tbody>
</table>
<#include "../common/layout-page.ftl">
<script src="/js/ajaxListInit.js"></script>