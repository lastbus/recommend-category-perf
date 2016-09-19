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


<div class="row">
    <div class="col-md-12">
        <div class="portlet light ">
            <div class="caption" style="height:30px;">
                <i class="icon-settings font-black"></i>
                <span class="caption-subject bold uppercase" id="categoryIndex">品类概况</span>
            </div>
            <div class="portlet-body col-md-12">
                <table class="table table-bordered" id="categoryBasicTable" style="border-collapse:collapse;">
                    <caption>
                        <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto">
                        </div>
                        <div  style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                            <span class="caption-subject bold uppercase" style="font-size:19px;color:white">基本信息</span>
                        </div>
                    </caption>
                    <tbody >
                        <tr  >
                            <th>sku总数</th>
                            <td></td>
                            <th>品牌总数</th>
                            <td></td>
                            <th>销售总额(元)</th>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-11 " style="height:450px;" id="category-goodsNum"></div>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-11 " style="height:450px;" id="category-brandsNum"></div>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-11" style="height:450px;" id="category-sales" ></div>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-11 " style="height:450px;" id="category-all"></div>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-11 " style="height:450px;" id="category-performance"></div>
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
<script src="${basePath}/assets/plugins/ztree/js/jquery.ztree.core.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/ztree/js/jquery.ztree.all.js" type="text/javascript"></script>

<script src="${basePath}/assets/scripts/echarts/echarts.min.js" type="text/javascript"></script>

