$(function () {
    $('.page-search').on('click', function () {
        $('#pageNum').val($(this).data("page"))
        searchData()
    })

    $('.radio').iCheck({
        radioClass: 'iradio_square-blue',
    })

    $('.checkall,.checkbox').iCheck({
        checkboxClass: 'icheckbox_square-blue',
    })

    // 全选
    $('.checkall').on('ifClicked', function (event) {
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

    // 取消全选
    $('.checkbox').on('ifUnchecked', function (event) {
        $(".checkall").iCheck('uncheck');
        var val = $(this).val();
        $('#cb' + val).remove();
    });
})