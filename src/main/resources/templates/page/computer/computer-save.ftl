<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <#assign title="${pageTitle}">
    <#include "../../common/header-script.ftl">
</head>
<body>
<div class="fyl-form-left">
    <form class="data-form" id="dataForm">
        <input type="hidden" name="id" id="dataId" value="${(data.id)!}">
        <div class="form-group">
            <label>项目名称</label>
            <div class="row">
                <div class="col-sm-1">
                    <button type="button" class="btn btn-success" id="project-insert">添加</button>
                </div>
                <div class="col-sm-11">
                    <div id="project-control" class="xm-select-demo"></div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>名称</label>
            <input type="text" name="name" class="form-control" id="name" value="${(data.name)!}" placeholder="名称">
        </div>
        <div class="form-group">
            <label>主机</label>
            <input type="text" name="host" class="form-control" id="host" value="${(data.host)!}" placeholder="主机">
        </div>
        <div class="form-group">
            <label>端口</label>
            <input type="text" name="port" class="form-control" id="port" value="${(data.port)!22}" placeholder="端口">
        </div>
        <div class="form-group">
            <label>账号</label>
            <input type="text" name="account" class="form-control" id="host" value="${(data.account)!'root'}"
                   placeholder="账号">
        </div>
        <div class="form-group">
            <label>密码</label>
            <input type="text" name="password" class="form-control" id="password" value="${(data.password)!}"
                   placeholder="密码">
        </div>
    </form>
</div>
<div class="fyl-form-btn">
    <div class="fyl-form-btn-box">
        <p>
            <button type="button" class="btn btn-primary btn-block" id="fengyulou-save">提交</button>
        </p>
        <p>
            <button type="reset" class="btn btn-warning btn-block">重置</button>
        </p>
        <p>
            <button type="button" class="btn btn-danger btn-block" id="fengyulou-close">关闭</button>
        </p>
    </div>
</div>

<#include "../../common/footer-script.ftl">
<script>
    // 添加项目
    $("#project-insert").on("click", function () {
        layer.prompt({title: '添加项目'}, function (pass, index) {
            ajaxFunParam("/fyl/project/ajax/save", {'name': pass}, function (data) {
                msgFunCallBack(data.msg, function () {
                    if (data.status == 0) {
                        layer.close(index);
                    }
                })
            })
        });
    })
    // 保存任务
    $("#fengyulou-save").on("click", function () {
        ajaxFunParam("/fyl/computer/ajax/save", $("#dataForm").serialize(), function (data) {
            msgFunCallBack(data.msg, function () {
                if (data.status == 0) {
                    closePage();
                }
            })
        })
    })
    //查询项目
    var projectId = cxsRadioForm("project-control", "/fyl/project/ajax/content", "请选择项目", "projectId");
    //数据回显
    <#if ((data.id)??)>
    console.log(11)
    //修改人员标签选中
    ajaxFunParam("/fyl/project/ajax/info", {"id": "${(data.projectId)}"}, function (data) {
        projectId.setValue([data]);
    })
    </#if>
</script>
</body>
</html>