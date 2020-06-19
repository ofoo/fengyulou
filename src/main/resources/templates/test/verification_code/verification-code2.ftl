<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>算术验证码</title>
</head>
<body>
<img src="/verificationCode2" id="code">
<a href="javascript:void(0)" onclick="changeCode()">看不清？点我</a>
<script>
    function changeCode(){
        document.getElementById("code").src="/verificationCode2?d="+new Date().getTime();
    }
</script>
</body>
</html>