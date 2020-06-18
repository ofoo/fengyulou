<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>导入Word结果</title>
    <style>
        .row-div{
            margin: 20px;
        }
    </style>
    <script>
        function bodyInit() {
            if ('${(result.msg)!}'){
                alert('${(result.msg)!}')
            }
        }
    </script>
</head>
<body onload="bodyInit();">
<div>
    <div class="row-div">
        标题：${result.title}
    </div>
    <div class="row-div">
        内容：${(result.content)!}
    </div>
</div>
</body>
</html>