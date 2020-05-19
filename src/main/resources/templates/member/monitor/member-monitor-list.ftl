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
        data: {
            simpleData: {
                enable: true
            }
        },
        /*callback: {
            beforeCheck: beforeCheck,
            onCheck: onCheck
        }*/
    };
    var zNodes =[
        { id:1, pId:0, name:"随意勾选 1", open:true},
        { id:11, pId:1, name:"随意勾选 1-1"},
        { id:12, pId:1, name:"随意勾选 1-2", open:true},
        { id:121, pId:12, name:"随意勾选 1-2-1"},
        { id:122, pId:12, name:"随意勾选 1-2-2"},
        { id:2, pId:0, name:"禁止勾选 2", open:true, doCheck:false},
        { id:21, pId:2, name:"禁止勾选 2-1", doCheck:false},
        { id:22, pId:2, name:"禁止勾选 2-2", checked:true, open:true, doCheck:false},
        { id:221, pId:22, name:"禁止勾选 2-2-1", doCheck:false},
        { id:222, pId:22, name:"禁止勾选 2-2-2", checked:true, doCheck:false},
        { id:23, pId:2, name:"禁止勾选 2-3", doCheck:false}
    ];
    $(function () {
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
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