<script type="text/javascript">
    var categoryPerformanceDetail_info = function(){
        var tableCategoryIndex = function () {
            $.ajax({
                type: 'post',
                async: true,
                url: "${basePath}/category/categoryIndexBasic",
                dataType: "json",
                success: function(result) {
                    $("#categoryBasicTable tr").eq(0).find("td").eq(0).html(parseFloat(result.totalNum).toLocaleString());
                    $("#categoryBasicTable tr").eq(0).find("td").eq(1).html(parseFloat(result.brandNum).toLocaleString());
                    $("#categoryBasicTable tr").eq(0).find("td").eq(2).html(parseFloat(result.sales).toLocaleString());
                }
            });
        };
        var mychart_category_goodsNum = function () {
            var myChart = echarts.init(document.getElementById('category-goodsNum'));
            var option = {
                color: ['#4fc0f5', '#dedd74'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },title: {
                    text: 'SKU数'
                },
                tooltip: {
                    show: true
                },
                legend: {
                    data: ['SKU数', 'SKU数']
                },
                grid: { // 控制图的大小，调整下面这些值就可以，
                    x: 70,
                    x2: 70,
                    y2: 100,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
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
                    name : "类目名",
                    data : [],
                    axisLabel:{
                        interval:0,
                        rotate:30,
                        margin:2,
                        textStyle:{
                            color:"#222"
                        }
                    }
                },
                yAxis:  {
                    type : 'value',
                    name : '件'
                } ,
                series: [
                    {
                        name: 'SKU数',
                        type: 'bar',
                        data: []
                    },{
                        name: '可售SKU数',
                        type: 'bar',
                        data: []
                    }
                ]
            };
            myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
            $.ajax({
                type : "post",
                async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${basePath}/category/categoryGoodsNumber",    //请求发送到TestServlet处
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    if (result == "0") {
                        alert("没有该SKU数信息");
                        myChart.hideLoading();
                    } else {
                        myChart.hideLoading();    //隐藏加载动画
                        myChart.setOption({        //加载数据图表
                            legend: {
                                data: ['SKU数', '可售SKU数']
                            },
                            xAxis: {
                                data: result.categorys
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: 'SKU数',
                                type: 'bar',
                                data: result.goodsNum1
                            }, {
                                // 根据名字对应到相应的系列
                                name: '可售SKU数',
                                type: 'bar',
                                data: result.goodsNum2
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
        var mychart_category_brandsNum = function() {
            var myChart = echarts.init(document.getElementById('category-brandsNum'));
            var option = {
                color: ['#4fc0f5', '#dedd74'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                }, title: {
                    text:'品牌数'
                },
                tooltip: {
                    show: true
                },
                legend: {
                    data: ['品牌数']
                },
                grid: { // 控制图的大小，调整下面这些值就可以，
                    x: 70,
                    x2: 70,
                    y2: 100,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
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
                    name : "类目名",
                    data : [],
                    axisLabel:{
                        interval:0,
                        rotate:30,
                        margin:2,
                        textStyle:{
                            color:"#222"
                        }
                    }
                },
                yAxis:  {
                    type : 'value',
                    name : '个'
                } ,
                series: [
                    {
                        name: '品牌数',
                        type: 'bar',
                        data: []
                    }
                ]
            };
            myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
            $.ajax({
                type : "post",
                async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${basePath}/category/CategoryBrandsNmuber",    //请求发送到TestServlet处
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    if (result == "0") {
                        alert("没有该品类品牌数信息")
                        myChart.hideLoading();
                    } else {
                        myChart.hideLoading();    //隐藏加载动画
                        myChart.setOption({        //加载数据图表
                            legend: {
                                data: ['品牌数']
                            },
                            xAxis: {
                                data: result.categorys
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: '品牌数',
                                type: 'bar',
                                data: result.brandNums
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
        var mychart_category_sales = function () {
            var myChart = echarts.init(document.getElementById('category-sales'));
            var option = {
                color: ['#4fc0f5', '#dedd74'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                }, title: {
                    text:'近90天销售额'
                },
                tooltip: {
                    show: true
                },
                legend: {
                    data: ['销售额']
                },
                grid: { // 控制图的大小，调整下面这些值就可以，
                    x: 70,
                    x2: 70,
                    y2: 100,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
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
                    name : "类目名",
                    data : [],
                    axisLabel:{
                        interval:0,
                        rotate:30,
                        margin:2,
                        textStyle:{
                            color:"#222"
                        }
                    }
                },
                yAxis:  {
                    type : 'value',
                    name : '元'
                } ,
                series: [
                    {
                        name: '销售额',
                        type: 'bar',
                        data: []
                    }
                ]
            };
            myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
            $.ajax({
                type : "post",
                async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${basePath}/category/categorySales",    //请求发送到TestServlet处
                data : {},
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    if (result == "0") {
                        alert("没有该品类销量额信息");
                        myChart.hideLoading();
                    } else {
                        myChart.hideLoading();    //隐藏加载动画
                        myChart.setOption({        //加载数据图表
                            legend: {
                                data: ['销售额']
                            },
                            xAxis: {
                                data: result.categorys
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: '销售额',
                                type: 'bar',
                                data: result.sales
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
        var mychart_category_all = function() {
            var myChart = echarts.init(document.getElementById('category-all'));
            var option = {
                color: ['#4fc0f5', '#dedd74', '#7cfc00'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                }, title: {
                    text:'SKU数、品牌数、销售额占比'
                },
                tooltip: {
                    show: true
                },
                legend: {
                    data: ['sku数','品牌数','销售额']
                },
                grid: { // 控制图的大小，调整下面这些值就可以，
                    x: 70,
                    x2: 70,
                    y2: 100,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
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
                    name : "类目名",
                    data : [],
                    axisLabel:{
                        interval:0,
                        rotate:30,
                        margin:2,
                        textStyle:{
                            color:"#222"
                        }
                    }
                },
                yAxis:  {
                    type : 'value',
                    name : '占比'
                } ,
                series: [
                    {
                        name: 'sku数',
                        type: 'line',
                        data: []
                    },{
                        name: '品牌数',
                        type: 'line',
                        data: []
                    },{
                        name: '销售额',
                        type: 'line',
                        data: []
                    }
                ]
            };
            myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
            $.ajax({
                type : "post",
                async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${basePath}/category/CategoryAllRatio",    //请求发送到TestServlet处
                data : {categorySid: $("#categoryId").val()},
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    if (result == "0") {
                        alert("没有该品类综合绩效信息")
                        myChart.hideLoading();
                    } else {
                        myChart.hideLoading();    //隐藏加载动画
                        myChart.setOption({        //加载数据图表
                            legend: {
                                data: ['sku数','品牌数','销售额']
                            },
                            xAxis: {
                                data: result.categorys
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: 'sku数',
                                type: 'line',
                                data: result.skuRatio
                            },{
                                // 根据名字对应到相应的系列
                                name: '品牌数',
                                type: 'line',
                                data: result.brandRatio
                            },{
                                // 根据名字对应到相应的系列
                                name: '销售额',
                                type: 'line',
                                data: result.salesRatio
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
        var mychart_category_performance = function() {
            var myChart = echarts.init(document.getElementById('category-performance'));
            var option = {
                color: ['#4fc0f5', '#dedd74'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                }, title: {
                    text:'综合绩效'
                },
                tooltip: {
                    show: true
                },
                legend: {
                    data: ['综合绩效']
                },
                grid: { // 控制图的大小，调整下面这些值就可以，
                    x: 70,
                    x2: 70,
                    y2: 100,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
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
                    name : "类目名",
                    data : [],
                    axisLabel:{
                        interval:0,
                        rotate:30,
                        margin:2,
                        textStyle:{
                            color:"#222"
                        }
                    }
                },
                yAxis:  {
                    type : 'value',
                    name : '分'
                } ,
                series: [
                    {
                        name: '综合绩效',
                        type: 'bar',
                        data: []
                    }
                ]
            };
            myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
            $.ajax({
                type : "post",
                async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${basePath}/category/CategoryPerformance",    //请求发送到TestServlet处
                data : {categorySid: $("#categoryId").val()},
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    if (result == "0") {
                        alert("没有该品类综合绩效信息")
                        myChart.hideLoading();
                    } else {
                        myChart.hideLoading();    //隐藏加载动画
                        myChart.setOption({        //加载数据图表
                            legend: {
                                data: ['综合绩效']
                            },
                            xAxis: {
                                data: result.categorys
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: '综合绩效',
                                type: 'bar',
                                data: result.performances
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


        var clickBt = function(){
            $("#category-index").click(function() {
                toMainPage("${basePath}/category/categoryIndex.html");
            });
        };
        return {
            init: function () {
                tableCategoryIndex();
                mychart_category_goodsNum();
                mychart_category_sales();
                mychart_category_brandsNum();
                mychart_category_all();
                mychart_category_performance();
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
