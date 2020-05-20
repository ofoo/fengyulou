<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <#assign title="人员监听">
    <#include "../../common/header-script.ftl">
</head>
<body>
<div class="admin">
    <#include "../../common/layout-left.ftl">
    <div class="admin-right">
        <#include "../../common/layout-navtitle.ftl">
        <div class="row">
            <div class="col-md-3">
                <ul id="treeDemo" class="ztree"></ul>
            </div>
            <div class="col-md-9">
                <table class="table table-bordered table-hover">
                    <thead class="text-center">
                    <tr>
                        <th width="33.3%"><strong>用户</strong></th>
                        <th width="33.3%"><strong>人员</strong></th>
                        <th width="33.3%"><strong>添加时间</strong></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>苏秦</td>
                        <td>郭超</td>
                        <td>2020-5-20</td>
                    </tr>
                    <#--<#list pageInfo.list as data>
                    <tr>
                        <td>${(data.name)!}</td>
                        <td>${(data.name)!}</td>
                        <td>${(data.name)!}</td>
                    </tr>
                    </#list>-->
                    </tbody>
                </table>
            <#--<#include "../../common/layout-page.ftl">-->
            </div>
        </div>
    </div>
</div>

<#include "../../common/footer-script.ftl">
<script>
    var setting = {
        view: {
            selectedMulti: false
        },
        check: {
            enable: true
        },
        callback: {
            onCheck: zTreeOnCheck
        }
    };
    function zTreeOnCheck(event, treeId, treeNode) {
        if (treeNode.checked) {
            ajaxFunParam("/")
        }
        // alert(treeNode.tId + ", " + treeNode.id + "," + treeNode.name + "," + treeNode.checked);
    };
    var zNodes = ${ztreeData!""};
    $(function () {
        var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        //展开所有节点
        treeObj.expandAll(true);
        // 添加
        $('#fengyulou-insert').on('click', function () {
            openPage('/fyl/memberLabel/insert')
        })
        // 修改
        $('#fengyulou-update').on('click', function () {
            if (!checkSelect("请选择数据")) {
                return;
            }
            var id = $(".checkbox:checked")[0].value;
            openPage('/fyl/memberLabel/update?id=' + id)
        })
        // 删除
        $('#fengyulou-delete').on('click', function () {
            if (!checkSelect("请选择数据")) {
                return;
            }
            delFun('/fyl/memberLabel/ajax/delete', $("#dataForm").serialize(), function (data) {
                msgFunCallBack(data.msg, function () {
                    if (data.status == 0) {
                        location.reload()
                    }
                })
            })
        })
    })
</script>
</body>
</html>