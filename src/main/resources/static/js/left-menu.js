$(function () {
    var leftMenu = '<ul>';
    var pathname = location.pathname;
    var li = "";
    //任务管理
    if (pathname == '/fyl/task/list/page') {
        li += '<li><span class="text-primary">任务管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/task/list/page" class="text-primary">任务列表</a></dt><dt><a href="/fyl/taskLabel/list/page">任务标签</a></dt></dl></li>'
    }
    else if (pathname == '/fyl/taskLabel/list/page') {
        li += '<li><span class="text-primary">任务管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/task/list/page">任务列表</a></dt><dt><a href="/fyl/taskLabel/list/page" class="text-primary">任务标签</a></dt></dl></li>'
    }
    else{
        li += '<li><span>任务管理<i class="icon"></i></span><dl><dt><a href="/fyl/task/list/page">任务列表</a></dt><dt><a href="/fyl/taskLabel/list">任务标签</a></dt></dl></li>'
    }
    //知识列表
    if (pathname == '/fyl/instruct/list') {
        li += '<li><span class="text-primary">知识管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/instruct/list" class="text-primary">指令列表</a></dt><dt><a href="/fyl/knowledge/list">知识列表</a></dt></dl></li>'
    }
    else if (pathname == '/fyl/knowledge/list'){
        li += '<li><span class="text-primary">知识管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/instruct/list">指令列表</a></dt><dt><a href="/fyl/knowledge/list" class="text-primary">知识列表</a></dt></dl></li>'
    }
    else{
        li += '<li><span>知识管理<i class="icon"></i></span><dl><dt><a href="/fyl/instruct/list">指令列表</a></dt><dt><a href="/fyl/knowledge/list">知识列表</a></dt></dl></li>'
    }
    //云服务器
    if (pathname == '/fyl/computer/list/page') {
        li += '<li><span class="text-primary">云服务器<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/computer/list/page" class="text-primary">机器列表</a></dt></dl></li>';
    }
    else{
        li += '<li><span>云服务器<i class="icon"></i></span><dl><dt><a href="/fyl/computer/list/page">机器列表</a></dt></dl></li>';
    }
    //人员管理
    if (pathname == '/fyl/member/list/page') {
        li += '<li><span class="text-primary">人员管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/member/list/page" class="text-primary">人员列表</a></dt><dt><a href="/fyl/memberLabel/list/page">人员标签</a></dt></dl></li>';
    }
    else if (pathname == '/fyl/memberLabel/list/page') {
        li += '<li><span class="text-primary">人员管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/member/list/page">人员列表</a></dt><dt><a href="/fyl/memberLabel/list/page" class="text-primary">人员标签</a></dt></dl></li>';
    }
    else{
        li += '<li><span>人员管理<i class="icon"></i></span><dl><dt><a href="/fyl/member/list/page">人员列表</a></dt><dt><a href="/fyl/memberLabel/list/page">人员标签</a></dt></dl></li>';
    }
    //项目管理
    if (pathname == '/fyl/project/list/page') {
        li += '<li><span class="text-primary">项目管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/project/list/page" class="text-primary">项目列表</a></dt></dl></li>';
    }
    else{
        li += '<li><span>项目管理<i class="icon"></i></span><dl><dt><a href="/fyl/project/list/page">项目列表</a></dt></dl></li>';
    }
    //用户管理
    if (pathname == '/fyl/user/list/page') {
        li += '<li><span class="text-primary">用户管理<i class="icon action"></i></span><dl style="display: block;"><dt><a href="/fyl/user/list/page" class="text-primary">用户列表</a></dt></dl></li>';
    }
    else{
        li += '<li><span>用户管理<i class="icon"></i></span><dl><dt><a href="/fyl/user/list/page">用户列表</a></dt></dl></li>';
    }
    leftMenu += li;
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
        $(this).find("dl").slideToggle(200).parent().siblings().find("dl").slideUp(200);
        $(this).find("span i").toggleClass('action').parents().siblings().find("span i").removeClass('action');
    })
})