<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th width="2%"><input type="checkbox" class="checkall"></th>
        <th width="30%"><strong>指令名称</strong></th>
        <th><strong>指令简述</strong></th>
    </tr>
    </thead>
    <tbody>
            <#list pageInfo.list as data>
            <tr>
                <td><input type="checkbox" name="ids" value="${data.id}" class="checkbox"></td>
                <td class="clearfix"><div class="pull-left" style="width: 80%;overflow: hidden;" id="copyText${data.id}"><span class="label label-success">${(data.name)!}</span></div><div class="pull-right"><button type="button" class="btn btn-primary btn-xs copy" id="${data.id}">复制</button></div></td>
                <td>${(data.sketch)!}</td>
            </tr>
            </#list>
    </tbody>
</table>
<#include "../../common/layout-page.ftl">