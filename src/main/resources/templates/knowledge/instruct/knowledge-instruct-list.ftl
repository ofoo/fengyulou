<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <#assign title="指令列表">
    <#include "../../common/header-script.ftl">
</head>
<body>
<div class="admin">
    <#include "../../common/layout-left.ftl">
    <div class="admin-right">
        <#include "../../common/layout-navtitle.ftl">
        <div class="parcel">
            <div class="parcel-head">
                <form class="search-from" method="post" id="searchForm">
                    <input type="hidden" name="pageNum" id="pageNum">
                    <div class="row">
                        <div class="col-md-3">
                            <input name="knowledgeName" id="knowledgeName" type="text" class="form-control"
                                   value="${(data.knowledgeName)!}"
                                   placeholder="知识名称">
                        </div>
                        <div class="col-md-3">
                            <input name="name" id="name" type="text" class="form-control" value="${(data.name)!}"
                                   placeholder="指令名称">
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-info" data-page="1" id="fengyulou-search">查询</button>
                            <button type="button" class="btn btn-warning" id="fengyulou-clear">清空</button>
                        </div>
                    </div>
                </form>
                <div class="fun-btn btn-group" role="group" aria-label="Basic example">
                    <button type="button" class="btn btn-success" id="fengyulou-insert">添加</button>
                    <button type="button" class="btn btn-primary" id="fengyulou-update">修改</button>
                    <button type="button" class="btn btn-danger" id="fengyulou-delete">删除</button>
                </div>
                <form id="dataForm"></form>
            </div>
            <div class="parcel-body">
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
            </div>
        </div>
    </div>
</div>

<#include "../../common/footer-script.ftl">
<script>
    $(function () {
        // 添加
        $('#fengyulou-insert').on('click', function () {
            openPageEnd('/fyl/instruct/insert', function () {
                location.reload();
            })
        })
        // 修改
        $('#fengyulou-update').on('click', function () {
            if (!checkSelect("请选择数据")) {
                return;
            }
            var id = $(".checkbox:checked")[0].value;
            openPageEnd('/fyl/instruct/update?id=' + id, function () {
                location.reload();
            })
        })
        // 删除
        $('#fengyulou-delete').on('click', function () {
            if (!checkSelect("请选择数据")) {
                return;
            }
            delFun('/fyl/instruct/ajax/delete', $("#dataForm").serialize(), function (data) {
                msgFunCallBack(data.msg, function () {
                    if (data.status == 0) {
                        location.reload()
                    }
                })
            })
        })
    })

    // 查询数据
    function searchData() {
        ajaxFunParamText("/fyl/instruct/ajax/list", $("#searchForm").serialize(), function (data) {
            $(".parcel-body").html(data);
            initCallBack();
        })
    }
</script>
</body>
</html>