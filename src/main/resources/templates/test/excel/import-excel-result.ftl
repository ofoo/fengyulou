<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>导入Excel结果</title>
    <style>

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
    <div>
        ${result.title}
    </div>
    <div>
        <table>
            <thead>
            <th>序号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>出生日期</th>
            </thead>
            <tbody>
            <#list result.studentList as item>
            <tr>
                <td>${item_index+1}</td>
                <td>${item.name}</td>
                <td>${item.age}</td>
                <td>${item.time?date}</td>
            </tr>
            </#list>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>