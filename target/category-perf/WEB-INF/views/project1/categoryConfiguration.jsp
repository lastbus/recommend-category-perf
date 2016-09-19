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
    <link href="${basePath}/assets/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/assets/plugins/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet"  type="text/css"/>
</head>
<body>

<input type="hidden" id="parentId" value="">

<div class="row">
    <div class="col-md-12">
        <div class="portlet light ">
            <div class="caption font-black">
                <i class="icon-settings font-black"></i>
                <span class="caption-subject bold uppercase" id="category-score">品类配置</span>
            </div>
            <div class="portlet-body">
                <div class="col-md-12">
                    <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto">
                    </div>
                    <div  style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                        <span class="caption-subject bold uppercase" style="font-size:19px;color:white">品类配置</span>
                    </div>
                </div>

                <div class="form-group col-md-4">
                    <div  style="text-align: center; height: 30px; margin: auto">
                        <span class="caption-subject bold uppercase" style=" font-size:19px;">配置表</span>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="categoryConfTable"></table>
                </div>
                <div class="form-group col-md-8">
                    <div  style="text-align: center;height: 30px; margin: auto">
                        <span class="caption-subject bold uppercase" style=" font-size:19px;">详细配置表</span>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="categoryConfDetailTable"></table>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="portlet-body">
                <div class="form-group col-md-12">
                    <div  style="text-align: center; height: 30px; margin: auto">
                        <span class="caption-subject bold uppercase" style=" font-size:19px;">注释表</span>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="categoryNoteTable"></table>
                </div>
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

<script type="text/javascript">
    var categoryPerformance_info = function(){
        var table_categoryConf = function () {
            var url = '${basePath}/category/categoryConf';
            var option = {
                url: url,  //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: false,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: function (params) {   ////传递参数（*）
                    var p = {
                        limit: 5,   //页面大小
                        offset: 0,  //页码
                        column: params.sort,
                        order: params.order
                    };
                    return p;
                },
                queryParamsType: 'limit',
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: false,
                showColumns: false,                  //是否显示所有的列
                showRefresh: false,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: false,                //是否启用点击选中行
                height: 188,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                 //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                checkboxHeader: false,
                columns: [{
                    field: 'components',
                    title: '分项'
                }, {
                    field: 'meaning',
                    title: '意义'
                }, {
                    field: 'weight',
                    title: '权重',
                },{
                    field: 'edit',
                    width: '30px',
                    title: '编辑',
                    events: {
                        'click .edit': function (e, value, row, index) {
                            var data = {
                                categoryId: row.categorySid
                            };

                        }
                    },
                    formatter: function() {
                        var operate =
                                '<a href="javascript:void(0);" class="edit" title="编辑">' +
                                '<span class="glyphicon glyphicon-pencil"/></a>'
                        return operate;
                    }
                }]
            };
            $("#categoryConfTable").bootstrapTable(option);
            //根据表头排序
            $('#categoryConfTable').on('sort.bs.table', function (e, name, order) {
            });
        };
        var table_categoryConfDetail = function () {
            var url = '${basePath}/category/categoryConfDetail';
            var option = {
                url: url,  //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: false,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: function (params) {   ////传递参数（*）
                    var p = {
                        limit: 20,
                        offset: 0
                    };
                    return p;
                },
                queryParamsType: 'limit',
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: false,
                showColumns: false,                  //是否显示所有的列
                showRefresh: false,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: false,                //是否启用点击选中行
                height: 548,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                 //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                checkboxHeader: false,
                columns: [{
                    field: 'components',
                    title: '分项'
                }, {
                    field: 'subComp',
                    title: '子项'
                }, {
                    field: 'meaning',
                    title: '意义',
                },{
                    field: 'weight',
                    title: '权重',
                },{
                    field: 'edit',
                    width: '30px',
                    title: '编辑',
                    events: {
                        'click .edit': function (e, value, row, index) {
                            var data = {
                                categoryId: row.categorySid
                            };

                        }
                    },
                    formatter: function() {
                        var operate =
                                '<a href="javascript:void(0);" class="edit" title="编辑">' +
                                '<span class="glyphicon glyphicon-pencil"/></a>'
                        return operate;
                    }
                }]
            };
            $("#categoryConfDetailTable").bootstrapTable(option);
            //根据表头排序
            $('#categoryConfDetailTable').on('sort.bs.table', function (e, name, order) {
                //   $("#categoryTable").bootstrapTable("refresh");
            });
        };
        var table_categoryNote = function () {
            var url = '${basePath}/category/categoryNote';
            var option = {
                url: url,  //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: false,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: function (params) {   ////传递参数（*）
                    var p = {
                        limit: 20,   //页面大小
                        offset: 0,  //页码
                    };
                    return p;
                },
                queryParamsType: 'limit',
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: false,
                showColumns: false,                  //是否显示所有的列
                showRefresh: false,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: false,                //是否启用点击选中行
                height: 730,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                 //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                checkboxHeader: false,
                columns: [{
                    field: 'subitem',
                    title: '子项'
                }, {
                    field: 'comment',
                    title: '注释'
                }]
            };
            $("#categoryNoteTable").bootstrapTable(option);
            //根据表头排序
            $('#categoryNoteTable').on('sort.bs.table', function (e, name, order) {
                //   $("#categoryTable").bootstrapTable("refresh");
            });
        };
        return {
            init: function () {
                table_categoryConf();
                table_categoryConfDetail();
                table_categoryNote();
            }
        };
    }();
    jQuery(document).ready(function () {
        categoryPerformance_info.init();
    });
</script>
</body>
</html>
