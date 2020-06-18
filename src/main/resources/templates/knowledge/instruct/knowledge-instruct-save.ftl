<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <#assign title="${pageTitle}">
    <#include "../../common/header-script.ftl">
</head>
<body>
<div class="container-fluid">
    <form class="form-horizontal data-form" id="dataForm">
        <input type="hidden" name="id" value="${(data.id)!}">
        <div class="form-group">
            <label class="col-md-2 control-label text-danger">指令名称</label>
            <div class="col-md-5">
                <input name="sketch" type="text" class="form-control" id="sketch" value="${(data.sketch)!}"
                       placeholder="指令简述">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label text-danger">指令</label>
            <div class="col-md-5">
                <input name="name" type="text" class="form-control" id="name" value="${(data.name)!}"
                       placeholder="指令名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label text-danger">类型</label>
            <div class="col-sm-3">
                <select class="form-control" id="knowledgeId" name="knowledgeId">
                    <#list knowledgeList as item>
                        <option value="${item.id}"
                                <#if ((data.knowledgeId)!0)==item.id>selected</#if>>${item.name}</option>
                    </#list>
                </select>
            </div>
            <div class="col-sm-2">
                <button type="button" class="btn btn-success" id="knowledge-insert">添加</button>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-primary" id="fengyulou-save">提交</button>
                <button type="reset" class="btn btn-primary">重置</button>
                <button type="button" class="btn btn-danger" id="fengyulou-close">关闭</button>
            </div>
        </div>
    </form>
</div>

<#include "../../common/footer-script.ftl">
<script>
    // 添加项目
    $("#knowledge-insert").on("click", function () {
        openPageEnd("/fyl/knowledge/insert",function(){
            ajaxFunText("/fyl/knowledge/ajax/content", function (data) {
                $("#knowledgeId").html(data);
            })
        });
    })
    // 保存任务
    $("#fengyulou-save").on("click", function () {
        ajaxFunParam("/fyl/instruct/ajax/save", $("#dataForm").serialize(), function (data) {
            msgFunCallBack(data.msg,function(){
                if(data.status==0){
                    parent.searchData()
                }
            })
        })
    })
</script>
</body>
</html>