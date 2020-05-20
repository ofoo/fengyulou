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
                <div class="panel panel-info">
                    <div class="panel-heading"><strong>人员列表</strong></div>
                    <div class="panel-body">
                        <ul id="treeDemo" class="ztree"></ul>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div style="overflow: auto;height: 500px;">
                    <table class="table table-bordered table-hover">
                        <thead class="text-center">
                        <tr>
                            <th width="33.3%"><strong>用户</strong></th>
                            <th width="33.3%"><strong>人员</strong></th>
                            <th width="33.3%"><strong>添加时间</strong></th>
                        </tr>
                        </thead>
                        <tbody id="content">
<#list dataList as data>
<tr>
    <td>${(data.userOneName)!}</td>
    <td>${(data.memberName)!}</td>
    <td>
                            <#if (data.insertTime)??>
                                ${data.insertTime?date}
                            </#if>
    </td>
</tr>
</#list>
                        </tbody>
                    </table>
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
            ajaxFunParam("/fyl/memberMonitor/ajax/save", {
                "userIdOne": treeNode.userId,
                "memberId": treeNode.id,
                "checked": treeNode.checked
            }, function (data) {
                console.log(data);
                if (data.status == 0) {
                    //刷新列表
                    getTableContent();
                }
            })
        };
        var zNodes = ${ztreeData!""};
        console.log(zNodes)
        $(function () {
            var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            //展开所有节点
            treeObj.expandAll(true);
            var nodes = ${dataJson!""};
            console.log(nodes)
            for (var i = 0, l = nodes.length; i < l; i++) {
                console.log(treeObj.getNodeByParam("id", nodes[i].memberId, null))
                treeObj.checkNode(treeObj.getNodeByParam("id", nodes[i].memberId, null), true, true);
            }
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

        //获取列表内容
        function getTableContent() {
            ajaxFunText("/fyl/memberMonitor/ajax/list", function (data) {
                $("#content").html(data)
            })
        }
    </script>
</body>
</html>