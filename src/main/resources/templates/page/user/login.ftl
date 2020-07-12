<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <#assign title="登录"/>
    <#include "../../common/header-script.ftl">
    <style>
        body {
            background-color: #f4f4f4;
        }

        .box {
            display: none;
        }

        .well {
            background-color: #ffffff;
            padding: 0 20px;
            margin: 0;
        }

        .glyphicon {
            margin-right: 0;
        }

        .page-header {
            margin: 0 0 20px 0;
            padding: 0;
        }

        h1 {
            margin: 0;
        }

        .panel .panel-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 35px;
        }
    </style>
</head>
<body>
<div class="row box">
    <div class="col-md-offset-4 col-md-4">
        <form id="dataForm">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="text-muted">风雨楼</h1>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group input-group-lg">
                    <span class="input-group-addon" id="basic-addon1">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    </span>
                            <input type="text" name="loginName" class="form-control" placeholder="账号" value="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group input-group-lg">
                    <span class="input-group-addon" id="basic-addon1">
                        <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                    </span>
                            <input type="password" name="password" class="form-control" placeholder="密码" value="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-12">
                        <button id="fengyulou-login" type="button" class="btn btn-primary btn-block btn-lg">登录</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<#--<table id="table">

</table>-->

<#include "../../common/footer-script.ftl">
<script>
    // var myObject = [{'name':'Kasun', 'address':'columbo','age': '29'},{'name':'Kasun', 'address':'columbo','age': '29'}]
    /*function get(obj){
        if (obj instanceof Array){

        }else{
            $("#table").append(obj.)
        }
    }*/
    $(function () {
        // get(myObject)
        // var count = Object.keys(myObject).length;
        // console.log(count);

        $("#fengyulou-login").on("click", function () {
            ajaxFunParam("/fyl/user/ajaxLogin", $("#dataForm").serialize(), function (data) {
                msgFunCallBack(data.msg, function () {
                    if (data.status == 0) {
                        location.href = '/fyl/task/list';
                    }
                })
            })
        })
        verticalCenter(".box");
        resizeArray.push('.box');
    })
</script>
</body>
</html>