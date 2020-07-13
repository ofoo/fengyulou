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
        <input type="hidden" name="memberLabelId" id="memberLabelId" value="${(data.memberLabelId)!}">
        <div class="form-group">
            <label for="name">人员姓名</label>
            <input name="name" type="text" class="form-control" id="name" value="${(data.name)!}"
                   placeholder="请输入人员姓名">
        </div>
        <div class="form-group">
            <label for="memberLabelId">人员标签</label>
            <div class="row">
                <div class="col-xs-1">
                    <button type="button" class="btn btn-success" id="memberLabel-insert">添加</button>
                </div>
                <div class="col-xs-11">
                    <div id="memberLabel-control" class="xm-select-demo"></div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="mobile">人员手机号</label>
            <input name="mobile" type="text" class="form-control" id="mobile" value="${(data.type)!}"
                   placeholder="请输入人员手机号">
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
    // 添加人员标签
    $("#memberLabel-insert").on("click", function () {
        layer.prompt({title: '添加人员标签'}, function (pass, index) {
            ajaxFunParam("/fyl/memberLabel/ajax/save", {'name': pass}, function (data) {
                if (data.status == 0) {
                    ajaxFunText("/fyl/memberLabel/ajax/content", function (data) {
                        $("#memberLabelId").html(data);
                    })
                    layer.close(index);
                }
            })
        });
    })
    // 保存任务
    $("#fengyulou-save").on("click", function () {
        //获取人员标签id
        var mlIds = memberLabelId.getValue('valueStr');
        //设置人员标签id
        $("#memberLabelId").val(mlIds);
        ajaxFunParam("/fyl/member/ajax/save", $("#dataForm").serialize(), function (data) {
            msgFunCallBack(data.msg, function () {
                if (data.status == 0) {
                    closePage();
                }
            })
        })
    })
    //查询人员标签
    var memberLabelId = cxsRadio("memberLabel-control", "/fyl/memberLabel/ajax/content", "请选择项目");
    //数据回显
    <#if ((data.id)??)>
    //修改人员标签选中
    ajaxFunParam("/fyl/member/ajax/label", {"id": "${(data.memberLabelId)}"}, function (data) {
        memberLabelId.setValue([data]);
    })
    </#if>
</script>
</body>
</html>