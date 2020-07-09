<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta文档*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>演示</title>

    <!-- Bootstrap -->
    <#--<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <!--<script src="/bootstrap/js/html5shiv.min.js"></script>
    <script src="/bootstrap/js/respond.min.js"></script>-->
    <![endif]-->
</head>
<body>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="/bootstrap/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<#--<script src="/bootstrap/js/bootstrap.min.js"></script>-->
<script src="/layer/layer.js"></script>
<script>
    $(function () {
        /*layer.open({
            type: 2,
            area: ['50%', '60%'],
            fixed: false, //不固定
            scrollbar: false,
            title: '添加任务',
            closeBtn: true,
            content: '/fyl/task/insert',
            // end: callBack
        })*/
        layer.open({
            type: 2,
            title: 'layer mobile页',
            shadeClose: true,
            shade: 0.8,
            area: ['380px', '90%'],
            content: '/fyl/task/insert' //iframe的url
        });
    })
</script>
</body>
</html>