<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>导出Word</title>
    <style>
        form {
            margin: 50px auto;
            width: 500px;
            border: 1px solid #ccc;
            padding: 20px;
        }
        .row-div{
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<form id="dataForm" method="post" action="/exportWord">
    <input type="hidden" name="isDocx" id="isDocx">
    <div class="row-div">
        <h1>导出Word</h1>
    </div>
    <div class="row-div">
        姓名：<input type="text" name="name" autocomplete="off" value="张三">
    </div>
    <div class="row-div">
        年龄：<input type="text" name="age" autocomplete="off" value="20">
    </div>
    <div class="row-div">
        时间：<input type="text" name="time" autocomplete="off" value="2016-01-01">
    </div>
    <div class="row-div">
        <input type="button" onclick="document.getElementById('isDocx').value='';document.getElementById('dataForm').submit()" value="导出03">
        <input type="button" onclick="document.getElementById('isDocx').value='1';document.getElementById('dataForm').submit()" value="导出07">
    </div>
</form>
</body>
</html>