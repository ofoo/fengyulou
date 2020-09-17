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
        <input type="hidden" name="projectId" id="projectId" value="${(data.projectId)!}">
        <input type="hidden" name="taskLabelId" id="taskLabelId" value="${(data.taskLabelId)!}">
        <input type="hidden" name="memberId" id="memberId" value="${(data.memberId)!}">
        <div class="form-group">
            <label for="sketch">任务简述</label>
            <textarea name="sketch" class="form-control" rows="8" id="sketch"
                      placeholder="任务简述">${(data.sketch)!}</textarea>
        </div>
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
            <label for="sketch">任务标签</label>
            <div class="row">
                <div class="col-sm-1">
                    <button type="button" class="btn btn-success" id="taskLabel-insert">添加</button>
                </div>
                <div class="col-sm-11">
                    <div id="taskLabel-control" class="xm-select-demo"></div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="sketch">执行人</label>
            <div class="row">
                <div class="col-sm-1">
                    <button type="button" class="btn btn-success" id="member-insert">添加</button>
                </div>
                <div class="col-sm-11">
                    <div id="member-control" class="xm-select-demo"></div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="sketch">开始时间</label>
            <input type="text" name="startTime" class="form-control" placeholder="开始时间" id="startTime" readonly
                   value="<#if (data.startTime)??>${data.startTime?string('yyyy-MM-dd HH:mm:ss')}</#if>">
        </div>
        <div class="form-group">
            <label for="sketch">结束时间</label>
            <input type="text" name="endTime" class="form-control" placeholder="结束时间" id="endTime" readonly
                   value="<#if (data.endTime)??>${data.endTime?string('yyyy-MM-dd HH:mm:ss')}</#if>">
        </div>
        <div class="form-group">
            <label for="sketch">任务状态</label>
            <select class="form-control" id="status" name="status">
                <option value="0" <#if ((data.status)!0)==0>selected</#if>>未完成</option>
                <option value="1" <#if ((data.status)!0)==1>selected</#if>>已完成</option>
                <option value="2" <#if ((data.status)!0)==2>selected</#if>>进行中</option>
            </select>
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
    // 添加任务标签
    $("#taskLabel-insert").on("click", function () {
        layer.prompt({title: '添加任务标签'}, function (pass, index) {
            ajaxFunParam("/fyl/taskLabel/ajax/save", {'name': pass}, function (data) {
                if (data.status == 0) {
                    layer.close(index);
                }
            })
        });
    })
    // 添加执行人
    $("#member-insert").on("click", function () {
        openPageEnd('添加执行人', "/fyl/member/insert", function () {

        });
    })
    // 保存任务
    $("#fengyulou-save").on("click", function () {
        //获取项目id
        var pIds = projectId.getValue('valueStr');
        //获取任务标签id
        var tlIds = taskLabelId.getValue('valueStr');
        //获取执行人id
        var mIds = memberId.getValue('valueStr');
        //设置项目id
        $("#projectId").val(pIds);
        //设置任务标签id
        $("#taskLabelId").val(tlIds);
        //设置执行人id
        $("#memberId").val(mIds);
        ajaxFunParam("/fyl/task/ajax/save", $("#dataForm").serialize(), function (data) {
            msgFunCallBack(data.msg, function () {
                if (data.status == 0) {
                    closePage();
                }
            })
        })
    })
    //添加开始时间日期控件
    ctc("startTime");
    //添加结束时间日期控件
    ctc("endTime");
    //查询项目
    var projectId = cxsRadio("project-control", "/fyl/project/ajax/content", "请选择项目");
    //查询项目标签
    var taskLabelId = cxsRadio("taskLabel-control", "/fyl/taskLabel/ajax/content", "请选择任务标签");
    //查询人员
    var memberId = cxsRadio("member-control", "/fyl/member/ajax/content", "请选择执行人");
    //数据回显
    <#if ((data.id)??)>
    ajaxFunParam("/fyl/project/ajax/info", {"id": "${(data.projectId)}"}, function (data) {
        projectId.setValue([data]);
    })
    ajaxFunParam("/fyl/task/ajax/label", {"id": "${(data.taskLabelId)}"}, function (data) {
        taskLabelId.setValue([data]);
    })
    ajaxFunParam("/fyl/task/ajax/member", {"id": "${(data.memberId)}"}, function (data) {
        memberId.setValue([data]);
    })
    </#if>
</script>
</body>
</html>