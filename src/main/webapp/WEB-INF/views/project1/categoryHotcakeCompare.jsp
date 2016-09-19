<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="${basePath}/assets/plugins/bootstrap-table/css/bootstrap-table.min.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/assets/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/assets/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/assets/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" /></head>
<body>

<input type="hidden" id="categoryId" value="${categoryId}">

<div class="row">
    <div class="col-md-12">
        <div class="portlet light ">
            <div class="caption" style="height:30px;">
                <i class="icon-settings font-black"></i>
                <a class="caption-subject bold uppercase font-black" id="category-score" href="javascript:;">品类绩效</a>
                <span class="caption-subject bold uppercase font-blue"> > </span>
                <a class="caption-subject bold uppercase font-blue" id="category-detail" href="javascript:;">品类详细信息</a>
                <span class="caption-subject bold uppercase font-blue"> > </span>
                <a class="caption-subject bold uppercase font-blue" id="category-hotcakeCompare" href="javascript:;">爆款对比</a>
            </div>
            <div class="portlet-body">
                <div class="form-group form-horizontal">
                    <div class="col-md-6">
                        <select class="col-md-2" id="selectMonth" style="margin:0;border:0;padding:0;text-align: center; background-color: #2f405c; height: 45px; margin: auto ;color:white";></select>
                        <div class="col-md-10" style="margin:0;border:0;padding:0;">
                            <div style="text-align: center; background-color: #2f405c; height: 15px; margin: auto"></div>
                            <div style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                                <span class="caption-subject bold uppercase" style="font-size:19px;color:white">自有品类爆款</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto"></div>
                        <div  style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                            <span class="caption-subject bold uppercase" style="font-size:19px;color:white">一号店品类爆款</span>
                        </div>
                    </div>
                </div>
                <div class="form-horizontal form-group" >
                    <div class="col-md-6">
                        <table class="table table-striped table-bordered table-hover" id="categoryHotcakeTable"></table>
                    </div>
                    <div class="col-md-6">
                        <table class="table table-striped table-bordered table-hover" id="categoryYhdItemsTable"></table>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="portlet-body">
                <div class="row">
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${basePath}/assets/plugins/bootstrap-table/js/bootstrap-table.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>

<script src="${basePath}/assets/scripts/echarts/echarts.min.js" type="text/javascript"></script>

<script type="text/javascript">
    var categoryPerformanceDetail_info = function(){
        var tableCategoryHotcakes = function () {
            $.ajax({
                type : "post",
                url : "${basePath}/category/getCategoryHotcakesMonth",
                data : {categorySid: $("#categoryId").val()},
                dataType : "json",
                success : function (result) {
                    var months = result.months;
                    $("<option value='all'>全部月份</option>").appendTo("#selectMonth");
                    if (months != null && months.length > 0) {
                        for (var i = 0; i < months.length; i++) {
                            $("<option value='" + months[i] + "'>" + months[i] + "</option>").appendTo("#selectMonth");
                        }
                    }
                }
            });
            var url = '${basePath}/category/categoryHotcakes';
            var option = {
                url: url,  //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortOrder: "desc",                   //排序方式
                queryParams: function (params) {   ////传递参数（*）
                    var p = {
                        limit: params.limit,   //页面大小
                        offset: params.offset,  //页码
                        column: params.sort,
                        order: params.order,
                        categoryid: $("#categoryId").val(),
                        month: $("#selectMonth").val()
                    };
                    return p;
                },
                queryParamsType: 'limit',
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: false,
                showColumns: false,                  //是否显示所有的列
                showRefresh: false,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                height: 470,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高
                clickToSelect: false,                //是否启用点击选中行
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                checkboxHeader: false,
                columns: [/*{
                 checkbox: true
                 }, */{
                    field: 'month',
                    title: '月份',
                    sortable:true
                }, {
                    field: 'goodsSid',
                    title: '商品ID'
                }, {
                    field: 'goodsSaleName',
                    title: '商品名'
                }, {
                    field: 'rank',
                    title: '排名',
                    width: '20px',
                    sortable:true
                }, {
                    field: 'goodsSalePrice',
                    title: '价格',
                    sortable:true
                }, {
                    field: 'saleAmount',
                    title: '销售',
                    sortable:true
                }]
            };
            $("#categoryHotcakeTable").bootstrapTable(option);
            //根据表头排序
            $('#categoryHotcakeTable').on('sort.bs.table', function (e, name, order) {});
        };
        var tableCategoryYhdItemsTable = function () {
            var url = '${basePath}/category/categoryYhdItems';
            var option = {
                url: url,  //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortOrder: "desc",                   //排序方式
                queryParams: function (params) {   ////传递参数（*）
                    var p = {
                        limit: params.limit,   //页面大小
                        offset: params.offset,  //页码
                        column: params.sort,
                        order: params.order,
                        categoryid: $("#categoryId").val(),
                    };
                    return p;
                },
                queryParamsType: 'limit',
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: false,
                showColumns: false,                  //是否显示所有的列
                showRefresh: false,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                height: 470,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高
                clickToSelect: false,                //是否启用点击选中行
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                checkboxHeader: false,
                columns: [/*{
                 checkbox: true
                 }, */{
                    field: 'goodsName',
                    title: '商品名',
                }, {
                    field: 'price',
                    title: '价格',
                    sortable:true
                }, {
                    field: 'comment',
                    title: '评论数',
                    sortable:true
                }, {
                    field: 'favorableRate',
                    title: '好评率',
                    width: '20px',
                    sortable:true
                }, {
                    field: 'seller',
                    title: '商家',
                    width: '20px',
                    sortable:true
                }]
            };
            $("#categoryYhdItemsTable").bootstrapTable(option);
            //根据表头排序
            $('#categoryYhdItemsTable').on('sort.bs.table', function (e, name, order) {});
        };
        var clickBt = function(){
            $("#category-score").click(function() {
                toMainPage("${basePath}/category/categoryPerformance.html");
            });
            $("#category-detail").click(function() {
                var data = {
                    categoryId: $("#categoryId").val()
                };
                toMainPage("${basePath}/category/categoryPerformanceDetail.html", data);
            });
            $("#category-hotcakeCompare").click(function() {
                var data = {
                    categoryId: $("#categoryId").val()
                };
                toMainPage("${basePath}/category/categoryHotcakeCompare.html", data);
            });
            $("#selectMonth").change(function () {
                $("#categoryHotcakeTable").bootstrapTable("refresh");
            });

        };
        return {
            init: function () {
                tableCategoryHotcakes();
                tableCategoryYhdItemsTable();
                clickBt();
            }
        };
    }();
    jQuery(document).ready(function () {
        categoryPerformanceDetail_info.init();
    });
</script>
</body>
</html>
