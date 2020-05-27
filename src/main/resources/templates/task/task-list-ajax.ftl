<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th width="2%"><input type="checkbox" class="checkall"></th>
        <th width="8%"><strong>项目名称</strong></th>
        <th><strong>任务简述</strong></th>
        <th width="8%"><strong>任务状态</strong></th>
        <th width="8%"><strong>任务标签</strong></th>
        <th width="8%"><strong>完成时间</strong></th>
        <th width="8%"><strong>执行人</strong></th>
    </tr>
    </thead>
    <tbody>
            <#list pageInfo.list as data>
            <tr>
                <td><input type="checkbox" name="ids" value="${data.id}" class="checkbox"></td>
                <td><span class="label label-success">${(data.projectName)!}</span></td>
                <td>${(data.sketch)!}</td>
                <td><#if data.status==0><span class="label label-danger">未完成</span><#else><span
                        class="label label-success">已完成</span></#if></td>
                <td>${(data.taskLabelName)!}</td>
                <td>
                    <#if (data.finishTime)??>
                        ${data.finishTime?date}
                    </#if>
                </td>
                <td><span class="label label-primary">${data.memberName}</span></td>
            </tr>
            </#list>
    </tbody>
</table>
<#include "../common/layout-page.ftl">