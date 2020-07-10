$(function () {
    // 监听浏览器窗口变化
    window.addEventListener('resize', function () {
        if (resizeArray.length > 0) {
            for (var i in resizeArray) {
                verticalCenter(resizeArray[i]);
            }
        }
    })
    // 取消文本输入框自动补全功能
    $("input[type='text']").attr("autocomplete", "off");
    // 关闭页面
    $("#fengyulou-close").on("click", function () {
        closePage();
    })
    // 后退页面
    $("#fengyulou-retreat").on("click", function () {
        history.back()
    })
    // 修改用户密码
    $("#fengyulou-pwd").on("click", function () {
        updatePwd()
    })
    // 清空列表查询条件
    $('#fengyulou-clear').on('click', function () {
        $(".search-from input[type='text']").val("");
        $(".search-from select").val(-1)
    })
    // 日历控件
    $('.datepicker').datepicker({
        format: "yyyy-m-d",
        language: "zh-CN",
        autoclose: true,//选中之后自动隐藏日期选择框
        clearBtn: true,//清除按钮
        todayBtn: 'linked',//今日按钮
    });

    initCallBack();
})

//初始化回调
function initCallBack() {
    fuZhiBtnInit();
    xuanXiangInit();
    pagingInit();
}

//复制功能初始化
function fuZhiBtnInit() {
    var clipboard = new ClipboardJS('.copy', {
        text: function (trigger) {
            return $("#copyText" + $(trigger).attr("id")).text();
        }
    });
    clipboard.on('success', function (e) {
        // console.log(e);
        layer.msg("复制成功 ~~~", {time: 1200, icon: 6});
    });
    clipboard.on('error', function (e) {
        // console.log(e);
        layer.msg("复制失败 ~~~", {time: 1200, icon: 5});
    });
}

//复选框功能初始化
function xuanXiangInit() {
    $('.radio').iCheck({
        radioClass: 'iradio_square-blue',
    })
    $('.checkall,.checkbox').iCheck({
        checkboxClass: 'icheckbox_square-blue',
    })
    $('.checkall').on('ifClicked', function (event) {
        // 全选
        if (!event.target.checked) {
            $(".checkbox").iCheck('check');
        } else {
            $(".checkbox").iCheck('uncheck');
        }
    });
    $('.checkbox').on('ifChecked', function (event) {
        var len = $('.checkbox').length;
        var checkLen = $('.checkbox:checked').length;
        if (len == checkLen) {
            $(".checkall").iCheck('check');
        }
        var val = $(this).val();
        var input = '<input type="hidden" id="cb' + val + '" value="' + val + '" name="ids">';
        $('#dataForm').append(input);
    });
    $('.checkbox').on('ifUnchecked', function (event) {
        // 取消全选
        $(".checkall").iCheck('uncheck');
        var val = $(this).val();
        $('#cb' + val).remove();
    });
}

/**
 * 删除方法，带参数
 * @param url
 * @param param
 */
function delFun(url, param, callBack) {
    layer.confirm('是否删除？', {
        btn: ['是', '否'] //按钮
    }, function () {
        ajaxFunParam(url, param, callBack)
    });
}

//分页按钮初始化
function pagingInit() {
    $('#fengyulou-search,.page-search').on('click', function () {
        $('#pageNum').val($(this).data("page"))
        searchData()
    })
}

//查询数据方法
function searchData() {
}

/**
 * 打开页面
 * @param url
 */
function openPage(url) {
    layer.open({
        type: 2,
        area: ['100%', '100%'],
        fixed: false, //不固定
        scrollbar: false,
        title: false,
        closeBtn: false,
        shadeClose: true,
        content: url,
    })
}

//打开页面，带页面关闭回调
function openPageEnd(title, url, callBack) {
    // layer.closeAll('iframe');
    layer.open({
        type: 2,
        area: ['70%', '90%'],
        title: title,
        content: url,
        resize: false,
        // moveOut:true,
        // maxmin: true,
        // shade: 0,
        end: callBack,
        /*btn: ['保存', '重置', '关闭'],
        yes: function(index, layero){
            console.log(layero)
            //do something
            //layer.close(index); //如果设定了yes回调，需进行手工关闭
        },btn2: function(index, layero){
            //按钮【按钮二】的回调

            //return false 开启该代码可禁止点击该按钮关闭
        }
        ,btn3: function(index, layero){
            //按钮【按钮三】的回调

            //return false 开启该代码可禁止点击该按钮关闭
        }*/
    })
}

/**
 * 打开页面，带关闭按钮
 * @param url
 */
function openPageClose(url) {
    layer.open({
        type: 2,
        area: ['100%', '100%'],
        fixed: false, //不固定
        scrollbar: false,
        title: false,
        closeBtn: false,
        shadeClose: true,
        content: url,
        btn: ['关闭'], //可以无限个按钮
        yes: function () {
            layer.closeAll()
        }
    })
}

/**
 * 修改密码
 */
function updatePwd() {
    layer.prompt({title: "修改密码", formType: 1, maxlength: 255}, function (pass, index) {
        layer.close(index);
        ajaxFunParam("/fyl/user/ajaxUpdatePwd", {"pwd": pass}, function (data) {
            msgFunCallBack(data.msg, function () {
                if (data.status == 0) {
                    location.href = "/"
                }
            });
        })
    });
}

