<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <#assign title="${pageTitle}">
    <#include "../../common/header-script.ftl">
</head>
<body>
<form class="data-form" id="dataForm">
    <input type="hidden" name="id" id="dataId" value="${(data.id)!}">
    <div class="form-group">
        <label for="sketch">任务简述</label>
        <textarea name="sketch" class="form-control" rows="8" id="sketch"
                  placeholder="任务简述">${(data.sketch)!}</textarea>
    </div>
    <#--<div class="form-group">
        <label for="sketch">项目名称</label>
        <div class="input-group">
                <span class="input-group-btn">
                    <button type="button" class="btn btn-success" id="project-insert">添加</button>
                </span>
            <select class="form-control" id="projectId" name="projectId">
                    <#list projectList as item>
                        <option value="${item.id}"
                                <#if ((data.projectId)!0)==item.id>selected</#if>>${item.name}</option>
                    </#list>
            </select>
        </div>
    </div>-->
    <div class="form-group">
        <label for="sketch">项目名称</label>
        <div class="row">
            <div class="col-md-1">
                <button type="button" class="btn btn-success" id="project-insert">添加</button>
            </div>
            <div class="col-md-11">
                <div id="projectId" class="xm-select-demo"></div>
                <#--<select class="form-control" id="projectId" name="projectId">
                    <#list projectList as item>
                        <option value="${item.id}"
                                <#if ((data.projectId)!0)==item.id>selected</#if>>${item.name}</option>
                    </#list>
                </select>-->
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="sketch">任务标签</label>
        <div class="row">
            <div class="col-md-1">
                <button type="button" class="btn btn-success" id="taskLabel-insert">添加</button>
            </div>
            <div class="col-md-11">
                <div id="taskLabelId" class="xm-select-demo"></div>
                <#--<select class="form-control" id="taskLabelId" name="taskLabelId">
                    <#list taskLabelList as item>
                        <option value="${item.id}"
                                    <#if ((data.taskLabelId)!0)==item.id>selected</#if>>${item.name}</option>
                    </#list>
                </select>-->
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="sketch">执行人</label>
        <div class="row">
            <div class="col-md-1">
                <button type="button" class="btn btn-success" id="member-insert">添加</button>
            </div>
            <div class="col-md-11">
                <#--<select class="form-control" id="memberId" name="memberId">
            <#list memberList as item>
                <option value="${item.id}"
                            <#if ((data.memberId)!0)==item.id>selected</#if>>${item.name}</option>
            </#list>
                </select>-->
                    <div id="memberId" class="xm-select-demo"></div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="sketch">开始时间</label>
        <input type="text" name="startTime" class="form-control" placeholder="开始时间" id="startTime" readonly>
    </div>
    <div class="form-group">
        <label for="sketch">结束时间</label>
        <input type="text" name="endTime" class="form-control" placeholder="结束时间" id="endTime" readonly>
    </div>
    <div class="form-group">
        <label for="sketch">任务状态</label>
        <select class="form-control" id="status" name="status">
            <option value="0" <#if ((data.status)!0)==0>selected</#if>>未完成</option>
            <option value="1" <#if ((data.status)!0)==1>selected</#if>>已完成</option>
        </select>
    </div>
    <div class="form-group">
        <button type="button" class="btn btn-primary" id="fengyulou-save">提交</button>
        <button type="reset" class="btn btn-warning">重置</button>
        <button type="button" class="btn btn-danger" id="fengyulou-close">关闭</button>
    </div>
</form>

<#include "../../common/footer-script.ftl">
<script>
    // 添加项目
    $("#project-insert").on("click", function () {
        layer.prompt({title: '添加项目'}, function (pass, index) {
            ajaxFunParam("/fyl/project/ajax/save", {'name': pass}, function (data) {
                msgFunCallBack(data.msg, function () {
                    if (data.status == 0) {
                        ajaxFunText("/fyl/project/ajax/content", function (data) {
                            // $("#projectId").html(data);
                        })
                        layer.close(index);
                    }
                })
            })
        });
    })
    // 添加任务标签
    $("#taskLabel-insert").on("click", function () {
        layer.prompt({title: '添加任务标签'}, function (pass, index) {
            ajaxFunParam("/fyl/taskLabel/ajax/save", {'name': pass}, function (data) {
                if (data.status == 0) {
                    ajaxFunText("/fyl/taskLabel/ajax/content", function (data) {
                        // $("#taskLabelId").html(data);
                    })
                    layer.close(index);
                }
            })
        });
    })
    // 添加执行人
    $("#member-insert").on("click", function () {
        openPageEnd('添加执行人', "/fyl/member/insert", function () {
            ajaxFunText("/fyl/member/ajax/content", function (data) {
                // $("#memberId").html(data);
            })
        });
    })
    // 保存任务
    $("#fengyulou-save").on("click", function () {
        ajaxFunParam("/fyl/task/ajax/save", $("#dataForm").serialize(), function (data) {
            msgFunCallBack(data.msg, function () {
                if (data.status == 0) {
                    closePage();
                }
            })
        })
    })
    ctc("startTime");
    ctc("endTime");
    var projectId =cxsRadio("projectId","/fyl/project/ajax/content","请选择项目");
    var taskLabelId =cxs("taskLabelId","/fyl/taskLabel/ajax/content","请选择任务标签");
    var memberId =cxs("memberId","/fyl/member/ajax/content","请选择执行人");
</script>
</body>
</html>