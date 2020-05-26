$(function () {
    var leftMenu = '<ul>';
    var pathname = location.pathname;
    var li1 = "";
    if (pathname == '/fyl/task/list/page') {
        li1 = '<li><span class="text-primary">任务管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/task/list/page" class="text-primary">任务列表</a></dt><dt><a href="/fyl/taskLabel/list/page">任务标签</a></dt></dl></li>'
    }
    else if (pathname == '/fyl/taskLabel/list/page') {
        li1 = '<li><span class="text-primary">任务管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/task/list/page">任务列表</a></dt><dt><a href="/fyl/taskLabel/list/page" class="text-primary">任务标签</a></dt></dl></li>'
    }
    else{
        li1 = '<li><span>任务管理<i class="icon"></i></span><dl><dt><a href="/fyl/task/list/page">任务列表</a></dt><dt><a href="/fyl/taskLabel/list/page">任务标签</a></dt></dl></li>'
    }
    var li2 = "";
    if (pathname == '/fyl/computer/list/page') {
        li2 = '<li><span class="text-primary">云服务器<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/computer/list/page" class="text-primary">机器列表</a></dt></dl></li>';
    }
    else{
        li2 = '<li><span>云服务器<i class="icon"></i></span><dl><dt><a href="/fyl/computer/list/page">机器列表</a></dt></dl></li>';
    }
    var li3 = "";
    if (pathname == '/fyl/member/list/page') {
        li3 = '<li><span class="text-primary">人员管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/member/list/page" class="text-primary">人员列表</a></dt><dt><a href="/fyl/memberLabel/list/page">人员标签</a></dt></dl></li>';
    }
    else if (pathname == '/fyl/memberLabel/list/page') {
        li3 = '<li><span class="text-primary">人员管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/member/list/page">人员列表</a></dt><dt><a href="/fyl/memberLabel/list/page" class="text-primary">人员标签</a></dt></dl></li>';
    }
    else{
        li3 = '<li><span>人员管理<i class="icon"></i></span><dl><dt><a href="/fyl/member/list/page">人员列表</a></dt><dt><a href="/fyl/memberLabel/list/page">人员标签</a></dt></dl></li>';
    }
    var li4 = "";
    if (pathname == '/fyl/project/list/page') {
        li4 = '<li><span class="text-primary">项目管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/project/list/page" class="text-primary">项目列表</a></dt></dl></li>';
    }
    else{
        li4 = '<li><span>项目管理<i class="icon"></i></span><dl><dt><a href="/fyl/project/list/page">项目列表</a></dt></dl></li>';
    }
    var li5 = "";
    if (pathname == '/fyl/user/list/page') {
        li5 = '<li><span class="text-primary">用户管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/user/list/page" class="text-primary">用户列表</a></dt></dl></li>';
    }
    else{
        li5 = '<li><span>用户管理<i class="icon"></i></span><dl><dt><a href="/fyl/user/list/page">用户列表</a></dt></dl></li>';
    }
    leftMenu += li1;
    leftMenu += li2;
    leftMenu += li3;
    leftMenu += li4;
    leftMenu += li5;
    leftMenu += '</ul>';
    $(".menu").append(leftMenu);
// <ul>
//
//
//
//
//     <#if curUser.type==1>
//
//     </#if>
//     </ul>


    // 左侧导航
    $(".menu ul li").click(function () {
        $(this).find("dl").slideToggle("fast").parent().siblings().find("dl").slideUp("fast");
        $(this).find("span i").toggleClass('action').parents().siblings().find("span i").removeClass('action');
    })
})