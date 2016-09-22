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
                <a class="caption-subject bold uppercase font-blue" id="category-detail" href="javascript:;">品类详细信息</a>
                <span class="caption-subject bold uppercase font-blue"> > </span>
                <a class="caption-subject bold uppercase font-blue" id="category-suggest" href="javascript:;">选品建议</a>
            </div>
            <div class="col-md-12">
                <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto">
                </div>
                <div  style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                    <span class="caption-subject bold uppercase" style="font-size:19px;color:white">选品建议</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-12 " style="height:400px;" id="comparePrice" ></div>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="form-group" >
                <div class="form-horizontal form-group" >
                    <div class="col-md-12">
                        <div class="col-md-11" style="margin:0;border:0;padding:0;text-align: center; background-color: #2f405c; height: 45px; margin: auto ;color:white";>
                            <div style="text-align: center; background-color: #2f405c; height: 15px; margin: auto"></div>
                            <div style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                                <span class="caption-subject bold uppercase" style="font-size:19px;color:white">一号店热销商品</span>
                            </div>
                        </div>
                        <div class="col-md-1" style="margin:0;border:0;padding:0;text-align: right; background-color: #2f405c; height: 45px; margin: auto ;color:white";>
                            <div style="text-align: center; background-color: #2f405c; height: 10px; margin: auto"></div>
                            <a href="javascript:;" id="expendYhdHotsale" class="btn" style="height: 35px; margin: auto ;color:white" >
                                <i class="glyphicon glyphicon-resize-vertical"></i>展开</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" id="divExpendYhdHotsale">
                    <table class="table table-striped table-bordered table-hover" id="categoryYhdItemsTable"></table>
                </div>
            </div>
            <div class="col-md-12" id="divNewArrivalLine">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="form-group" id="divNewArrival">
                <div class="form-horizontal form-group" >
                    <div class="col-md-12">
                        <div class="col-md-11" style="margin:0;border:0;padding:0;text-align: center; background-color: #2f405c; height: 45px; margin: auto ;color:white";>
                            <div style="text-align: center; background-color: #2f405c; height: 15px; margin: auto"></div>
                            <div style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                                <span class="caption-subject bold uppercase" style="font-size:19px;color:white">一号店新品</span>
                            </div>
                        </div>
                        <div class="col-md-1" style="margin:0;border:0;padding:0;text-align: right; background-color: #2f405c; height: 45px; margin: auto ;color:white";>
                            <div style="text-align: center; background-color: #2f405c; height: 10px; margin: auto"></div>
                            <a href="javascript:;" id="expendNewArrival" class="btn" style="height: 35px; margin: auto ;color:white" >
                                <i class="glyphicon glyphicon-resize-vertical"></i>展开</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-12" id="divExpendNewArrival">
                    <table class="table table-striped table-bordered table-hover" id="categoryYhdNewArrivalTable"></table>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="col-md-12">
                <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto">
                </div>
                <div  style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                    <span class="caption-subject bold uppercase" style="font-size:19px;color:white">新品引进</span>
                </div>
            </div>
            <div class="portlet-body col-md-12" >
                <div class="form-horizontal" name="my-row" action="">
                    <div class="form-group">
                        <label class="col-md-1  control-label" style="text-align: left">引进条件</label>
                        <div class="col-md-1 checkbox" style="margin:0;border:0;padding:0; margin: auto ; text-align: center">
                            <label class="control-label" >
                                <input type="checkbox">新品
                            </label>
                        </div>
                        <div class="col-md-1 checkbox">
                            <label class="control-label" >
                                <input type="checkbox">热销品
                            </label>
                        </div>
                        <div class="col-md-1 " style="width:100px;">
                            <input type="text" id="minPrice"  class="form-control col-md-1" placeholder="最低价">
                        </div>
                        <div class="col-md-1" style="width:100px;">
                            <input type="text" id="maxPrice" class="form-control col-md-1" placeholder="最高价">
                        </div>
                        <div class="col-md-2 ">
                            <div class="input-group">
                                <input type="text" id="brands" class="form-control" placeholder="" disabled="disabled">
                                <span class="input-group-btn">
                                <button id="brandChoose" class="btn btn-outline" type="button">品牌</button>
                            </span>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <a href="javascript:;" id="queryBtn" class="btn green">
                                <i class="glyphicon glyphicon-plus"></i>引进</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 form-horizontal" id="divBrandList">
                <div class="well well-lg col-md-12" style="height: 150px;overflow:auto;margin:0; margin: auto ;" >
                    <div class="form-group" id="brandList"></div>
                </div>
                <div class="well well-lg col-md-12" style="height:60px;text-align: center">
                    <button class="btn dark btn-outline" id="brandSubmit" data-dismiss="modal" disabled="disabled">确定</button>
                    <button class="btn dark btn-outline" id="brandCancel" data-dismiss="modal" aria-hidden="true">取消</button>
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
        var mychart_Yhdprice = function () {
            var myChart = echarts.init(document.getElementById('comparePrice'));
            var option = {
                color: ['#dedd74','#4fc0f5',  '#65CD20', '#C49FCD'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                title: {      //标题组件
                    text: '价格分布'
                },
                tooltip: {
                    show: true
                },
                legend: {
                    data: ['自有商品数', '自有销量', '一号店商品数', '一号店商品评论数']
                },
                grid: { // 控制图的大小，调整下面这些值就可以，
                    x: 50,
                    x2: 50,
                    y2: 30,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
                },
                toolbox: {     //工具栏
                    show : true,
                    orient: 'vertical',
                    x: 'right',
                    y: 'center',
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                xAxis: {
                    type : 'category',
                    name : "元",
                    data : [],
                },
                yAxis:  {
                    type : 'value',
                    name : '占比'
                } ,
                series: [
                    {
                        name: '自有商品数',
                        type: 'bar',
                        data: []
                    }, {
                        name: '自有销量',
                        type: 'bar',
                        data: []
                    },{
                        name: '一号店商品数',
                        type: 'bar',
                        data: []
                    },{
                        name: '一号店商品评论数',
                        type: 'bar',
                        data: []
                    }
                ]
            };
            myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
            $.ajax({
                type : "post",
                async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${basePath}/category/categoryYhdPrice",    //请求发送到TestServlet处
                data : {categoryId: $("#categoryId").val()},
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    if (result == "0") {
                        alert("没有该一号店品类价格分布信息")
                        myChart.hideLoading();
                    } else if(result == "1") {
                        alert("没有该自有品类价格分布信息")
                        myChart.hideLoading();
                    } else {
                        myChart.hideLoading();    //隐藏加载动画
                        myChart.setOption({        //加载数据图表
                            legend: {
                                data: ['自有商品数', '自有销量', '一号店商品数', '一号店商品评论数'],
                                formatter: function (name) {
                                    if (name == "自有商品数") {
                                        return  name + '(总量:' + result.sumGoodsNum + ')';
                                    } else if(name == '自有销量'){
                                        return name + '(总量:' + result.sumSaleNum + ')';
                                    } else if(name == '一号店商品数'){
                                        return name + '(总量:' + result.sumYhdGoodsNum + ')';
                                    } else if(name == '一号店商品评论数') {
                                        return name + '(总量:' + result.sumYhdComtNum + ')';
                                    }
                                }
                            },
                            xAxis: {
                                data: result.prices
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: '自有商品数',
                                type: 'bar',
                                data: result.goodsSums
                            },{
                                // 根据名字对应到相应的系列
                                name: '自有销量',
                                type: 'bar',
                                data: result.saleSums
                            }, {
                                name: '一号店商品数',
                                type: 'bar',
                                data: result.yhdgoodsSums
                            },{
                                name: '一号店商品评论数',
                                type: 'bar',
                                data: result.yhdcomtSums
                            }]
                        });
                    }
                },
                error : function(errorMsg) {
                    //请求失败时执行该函数
                    alert("图表请求数据失败!");
                    myChart.hideLoading();
                }
            });
            myChart.setOption(option);
        };
        var tableCategoryYhdItems = function () {
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
                        categoryid: $("#categoryId").val()
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
                height: 400,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高
                clickToSelect: false,                //是否启用点击选中行
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                checkboxHeader: false,
                columns: [{
                    field: 'goodsName',
                    title: '商品名'
                }, {
                    field: 'price',
                    title: '价格',
                    sortable:true
                }, {
                    field: 'comment',
                    title: '评论',
                    sortable:true
                }, {
                    field: 'favorableRate',
                    title: '好评',
                    width: '20px',
                    sortable:true
                }, {
                    field: 'seller',
                    title: '商家',
                    sortable:true
                }]
            };
            $("#categoryYhdItemsTable").bootstrapTable(option);
            //根据表头排序
            $('#categoryYhdItemsTable').on('sort.bs.table', function (e, name, order) {});
        };
        var tableCategoryYhdNewArrival = function () {
            var url = '${basePath}/category/categoryYhdNewArrival';
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
                        categoryid: $("#categoryId").val()
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
                height: 400,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高
                clickToSelect: false,                //是否启用点击选中行
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                checkboxHeader: false,
                columns: [{
                    field: 'goodsName',
                    title: '商品名'
                }, {
                    field: 'price',
                    title: '价格',
                    sortable:true
                }, {
                    field: 'comment',
                    title: '评论',
                    sortable:true
                }, {
                    field: 'favorableRate',
                    title: '好评',
                    width: '20px',
                    sortable:true
                }, {
                    field: 'seller',
                    title: '商家',
                    sortable:true
                }]
            };
            $("#categoryYhdNewArrivalTable").bootstrapTable(option);
            //根据表头排序
            $('#categoryYhdNewArrivalTable').on('sort.bs.table', function (e, name, order) {});
        };
        var clickBt = function(){
            $("#category-score").click(function() {
                toMainPage("${basePath}/category/categoryAssistant.html");
            });
            $("#category-detail").click(function() {
                var data = {
                    categoryId: $("#categoryId").val()
                };
                toMainPage("${basePath}/category/categoryPerformanceDetail.html", data);
            });
            $("#category-suggest").click(function() {
                var data = {
                    categoryId: $("#categoryId").val()
                };
                toMainPage("${basePath}/category/categoryChooseGoodsSuggest.html", data);
            });
            $("#divExpendYhdHotsale").hide();
            $("#divNewArrival").hide();
            $("#divNewArrivalLine").hide();
            $("#expendYhdHotsale").click(function() {
                $("#divExpendYhdHotsale").toggle();
                if ($("#divExpendYhdHotsale").is(":hidden")) {
                    $("#divNewArrival").hide();
                    $("#divNewArrivalLine").hide();
                } else {
                    $("#divNewArrival").show();
                    $("#divNewArrivalLine").show();
                    tableCategoryYhdItems();
                }
            });
            $("#divExpendNewArrival").hide();
            $("#expendNewArrival").click(function() {
                $("#divExpendNewArrival").toggle();
                if ($("#divExpendNewArrival").is(":hidden")) {
                    $("#categoryYhdItemsTable").bootstrapTable("refresh");
                } else {
                    tableCategoryYhdNewArrival();
                }
            });
            $("#divBrandList").hide();
            $("#brandChoose").click(function() {
                $("#divBrandList").toggle();
                if ($("#divBrandList").is(":hidden")) {
                } else {
                    if ($("#brandList").html()=="") {
                        $.ajax({
                            type: 'post',
                            url: '${basePath}/category/categoryYhdBrandChoose',
                            data : {categorySid: $("#categoryId").val()},
                            dataType : "json",
                            success : function (result) {
                                var brands = result.brands;
                                if (brands != null && brands.length > 0) {
                                    for (var i = 0; i < brands.length; i++) {
                                        var divBrand = "<label class='control-label' style='width: 100px;text-align: left'><input type='checkbox' value= '" + brands[i] + "'> " + brands[i] + "</label>"
                                        $("#brandList").prepend(divBrand);
                                    }
                                }

                                $("#brandList input[type='checkbox']").click(function(){
                                    if($(this).is(":checked")) {
                                        $("#brandSubmit").removeAttr("disabled");
                                    }
                                });

                                var brandLast = "";
                                $("#brandSubmit").click(function (){
                                    brandLast = "";
                                    $("#brandList input[type='checkbox']:checked").each(function(){
                                        if(this.checked){
                                            if ($("#brandList input[type='checkbox']:checked:last").val() == $(this).val()) {
                                                brandLast = brandLast +  $(this).val();
                                            } else {
                                                brandLast = brandLast +  $(this).val() + "、";
                                            }
                                        }
                                    });
                                    $("#brands").val(brandLast);
                                    $("#divBrandList").hide();
                                });

                                $("#brandCancel").click(function(){
                                    var brandLastArray = [];
                                    brandLastArray = brandLast.split("、");
                                    //取消的时候去掉选中的
                                    $("#brandList input[type='checkbox']:checked").each(function(){
                                        if(this.checked){
                                            var result= $.inArray($(this).val(), brandLastArray);
                                            if(result == -1) {
                                                $(this).attr("checked", false);
                                            }
                                        }
                                    });
                                    //取消的时候选择去掉的
                                    $("#brandList input[type='checkbox']").not("input:checked").each(function(){
                                        var result= $.inArray($(this).val(), brandLastArray);
                                        if(result != -1) {
                                            $(this).prop("checked",true);
                                        }
                                    });
                                    $("#divBrandList").hide();
                                });
                            }
                        });
                    }
                }
            });


        };

        return {
            init: function () {
                mychart_Yhdprice();
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
