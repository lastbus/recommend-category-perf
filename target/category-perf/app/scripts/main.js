$(function() {

    $.get($("#dashboard-page").attr("href"), function(response) {
        $('#main-content').html(response);
        $('#page-sidebar-menu').find('li.active').removeClass('active open');
        $("#dashboard-page").parentsUntil('.page-sidebar-menu').filter('.nav-item').addClass('active open');
    });
	
    $('#page-sidebar-menu li a').click(function(e) {
        e.preventDefault();
        var url = this.href;
        var a = $(this);
        if (url != null && url != 'javascript:;' && url != undefined) {
            $.get(url, function(response) {
                $('#main-content').html(response);
                $('#page-sidebar-menu').find('li.active').removeClass('active open');
                a.parentsUntil('.page-sidebar-menu').filter('.nav-item').addClass('active open');
            });
        }
    });
});