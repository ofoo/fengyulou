<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th width="2%"><input type="checkbox" class="checkall"></th>
        <th><strong>人员名称</strong></th>
        <th><strong>人员标签</strong></th>
        <th><strong>人员手机号</strong></th>
    </tr>
    </thead>
    <tbody>
                <#list pageInfo.list as data>
                <tr>
                    <td><input type="checkbox" name="ids" value="${data.id}" class="checkbox"></td>
                    <td>${(data.name)!}</td>
                    <td><span class="label label-primary">${(data.memberLabelName)!}</span></td>
                    <td>${(data.mobile)!}</td>
                </tr>
                </#list>
    </tbody>
</table>
<#include "../common/layout-page.ftl">
<script src="/js/ajaxListInit.js"></script>