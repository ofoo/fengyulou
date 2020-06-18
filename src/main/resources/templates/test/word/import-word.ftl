<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>导入Word</title>
    <style>
        form {
            margin: 50px auto;
            width: 500px;
            border: 1px solid #ccc;
            padding: 20px;
        }

        .input-div {
            margin: 20px;
        }
    </style>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="/importWord">
    <div class="input-div">
        <h1>导入Word</h1>
    </div>
    <div class="input-div">
        <input name="title" type="text" autocomplete="off">
    </div>
    <div class="input-div">
        <input name="word" type="file">
    </div>
    <div class="input-div">
        <input type="submit" value="上传">
    </div>
</form>
</body>
</html>