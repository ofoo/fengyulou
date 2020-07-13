<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <#assign title="人员列表">
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
                        <div class="col-md-2">
                            <input name="name" id="name" type="text" class="form-control" value="${(data.name)!}"
                                   placeholder="人员姓名">
                        </div>
                        <div class="col-md-2">
                            <input name="memberLabelName" id="memberLabelName" type="text" class="form-control"
                                   value="${(data.memberLabelName)!}"
                                   placeholder="人员标签">
                        </div>
                        <div class="col-md-2">
                            <input name="mobile" id="mobile" type="text" class="form-control" value="${(data.mobile)!}"
                                   placeholder="人员手机号">
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
                <table class="table table-hover">
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
            openPageEnd('添加人员','/fyl/member/insert', function () {
                searchData();
            })
        })
        // 修改
        $('#fengyulou-update').on('click', function () {
            if (!checkSelect("请选择数据")) {
                return;
            }
            var id = $(".checkbox:checked")[0].value;
            openPageEnd('修改人员','/fyl/member/update?id=' + id, function () {
                searchData();
            })
        })
        // 删除
        $('#fengyulou-delete').on('click', function () {
            if (!checkSelect("请选择数据")) {
                return;
            }
            delFun('/fyl/member/ajax/delete', $("#dataForm").serialize(), function (data) {
                msgFunCallBack(data.msg, function () {
                    if (data.status == 0) {
                        searchData();
                    }
                })
            })
        })
    })

    // 查询数据
    function searchData() {
        ajaxFunParamText("/fyl/member/ajax/list", $("#searchForm").serialize(), function (data) {
            $(".parcel-body").html(data);
            initCallBack();
        })
    }
</script>
</body>
</html>