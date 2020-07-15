<table class="table table-hover">
    <thead>
    <tr>
        <th width="2%"><input type="checkbox" class="checkall"></th>
        <th width="8%"><strong>项目名称</strong></th>
        <th width="52%"><strong>简述</strong></th>
        <th width="8%"><strong>标签</strong></th>
        <th width="8%"><strong>状态</strong></th>
        <th width="14%"><strong>开始时间</strong></th>
        <th width="8%"><strong>执行人</strong></th>
    </tr>
    </thead>
    <tbody>
            <#list pageInfo.list as data>
            <tr>
                <td><input type="checkbox" name="ids" value="${data.id}" class="checkbox"></td>
                <td><span class="label label-success">${(data.projectName)!}</span></td>
                <td>${(data.sketch)!}</td>
                <td>${(data.taskLabelName)!}</td>
                <td>
                    <#if data.status==1><span class="label label-success">已完成</span></#if>
                    <#if data.status==2><span class="label label-primary">进行中</span></#if>
                </td>
                <td>
                    <#if (data.startTime)??>
                        ${data.startTime?string('yyyy-MM-dd HH:mm:ss')}
                    </#if>
                </td>
                <td><span class="label label-primary">${data.memberName}</span></td>
            </tr>
            </#list>
    </tbody>
</table>
<#include "../../common/layout-page.ftl">