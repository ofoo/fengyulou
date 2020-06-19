<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>验证码对比分析</title>
    <style>
        #code{
            height: 30px;
        }
    </style>
</head>
<body>
<form action="">
    <p><input type="text" name="kaptcha" id="code" maxlength="4" placeholder="请输入验证码"><img src="/verificationCode" id="changecode"></p>
    <p><input type="button" value="登录" id="login"></p>
    <div id="result"></div>
</form>
<script src="/js/jquery-1.12.4.min.js"></script>
<script>
    $(function () {
        $("#changecode").on("click", function () {
            $(this).attr("src", "/verificationCode?d=" + new Date().getTime());
        })
        //给登录按钮绑定点击事件
        $("#login").on("click",function(){
            //获取用户输入的验证码
            var code = $("#code").val();
            var params={"code":code};
            $.post("/verificationTest",params,function(data){
                if (data == "success") {
                    $("#result").html("验证码输入正确");
                }else{
                    $("#result").html("验证码输入有误，请重新输入...");
                    $("#code").val("").focus();
                }
            })
        })
    })
</script>
</body>
</html>