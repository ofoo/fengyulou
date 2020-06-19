<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>字母和数字验证码</title>
</head>
<body>
<img src="/verificationCode" id="code">
<a href="javascript:void(0)" onclick="changeCode()">看不清？点我</a>
<script>
    function changeCode(){
        document.getElementById("code").src="/verificationCode?d="+new Date().getTime();
    }
</script>
</body>
</html>