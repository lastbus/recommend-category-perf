<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="${basePath}/assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/assets/plugins/bootstrap-table/css/bootstrap-table.min.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/assets/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/assets/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/assets/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/assets/plugins/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet"  type="text/css"/>
    <link href="${basePath}/assets/css/mycss.css" rel="stylesheet"  type="text/css"/>
</head>
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
                <a class="caption-subject bold uppercase font-blue" id="category-compare" href="javascript:;">品类对比</a>
            </div>
            <div class="portlet-body col-md-12">
                <div class="form-group col-md-6">
                    <table class="table table-bordered" id="categoryBasicTable">
                        <caption>
                            <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto">
                            </div>
                            <div  style="text-align: center;background-color: #2f405c; height: 30px; margin: auto">
                                <span class="caption-subject bold uppercase" style=" font-size:19px;color:white">自有类目</span>
                            </div>
                        </caption>
                        <tbody >
                        <tr>
                            <th>类目</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>sku数</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>品牌数</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>最高价格</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>最低价格</th>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="form-group col-md-6">
                    <table class="table table-bordered" id="categoryYhdTable">
                        <caption>
                            <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto">
                            </div>
                            <div  style="text-align: center;background-color: #2f405c; height: 30px; margin: auto">
                                <span class="caption-subject bold uppercase" style=" font-size:19px;color:white">一号店类目</span>
                            </div>
                        </caption>
                        <tbody >
                        <tr >
                            <td></td>
                            <th style="text-align: right">类目</th>
                        </tr>
                        <tr>
                            <td></td>
                            <th style="text-align: right">sku数</th>
                        </tr>
                        <tr>
                            <td></td>
                            <th style="text-align: right">品牌数</th>
                        </tr>
                        <tr>
                            <td></td>
                            <th style="text-align: right">最高价格</th>
                        </tr>
                        <tr>
                            <td></td>
                            <th style="text-align: right">最低价格</th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="portlet-body col-md-12">
                <div class="form-group col-md-12">
                    <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto">
                    </div>
                    <div  style="text-align: center;background-color: #2f405c; height: 30px; margin: auto">
                        <span class="caption-subject bold uppercase" style=" font-size:19px;color:white">品牌对比</span>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="categoryBrandTable"></table>
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
<script src="${basePath}/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>

<script src="${basePath}/assets/plugins/ztree/js/jquery.ztree.core.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/ztree/js/jquery.ztree.all.js" type="text/javascript"></script>

<script src="${basePath}/assets/scripts/echarts/echarts.min.js" type="text/javascript"></script>

<script type="text/javascript">
    var categoryPerformanceDetail_info = function(){
        var tableCategoryBasic = function () {
            $.ajax({
                type: 'post',
                async: true,
                url: "${basePath}/category/categoryBasic",
                data: {categorySid: $("#categoryId").val()},
                dataType: "json",
                success: function(result) {
                    $("#categoryBasicTable tr").eq(0).find("td").eq(0).html(result.yhdCategoryTree);
                    $("#categoryBasicTable tr").eq(1).find("td").eq(0).html(parseFloat(result.totalGoodsNum-result.offTheShelfGoodsNum).toLocaleString());
                    $("#categoryBasicTable tr").eq(2).find("td").eq(0).html(parseFloat(result.brandNum).toLocaleString());
                    $("#categoryBasicTable tr").eq(3).find("td").eq(0).html(parseFloat(result.highestPrice).toLocaleString());
                    $("#categoryBasicTable tr").eq(4).find("td").eq(0).html(parseFloat(result.lowestPrice).toLocaleString());
                }
            });
            $.ajax({
                type: 'post',
                async: true,
                url: "${basePath}/category/categoryYhdBasic",
                data: {categoryId: $("#categoryId").val()},
                dataType: "json",
                success: function(result) {
                    $("#categoryYhdTable tr").eq(0).find("td").eq(0).html(result.categoryName);
                    $("#categoryYhdTable tr").eq(1).find("td").eq(0).html(parseFloat(result.goodsnum).toLocaleString());
                    $("#categoryYhdTable tr").eq(2).find("td").eq(0).html(parseFloat(result.brandsnum).toLocaleString());
                    $("#categoryYhdTable tr").eq(3).find("td").eq(0).html(parseFloat(result.maxPrice).toLocaleString());
                    $("#categoryYhdTable tr").eq(4).find("td").eq(0).html(parseFloat(result.minPrice).toLocaleString());
                }
            });
        };
        var tableCategoryBrands = function () {
            var url = '${basePath}/category/categoryBrands';
            var option = {
                url: url,  //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: function (params) {   ////传递参数（*）
                    var p = {
                        limit: params.limit,   //页面大小
                        offset: params.offset,  //页码
                        categoryId: $("#categoryId").val()
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
                clickToSelect: false,                //是否启用点击选中行
                height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                 //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                checkboxHeader: false,
                columns: [{
                    field: 'categorySid',
                    title: '品类ID'
                },{
                    field: 'categoryName',
                    title: '品类名'
                },{
                    field: 'blBrand',
                    title: '自有品牌'
                },{
                    field: 'yhdBrand',
                    title: '一号店品牌'
                },{
                    field: 'yhdCateUrl',
                    title: '一号店URL'
                }]
            };
            $("#categoryBrandTable").bootstrapTable(option);

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
            $("#category-compare").click(function() {
                var data = {
                    categoryId: $("#categoryId").val()
                };
                toMainPage("${basePath}/category/categoryCompare.html", data);
            });


        };
        return {
            init: function () {
                tableCategoryBasic();
                tableCategoryBrands();
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