/**
 * 输入框
 * @param title
 * @param url
 * @param callBack
 */
function openPrompt(title, callBack) {
    layer.prompt({title: title, maxlength: 255}, function (pass, index) {
        layer.close(index)
        callBack(pass);
    })
}

/**
 * 输入框，带值
 * @param title
 * @param url
 * @param callBack
 */
function openPromptValue(title, value, callBack) {
    layer.prompt({title: title, maxlength: 255, value: value}, function (pass, index) {
        layer.close(index)
        callBack(pass);
    })
}

/**
 * 关闭页面，并刷新
 */
function closePageRefresh() {
    parent.location.reload()
}

/**
 * ajax，有参
 * @param url
 * @param data
 * @param callBack
 */
function ajaxFunParam(url, data, callBack) {
    $.ajax({
        url: url,
        type: "post",
        data: data,
        dataType: "json",
        success: callBack,
        error: function () {
            console.log('操作失败')
        }
    });
}

function ajax(url, data, success,error) {
    $.ajax({
        url: url,
        type: "post",
        data: data,
        dataType: "json",
        success: success,
        error: error
    });
}

/**
 * ajax，无参
 * @param url
 * @param data
 * @param callBack
 */
function ajaxFun(url, callBack) {
    $.ajax({
        url: url,
        type: "post",
        dataType: "json",
        success: callBack,
        error: function () {
            console.log('操作失败')
        }
    });
}

/**
 * ajax，有参
 * @param url
 * @param data
 * @param callBack
 */
function ajaxFunParamText(url, data, callBack) {
    $.ajax({
        url: url,
        type: "post",
        data: data,
        dataType: "text",
        success: callBack,
        error: function () {
            console.log('操作失败')
        }
    });
}

/**
 * ajax，无参
 * @param url
 * @param data
 * @param callBack
 */
function ajaxFunText(url, callBack) {
    $.ajax({
        url: url,
        type: "post",
        dataType: "text",
        success: callBack,
        error: function () {
            console.log('操作失败')
        }
    });
}

//ajax分页方法获取数据
var ajaxUrl;//记录上次ajax分页的url
var ajaxparameters;//记录上次ajax分页的参数
var ajaxcallBack;

function ajaxPage(url, parameters, pageNum, callBack) {
    ajaxUrl = url;
    ajaxparameters = parameters;
    ajaxcallBack = callBack;
    parameters = 'page.currentPage=' + pageNum + '' + parameters;
    $.ajax({
        type: "POST",
        dataType: "text",
        url: baselocation + url,
        data: parameters,
        cache: true,
        async: false,
        success: callBack
    });
}

//点击分页
function goPageAjax(pageNum) {
    ajaxPage(ajaxUrl, ajaxparameters, pageNum, ajaxcallBack);
}

function aaa() {
    var s = $('#file')[0].files[0];
    var formData = new FormData();
    formData.append("file_data", s);
    formData.append("type", "1");
    $.ajax({
        url: "SpringMVC/fileUpload",
        type: 'POST',
        cache: false,
        data: formData,
        processData: false,
        contentType: false,
        success: function (result) {
        },
        error: function (err) {
        }
    });
}

/**
 * 提示,有回调
 * @param msg
 * @param callBack
 */
function msgFunCallBack(msg, callBack) {
    layer.msg(msg, {
        time: 1000,
        // offset: 't',
    }, callBack)
}

/**
 * 提示，无回调
 * @param msg
 */
function msgFun(msg) {
    layer.msg(msg, {
        time: 1000,
        // offset: 't',
    })
}

/**
 * 检查是否选择数据
 * @param msg
 */
function checkSelect(msg) {
    var length = $(".checkbox:checked").length;
    if (length == 0) {
        msgFun(msg);
        return false;
    }
    return true;
}

// 设置浏览器垂直居中
function verticalCenter(str) {
    var windowHeight = $(window).height();
    var weizhi = windowHeight / 2;
    var boxHeight = $(".box").height();
    var shiji = weizhi - boxHeight / 2;
    $(str).css({
        'margin-top': shiji + 'px'
    })
    $(str).fadeIn();
}

var resizeArray = new Array();

//关闭页面
function closePage() {
    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
    parent.layer.close(index); //再执行关闭
}

//创建时间控件
function ctc(id) {
    laydate.render({
        elem: '#' + id //指定元素
        , type: 'datetime'
        , theme: '#393D49'
        ,trigger: 'click'
    });
}

//创建xm-select下拉选
function cxs(id,url,tips){
    xmSelect.render({
        el: '#'+id,
        //配置搜索
        filterable: true,
        //配置远程分页
        paging: true,
        pageRemote: true,
        //数据处理
        remoteMethod: function (val, cb, show, pageIndex) {
            //val: 搜索框的内容, 不开启搜索默认为空, cb: 回调函数, show: 当前下拉框是否展开, pageIndex: 当前第几页

            //这里的axios类似于ajax
            ajax(url, {
                "name": val,
                "pageNum": pageIndex,
            }, function (response) {
                if (response.status == 0) {
                    //这里是success的处理
                    var res = response.data;
                    //回调需要两个参数, 第一个: 数据数组, 第二个: 总页码
                    cb(res.list, res.pages)
                }
            }, function () {
                cb([], 0)
            })
        }
        ,tips: tips
        ,theme: {
            color: '#337ab7',
        }
    })
}