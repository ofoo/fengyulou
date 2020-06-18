<table class="table table-hover">
    <thead>
    <tr>
        <th width="2%"><input type="checkbox" class="checkall"></th>
        <th><strong>人员标签名称</strong></th>
    </tr>
    </thead>
    <tbody>
            <#list pageInfo.list as data>
            <tr>
                <td><input type="checkbox" name="ids" value="${data.id}" class="checkbox"></td>
                <td>${(data.name)!}</td>
            </tr>
            </#list>
    </tbody>
</table>
<#include "../../common/layout-page.ftl">