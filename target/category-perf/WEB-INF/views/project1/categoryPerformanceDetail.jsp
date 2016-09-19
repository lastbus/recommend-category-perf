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
    <link href="${basePath}/assets/plugins/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet"  type="text/css"/>

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
            </div>
            <div class="portlet-body col-md-12">
                <table class="table table-bordered" id="categoryBasicTable">
                    <caption>
                            <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto">
                            </div>
                            <div  style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                                <span class="caption-subject bold uppercase" style="font-size:19px;color:white">品类基本信息</span>
                            </div>
                    </caption>
                    <tbody >
                    <tr  >
                        <th>品类名</th>
                        <td></td>
                        <th>sku数</th>
                        <td></td>
                        <th>品牌数</th>
                        <td></td>
                    </tr>
                    <tr  >
                        <th>类目ID</th>
                        <td></td>
                        <th>下架sku数</th>
                        <td></td>
                        <th>单品最高价</th>
                        <td></td>
                    </tr>
                    <tr >
                        <th>类目层级</th>
                        <td></td>
                        <th>缺货sku</th>
                        <td></td>
                        <th>单品最低价</th>
                        <td></td>
                    </tr>
                    <tr >
                        <th colspan="2">对标一号店类目</th>
                        <td colspan="3" id="yhdCategory"></td>
                        <td rowspan="2" style="width: 200px; ">
                            <a href="javascript:;"  class="btn" id="reMatch"><i class="glyphicon glyphicon-arrow-left"></i>重新匹配</a>
                            <a href="javascript:;"  class="btn" id="compareYhd"><i class="glyphicon glyphicon-arrow-right"></i>对比</a>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">对标URL</th>
                        <td colspan="3">
                            <a class="control-label" id="Yhdurl" target="_blank" href="javascript:;"></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-12">
                <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto">
                </div>
                <div  style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                    <span class="caption-subject bold uppercase" style="font-size:19px;color:white">销售绩效</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-7 " style="height:380px;" id="sale-proportion"></div>
                    <div class="col-md-1 " style="height:380px;"></div>
                    <div class="col-md-3 " style="height:380px;" id="test">
                        <table class="table table-bordered " id="salesPerformanceTable" style="font-size: 12px;">
                            <tbody>
                            <tr >
                                <th>销售绩效</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th colspan="2" style="text-align: center">成长性绩效</th>
                            </tr>
                            <tr>
                                <th>销售增长率</th>
                                <td ></td>
                            </tr>
                            <tr>
                                <th>成长性绩效</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th colspan="2" style="text-align: center">品类销售绩效</th>
                            </tr>
                            <tr>
                                <th>销售额占比</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>品类销售绩效</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th colspan="2" style="text-align: center">单sku销量</th>
                            </tr>
                            <tr>
                                <th>单sku销量比</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>单sku销绩效</th>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-1 " style="height:380px;"></div>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-7" style="height:350px;" id="sale-money" ></div>
                    <div class="col-md-1" style="height:350px;"></div>
                    <div class="col-md-3" style="height:350px; text-align: right" id="" >
                        <a href="javascript:;"  class="btn"><i class="glyphicon glyphicon-arrow-right"></i>销量预测</a>
                    </div>
                    <div class="col-md-1 " style="height:350px;"></div>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="portlet-body "  >
                <div class="form-horizontal form-group" >
                    <div class="col-md-8" style="text-align: left; font-size: 18px ;font-family:'宋体';font-style:normal;">
                        <label class="control-label">品类爆款</label>
                    </div>
                    <div class="col-md-3" style="text-align: right;">
                        <a href="javascript:;" id="expend" class="btn"><i class="glyphicon glyphicon-resize-vertical"></i>展开</a>
                    </div>
                </div>
                <div class="col-md-12" style="height: 5px">
                </div>
                <div class="form-horizontal form-group" id="categoryHotcakeShow">
                    <div class="col-md-1" style="text-align: left">
                        <label class=" control-label">月份</label>
                    </div>
                    <div class="col-md-7">
                        <div class="col-md-4" style="text-align: left">
                            <select id="selectMonth" class="form-control"></select>
                        </div>
                    </div>
                    <div class="col-md-3" style="text-align: right">
                        <a href="javascript:;"  id="hotcakeCompare" class="btn"><i class="glyphicon glyphicon-arrow-right"></i>爆款对比</a>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="categoryHotcakeTable"></table>
                </div>
            </div>

            <div class="col-md-12">
                <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto">
                </div>
                <div  style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                    <span class="caption-subject bold uppercase" style="font-size:19px;color:white">品类配置绩效</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-7 " style="height:380px;" id="sale-ratio"></div>
                    <div class="col-md-1 " style="height:380px;"></div>
                    <div class="col-md-3 " style="height:380px;" >
                        <table class="table table-bordered " id="saleRatioTable" style="font-size: 12px;">
                            <caption></caption>
                            <tbody>
                            <tr>
                                <th>品类配置绩效</th>
                                <td ></td>
                            </tr>
                            <tr>
                                <th colspan="2" style="text-align: center">动销绩效</th>
                            </tr>
                            <tr>
                                <th>动销绩效分</th>
                                <td ></td>
                            </tr>
                            <tr>
                                <th>平均动销率</th>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-1 " style="height:380px;"></div>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-7 " style="height:380px;" id="sale-concentration-ratio"></div>
                    <div class="col-md-1 " style="height:380px;"></div>
                    <div class="col-md-3 " style="height:380px;" >
                        <table class="table table-bordered " id="saleConcentrationRatio" style="font-size: 12px;">
                            <caption></caption>
                            <tbody>
                            <tr>
                                <th colspan="2" style="text-align: center">集中度绩效</th>
                            </tr>
                            <tr>
                                <th>集中度绩效</th>
                                <td ></td>
                            </tr>
                            <tr>
                                <th>80%集中度</th>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-1 " style="height:380px;"></div>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-7 " style="height:350px;" id="price" ></div>
                    <div class="col-md-1 " style="height:350px;"></div>
                    <div class="col-md-3 " style="height:350px;">
                        <a href="javascript:;"  class="btn"><i class="glyphicon glyphicon-cog"></i>配置价格区间</a>
                        <a href="javascript:;"  id="chooseGoodsSuggest" class="btn"><i class="glyphicon glyphicon-arrow-right"></i>选品建议</a>
                        <table class="table table-bordered " id="priceTable" style="font-size: 12px;">
                            <caption></caption>
                            <tbody>
                            <tr>
                                <th colspan="2" style="text-align: center">价格结构绩效</th>
                            </tr>
                            <tr>
                                <th>相关性</th>
                                <td ></td>
                            </tr>
                            <tr>
                                <th>价格绩效</th>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-1 " style="height:350px;"></div>
                </div>
            </div>
            <div class="col-md-12">

            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-12 " style="height:150px;" >
                        <table class="table table-bordered " id="categoryOperationTable" style="font-size: 12px;">
                            <caption>
                                <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto">
                                </div>
                                <div  style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                                    <span class="caption-subject bold uppercase" style="font-size:19px;color:white">营运绩效</span>
                                </div>
                            </caption>
                            <thead>
                                <tr>
                                    <th>营运绩效</th>
                                    <th>调价次数</th>
                                    <th>价格绩效</th>
                                    <th>属性填充率</th>
                                    <th>属性绩效</th>
                                    <th>可售率</th>
                                    <th>可售绩效</th>
                                    <th>上下架频次</th>
                                    <th>上下架绩效</th>
                                    <th>存售比</th>
                                    <th>存售比绩效</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td colspan="2">
                                        <a href="javascript:;" id="expendSale" class="btn" ><i class="glyphicon glyphicon-resize-vertical"></i>存售详情</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-horizontal form-group"  id="categoryExpendSaleShow">
                        <table class="table table-striped table-bordered table-hover" id="categoryExpendSaleTable"></table>
                    </div>
                </div>
            </div>

            <div class="col-md-12">
                <div  style="text-align: center; background-color: #2f405c; height: 15px; margin: auto"></div>
                <div  style="text-align: center; background-color: #2f405c; height: 30px; margin: auto">
                    <span class="caption-subject bold uppercase" style="font-size:19px;color:white">人气绩效</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="col-md-7 " style="height:380px;" id="sale-pv-uv"></div>
                    <div class="col-md-1 " style="height:380px;"></div>
                    <div class="col-md-3 " style="height:380px;" >
                        <table class="table table-bordered " id="salePvUvTable" style="font-size: 12px;">
                            <caption></caption>
                            <tbody>
                            <tr>
                                <th>人气绩效</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th colspan="2" style="text-align: center">PV</th>
                            </tr>
                            <tr>
                                <th>PV占比</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>PV绩效</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th colspan="2" style="text-align: center">UV</th>
                            </tr>
                            <tr>
                                <th>UV占比</th>
                                <td ></td>
                            </tr>
                            <tr>
                                <th>UV绩效</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th colspan="2" style="text-align: center">顾客</th>
                            </tr>
                            <tr>
                                <th>顾客数占比</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>顾客绩效</th>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-1 " style="height:380px;"></div>
                </div>
            </div>
            <div class="col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="portlet-body">
                <div class="form-group">
                    <div class="form-horizontal form-group" >
                        <div class="col-md-8" style="text-align: left; font-size: 18px ;font-family:'宋体';font-style:normal;">
                            <label class="control-label">PV&UV详情</label>
                        </div>
                        <div class="col-md-3" style="text-align: right;">
                            <a href="javascript:;" id="expendPvUv" class="btn" ><i class="glyphicon glyphicon-resize-vertical"></i>展开</a>
                        </div>
                    </div>
                    <div class="col-md-12" style="height: 5px">
                    </div>
                    <div class="form-horizontal form-group" id="categoryPvUvShow">
                        <table class="table table-striped table-bordered table-hover" id="categoryPvUvTable"></table>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                </div>
            </div>
        </div>
    </div>
</div>

<div id="match-search-Modal" class="modal fade" role="dialog" aria-hidden="true" >
    <div class="modal-dialog" style="height:520px; width: 500px; text-align: center;">
        <div class="modal-content " style="height:520px; width: 500px; text-align: center;" >
            <div class="modal-header">
                <h4 class="modal-title">类目列表</h4>
            </div>
            <div class="modal-body" style="height:400px;">
                <form class="form-horizontal category-list-form" name="category-list-form" action="">
                    <div class="form-body">
                        <div id="menuContent" class="menuContent" style="height:390px;overflow:auto;">
                            <ul id="categoryTree" class="ztree" ></ul>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn green" id="categoryYhdSubmit" data-dismiss="modal">确定</button>
                <button class="btn dark btn-outline" id="categoryYhdCancel" data-dismiss="modal" aria-hidden="true">取消</button>
            </div>
        </div>
    </div>
</div>


<script src="${basePath}/assets/plugins/bootstrap-table/js/bootstrap-table.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>

<script src="${basePath}/assets/scripts/echarts/echarts.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/ztree/js/jquery.ztree.core.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/ztree/js/jquery.ztree.all.js" type="text/javascript"></script>

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
                    console.log(result);
                    $("#categoryBasicTable tr").eq(0).find("td").eq(0).html(result.categoryName);
                    $("#categoryBasicTable tr").eq(0).find("td").eq(1).html(parseFloat(result.totalGoodsNum).toLocaleString());
                    $("#categoryBasicTable tr").eq(0).find("td").eq(2).html(parseFloat(result.brandNum).toLocaleString());
                    $("#categoryBasicTable tr").eq(1).find("td").eq(0).html(result.categorySid);
                    $("#categoryBasicTable tr").eq(1).find("td").eq(1).html(parseFloat(result.offTheShelfGoodsNum).toLocaleString());
                    $("#categoryBasicTable tr").eq(1).find("td").eq(2).html(parseFloat(result.highestPrice).toLocaleString());
                    $("#categoryBasicTable tr").eq(2).find("td").eq(0).html(result.categoryTree);
                    $("#categoryBasicTable tr").eq(2).find("td").eq(1).html(parseFloat(result.outOfStockGoodsNum).toLocaleString());
                    $("#categoryBasicTable tr").eq(2).find("td").eq(2).html(parseFloat(result.lowestPrice).toLocaleString());
                    $("#categoryBasicTable tr").eq(3).find("td").eq(0).html(result.yhdCategoryTree);
                    $("#Yhdurl").text(result.yhdCategoryUrl);
                    $("#Yhdurl").attr("href", result.yhdCategoryUrl);
                }
            });
        };
        var mychart_sale_proportion = function () {
            var myChart = echarts.init(document.getElementById('sale-proportion'));
            var option = {
                color: ['#4fc0f5', '#dedd74'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                title: {      //标题组件
                    text: '销量占比',
                    textStyle: {fontFamily: '宋体',fontWeight:'normal'}
                },
                tooltip: {
                    show: true
                },
                legend: {
                    data: ['销售额', '总销售额-当前销售额']
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
                    name : "月",
                    data : [],
                },
                yAxis:  {
                    type : 'value',
                    axisLabel : {
                        formatter: '{value}%'
                    }
                } ,
                series: [
                    {
                        name: '销售额',
                        type: 'bar',
                        stack: '销量',
                        data: []
                    },
                    {
                        name: '总销售额-当前销售额',
                        type: 'bar',
                        stack: '销量',
                        data: []
                    }
                ]
            };
            myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
            $.ajax({
                type : "post",
                async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${basePath}/category/categorySalesPerformance",    //请求发送到TestServlet处
                data : {categorySid: $("#categoryId").val()},
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    if (result == "0") {
                        alert("没有该品类销量占比信息");
                        myChart.hideLoading();
                    } else {
                        myChart.hideLoading();    //隐藏加载动画
                        myChart.setOption({        //加载数据图表
                            legend: {
                                data: ['销售额', '总销售额-当前销售额']
                            },
                            xAxis: {
                                data: result.months
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: '销售额',
                                type: 'bar',
                                data: result.volumes
                            }, {
                                name: '总销售额-当前销售额',
                                type: 'bar',
                                data: result.total
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
        var mychart_sale_money = function () {
            var myChart = echarts.init(document.getElementById('sale-money'));
            var option = {
                color: ['#4fc0f5', '#dedd74'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                title: {      //标题组件
                    text: '销量走势',
                    textStyle: {fontFamily: '宋体',fontWeight:'normal'}
                },
                tooltip: {
                    show: true
                },
                legend: {
                    data: ['销售额']
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
                    name : "月",
                    data : [],
                },
                yAxis:  {
                    type : 'value',
                    name: '元'
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
                url : "${basePath}/category/categorySalesMoney",    //请求发送到TestServlet处
                data : {categorySid: $("#categoryId").val()},
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    if (result == "0") {
                        alert("没有该品类销量走势信息")
                        myChart.hideLoading();
                    } else {
                        myChart.hideLoading();    //隐藏加载动画
                        myChart.setOption({        //加载数据图表
                            legend: {
                                data: ['销售额']
                            },
                            xAxis: {
                                data: result.months
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
        var tableCategoryHotcakes = function () {
            //加载月份的select option
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
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
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
                    sortable:true
                }, {
                    field: 'goodsSalePrice',
                    title: '销售价格',
                    sortable:true
                }, {
                    field: 'saleAmount',
                    title: '销售数量',
                    sortable:true
                }]
            };
            $("#categoryHotcakeTable").bootstrapTable(option);
            //根据表头排序
            $('#categoryHotcakeTable').on('sort.bs.table', function (e, name, order) {});
        };
        var tableCategoryExpendSale = function () {
            var url = '${basePath}/category/CategoryExpendSale';
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
                clickToSelect: false,                //是否启用点击选中行
                height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                checkboxHeader: false,
                columns: [/*{
                 checkbox: true
                 }, */{
                    field: 'goodsSid',
                    title: '商品ID'
                }, {
                    field: 'goodsSalesName',
                    title: '商品名'
                }, {
                    field: 'stock',
                    title: '库存',
                    sortable:true
                }, {
                    field: 'avgDaySaleSum',
                    title: '每天售出占比',
                    sortable:true
                }, {
                    field: 'ratio',
                    title: '售完需天数',
                    sortable:true
                }]
            };
            $("#categoryExpendSaleTable").bootstrapTable(option);
            //根据表头排序
            $('#categoryExpendSaleTable').on('sort.bs.table', function (e, name, order) {});
        };
        var tableCategoryPvUv = function () {
            //加载月份的select option
            $.ajax({
                type : "post",
                url : "${basePath}/category/getCategoryPvUvMonth",
                data : {categorySid: $("#categoryId").val()},
                dataType : "json",
                success : function (result) {
                    var months = result.months;
                    $("<option value='all'>全部月份</option>").appendTo("#selectPvUvMonth");
                    if (months != null && months.length > 0) {
                        for (var i = 0; i < months.length; i++) {
                            $("<option value='" + months[i] + "'>" + months[i] + "</option>").appendTo("#selectPvUvMonth");
                        }
                    }
                }
            });
            var url = '${basePath}/category/categoryPvUvDetailTable';
            var option = {
                url: url,  //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: function (params) {   ////传递参数（*）
                    var p = {
                        limit: params.limit,   //页面大小
                        offset: params.offset,  //页码
                        column: params.sort,
                        order: params.order,
                        categoryid: $("#categoryId").val(),
                        month: $("#selectPvUvMonth").val()
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
                height: 480,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
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
                    field: 'categorySid',
                    title: '品类ID'
                }, {
                    field: 'categoryName',
                    title: '品类名'
                }, {
                    field: 'level',
                    title: '层级',
                    sortable:true
                }, {
                    field: 'pv',
                    title: 'PV数量',
                    sortable:true
                }, {
                    field: 'uv',
                    title: 'UV数量',
                    sortable:true
                },{
                    field: 'numberOfCustomers',
                    title: '顾客数',
                    sortable:true
                }]
            };
            $("#categoryPvUvTable").bootstrapTable(option);
            //根据表头排序
            $('#categoryPvUvTable').on('sort.bs.table', function (e, name, order) {});
        };
        var mychart_sale_ratio = function() {
            var myChart = echarts.init(document.getElementById('sale-ratio'));
            var option = {
                color: ['#4fc0f5', '#dedd74'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                title: {      //标题组件
                    text: '动销率',
                    textStyle: {fontFamily: '宋体',fontWeight:'normal'}
                },
                tooltip: {
                    show: true
                },
                legend: {
                    data: ['动销率']
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
                    name : "月",
                    data : [],
                },
                yAxis:  {
                    type : 'value',
                    name : '动销率'
                } ,
                series: [
                    {
                        name: '动销率',
                        type: 'bar',
                        data: []
                    }
                ]
            };
            myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
            $.ajax({
                type : "post",
                async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${basePath}/category/CategorySaleRatio",    //请求发送到TestServlet处
                data : {categorySid: $("#categoryId").val()},
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    if (result == "0") {
                        alert("没有该品类动销率信息")
                        myChart.hideLoading();
                    } else {
                        myChart.hideLoading();    //隐藏加载动画
                        myChart.setOption({        //加载数据图表
                            legend: {
                                data: ['动销率']
                            },
                            xAxis: {
                                data: result.months
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: '动销率',
                                type: 'bar',
                                data: result.SaleRatios
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
        var mychart_sale_concentration_ratio = function() {
            var myChart = echarts.init(document.getElementById('sale-concentration-ratio'));
            var option = {
                color: ['#4fc0f5', '#dedd74'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                title: {      //标题组件
                    text: '集中度',
                    textStyle: {fontFamily: '宋体',fontWeight:'normal'}
                },
                tooltip: {
                    show: true
                },
                legend: {
                    data: ['80%集中度', '50%集中度']
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
                    name : "月",
                    data : [],
                },
                yAxis:  {
                    type : 'value',
                    name : '',
                    axisLabel : {
                        formatter: '{value}%'
                    }
                } ,
                series: [
                    {
                        name: '80%集中度',
                        type: 'bar',
                        data: []
                    }, {
                        name: '50%集中度',
                        type: 'bar',
                        data: []
                    }
                ]
            };
            myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
            $.ajax({
                type : "post",
                async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${basePath}/category/CategorySaleConcentrationRatio",    //请求发送到TestServlet处
                data : {categorySid: $("#categoryId").val()},
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    if (result == "0") {
                        alert("没有该品类集中度信息")
                        myChart.hideLoading();
                    } else {
                        myChart.hideLoading();    //隐藏加载动画
                        myChart.setOption({        //加载数据图表
                            legend: {
                                data: ['80%集中度','50%集中度']
                            },
                            xAxis: {
                                data: result.months
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: '80%集中度',
                                type: 'bar',
                                data: result.SaleRatioeighty
                            },{
                                // 根据名字对应到相应的系列
                                name: '50%集中度',
                                type: 'bar',
                                data: result.SaleRatiofifty
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
        var mychart_price = function () {
            var myChart = echarts.init(document.getElementById('price'));
            var option = {
                color: ['#4fc0f5', '#dedd74'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                title: {      //标题组件
                    text: '价格分布',
                    textStyle: {fontFamily: '宋体',fontWeight:'normal'}
                },
                tooltip: {
                    show: true
                },
                legend: {
                    data: ['销量', '商品数量']
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
                    name : '数量/总量'
                } ,
                series: [
                    {
                        name: '销量',
                        type: 'bar',
                        data: []
                    },{
                        name: '商品数量',
                        type: 'bar',
                        data: []
                    }
                ]
            };
            myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
            $.ajax({
                type : "post",
                async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${basePath}/category/categoryPrice",    //请求发送到TestServlet处
                data : {categorySid: $("#categoryId").val()},
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    if (result == "0") {
                        alert("没有该品类价格分布信息")
                        myChart.hideLoading();
                    } else {
                        myChart.hideLoading();    //隐藏加载动画
                        myChart.setOption({        //加载数据图表
                            legend: {
                                data: ['销量', '商品数量'],
                                formatter: function (name) {
                                    if (name == "销量") {
                                        return  name + '(总量:' + result.sum1 + ')';
                                    } else {
                                        return name + '(总量:' + result.sum0 + ')';
                                    }
                                }
                            },
                            xAxis: {
                                data: result.prices
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: '销量',
                                type: 'bar',
                                data: result.saleNums1
                            },{
                                name: '商品数量',
                                type: 'bar',
                                data: result.saleNums0
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
        var mychart_pv_uv = function () {
            var myChart = echarts.init(document.getElementById('sale-pv-uv'));
            var option = {
                color: ['#4fc0f5', '#dedd74', '#7cfc00'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                title: {      //标题组件
                    text: 'PV&UV占比',
                    textStyle: {fontFamily: '宋体',fontWeight:'normal'}
                },
                tooltip: {
                    show: true
                },
                legend: {
                    data: ['PV', 'UV', '顾客数']
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
                    name : "月",
                    data : [],
                },
                yAxis:  {
                    type : 'value',
                    name : ''
                } ,
                series: [
                    {
                        name: 'PV',
                        type: 'bar',
                        data: []
                    },{
                        name: 'UV',
                        type: 'bar',
                        data: []
                    },{
                        name: '顾客数',
                        type: 'bar',
                        data: []
                    }
                ]
            };
            myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
            $.ajax({
                type : "post",
                async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${basePath}/category/categoryPvUv",    //请求发送到TestServlet处
                data : {categorySid: $("#categoryId").val()},
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    if (result == "0") {
                        alert("没有该品类PV&UV信息")
                        myChart.hideLoading();
                    } else {
                        myChart.hideLoading();    //隐藏加载动画
                        myChart.setOption({        //加载数据图表
                            legend: {
                                data: ['PV', 'UV', '顾客数'],
                            },
                            xAxis: {
                                data: result.months
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: 'PV',
                                type: 'bar',
                                data: result.salePv
                            },{
                                name: 'UV',
                                type: 'bar',
                                data: result.saleUv
                            },{
                                name: '顾客数',
                                type: 'bar',
                                data: result.saleCustomer
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

        var setting = {
            check: {
                enable: true,
                chkStyle: "radio",
                radioType: "all"
            },
            async: {
                enable: true,
                url:"${basePath}/category/getYhdCategoryTree",
                autoParam: ["id"],
                otherParam:{"categoryId":$("#categoryId").val()},
                dataFilter : filter,
            },
            data:{ // 必须使用data
                simpleData : {
                    enable : true,
                    idKey : "id", // id编号命名
                    rootId : 0
                }
            },
            callback: {
                onCheck: onCheck,
                beforeClick: beforeClick,
            }
        };
        var zNodes = [];
        function filter(treeId, parentNode, childNodes) {
            if (!childNodes)
                return null;
            childNodes = eval(childNodes);
            return childNodes;
        }
        function beforeClick(treeId,treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("categoryTree");
            zTree.checkNode(treeNode, !treeNode.checked, null, true);
            return false;
        }
        function onCheck(e, treeId, treeNode) {
            // alert(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
            var zTree = $.fn.zTree.getZTreeObj("categoryTree"),
                    nodes = zTree.getCheckedNodes(true),
                    v = "";
            var ids="";
            for (var i=0, l=nodes.length; i<l; i++) {
                v += nodes[i].name + ",";
                ids+=nodes[i].id+",";
            }
            if (ids.length > 0 ) ids = ids.substring(0, ids.length-1);
            //  alert(ids);
            if (v.length > 0 ) v = v.substring(0, v.length-1);
            //var category = $("#categoryid");
            //category.attr("value", v);
            $("#yhdCategory").text(v);

        }
        function showMenu() {
            $("#menuContent").slideDown("fast");
            $("body").bind("mousedown", onBodyDown);
        }
        function hideMenu() {
            $("#menuContent").fadeOut("fast");
            $("body").unbind("mousedown", onBodyDown);
        }
        function onBodyDown(event) {
            /*  if (!(event.target.id == "queryCategory" || event.target.id == "categoryid" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
             hideMenu();
             }*/
        }

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
            $("#selectMonth").change(function () {
                $("#categoryHotcakeTable").bootstrapTable("refresh");
            });
            $("#categoryHotcakeShow").hide();
            $("#expend").click(function() {
                $("#categoryHotcakeShow").toggle();
                if ($("#categoryHotcakeShow").is(":hidden")) {
                    $("#selectMonth").empty();
                    $("#categoryHotcakeTable").bootstrapTable("refresh");
                } else {
                    tableCategoryHotcakes();
                }
            });

            $("#categoryExpendSaleShow").hide();
            $("#expendSale").click(function() {
                $("#categoryExpendSaleShow").toggle();
                if (!($("#categoryExpendSaleShow").is(":hidden"))) {
                    tableCategoryExpendSale();
                }
            });

            $("#categoryPvUvShow").hide();
            $("#expendPvUv").click(function() {
                $("#categoryPvUvShow").toggle();
                if ($("#categoryPvUvShow").is(":hidden")) {
                    $("#categoryPvUvTable").bootstrapTable("refresh");
                } else {
                    tableCategoryPvUv();
                }
            });

            $("#compareYhd").click(function(){
                var data = {
                    categoryId: $("#categoryId").val(),
                    url: $("#url").val()
                };
                toMainPage("${basePath}/category/categoryCompare.html", data);
            });

            $("#chooseGoodsSuggest").click(function() {
                var data = {
                    categoryId: $("#categoryId").val()
                };
                toMainPage("${basePath}/category/categoryChooseGoodsSuggest.html", data);
            });
            $("#hotcakeCompare").click(function() {
                var data = {
                    categoryId: $("#categoryId").val()
                };
                toMainPage("${basePath}/category/categoryHotcakeCompare.html", data);
            });
            //重新匹配功能暂未开启
            /*$("#reMatch").click(function() {
                $("#match-search-Modal").modal("show");
                showMenu();
                $.fn.zTree.init($("#categoryTree"), setting, zNodes);
            });*/
            $("#categoryYhdSubmit").click(function() {
                //更新页面
                $.ajax({
                    type: 'post',
                    async: true,
                    url: "${basePath}/category/updateYhdUrl",
                    data: {yhdCategory: $("#yhdCategory").val()},
                    dataType: "json",
                    success: function(result) {
                        $("#Yhdurl").text(result.url);
                        $("#Yhdurl").attr("href", result.url);
                    }
                });
                //更新数据库
                $.ajax({
                    type: 'post',
                    async: true,
                    url: "${basePath}/category/updateCategoryBasic",
                    data: {categoryid: $("#categoryId").val(), yhdCategory: $("#yhdCategory").val()},
                    dataType: "json",
                    success: function(result) {
                        $("#yhdCategory").text($("#yhdCategory").val());
                    }
                });
            });
            $("#categoryYhdCancel").click(function() {
                $.ajax({
                    type: 'post',
                    async: true,
                    url: "${basePath}/category/categoryBasic",
                    data: {categorySid: $("#categoryId").val()},
                    dataType: "json",
                    success: function(result) {
                        $("#categoryBasicTable tr").eq(3).find("td").eq(0).html(result.yhdCategoryTree);
                        $("#Yhdurl").text(result.yhdCategoryUrl);
                        $("#Yhdurl").attr("href", result.yhdCategoryUrl);
                    }
                });
            });
        };
        var insertTable = function() {
            $.ajax({
                type: 'post',
                async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${basePath}/category/categorySalesPerformanceTable",    //请求发送到TestServlet处
                data : {categorySid: $("#categoryId").val()},
                dataType : "json",        //返回数据形式为json
                success : function(result) {
                    $("#salesPerformanceTable tr").eq(0).find("td").eq(0).html(result.salesScore);
                    $("#salesPerformanceTable tr").eq(2).find("td").eq(0).html(result.aveGrowthRate);
                    $("#salesPerformanceTable tr").eq(3).find("td").eq(0).html(result.aveGrowthRateScore);
                    $("#salesPerformanceTable tr").eq(5).find("td").eq(0).html(result.ninetyDaySalesRatio);
                    $("#salesPerformanceTable tr").eq(6).find("td").eq(0).html(result.ninetyDaySalesScore);
                    $("#salesPerformanceTable tr").eq(8).find("td").eq(0).html(result.singleSkuSalesRatio);
                    $("#salesPerformanceTable tr").eq(9).find("td").eq(0).html(result.singleSkuSalesScore);
                }
            });

            $.ajax({
                type: 'post',
                async: true,
                url: "${basePath}/category/categorySalePerformancePriceTable",
                data: {categorySid: $("#categoryId").val()},
                dataType: "json",
                success: function(result) {
                    $("#saleRatioTable tr").eq(0).find("td").eq(0).html(result.orgScore);
                    $("#saleRatioTable tr").eq(2).find("td").eq(0).html(result.shelfSalesRatioScore);
                    $("#saleRatioTable tr").eq(3).find("td").eq(0).html(result.avgShelfSalesRatio);
                    $("#saleConcentrationRatio tr").eq(1).find("td").eq(0).html(result.eightyPercentCnrScore);
                    $("#saleConcentrationRatio tr").eq(2).find("td").eq(0).html(result.avgEightyPercentCnr);
                    $("#priceTable tr").eq(1).find("td").eq(0).html(result.priceCorrelation);
                    $("#priceTable tr").eq(2).find("td").eq(0).html(result.priceCorrelationScore);

                }
            });
            $.ajax({
                type: 'post',
                async: true,
                url: "${basePath}/category/categoryPvUvTable",
                data: {categorySid: $("#categoryId").val()},
                dataType: "json",
                success: function(result) {
                    $("#salePvUvTable tr").eq(0).find("td").eq(0).html(result.popScore);
                    $("#salePvUvTable tr").eq(2).find("td").eq(0).html(result.pvRatio);
                    $("#salePvUvTable tr").eq(3).find("td").eq(0).html(result.pvScore);
                    $("#salePvUvTable tr").eq(5).find("td").eq(0).html(result.uvRatio);
                    $("#salePvUvTable tr").eq(6).find("td").eq(0).html(result.uvScore);
                    $("#salePvUvTable tr").eq(8).find("td").eq(0).html(result.customersRatio);
                    $("#salePvUvTable tr").eq(9).find("td").eq(0).html(result.customerScore);
                }
            });
            $.ajax({
                type: 'post',
                async: true,
                url: "${basePath}/category/categoryOperationTable",
                data: {categorySid: $("#categoryId").val(), level: $("#level").val()},
                dataType: "json",
                success: function(result) {
                    $("#categoryOperationTable tr").eq(1).find("td").eq(0).html(result.operScore);
                    $("#categoryOperationTable tr").eq(1).find("td").eq(1).html(result.avePriceAdjustmentTime);
                    $("#categoryOperationTable tr").eq(1).find("td").eq(2).html(result.priceAdjScore);
                    $("#categoryOperationTable tr").eq(1).find("td").eq(3).html(result.avePropFillRate);
                    $("#categoryOperationTable tr").eq(1).find("td").eq(4).html(result.propFillScore);
                    $("#categoryOperationTable tr").eq(1).find("td").eq(5).html(result.stockSkuRate);
                    $("#categoryOperationTable tr").eq(1).find("td").eq(6).html(result.outOfStockScore);
                    $("#categoryOperationTable tr").eq(1).find("td").eq(7).html(result.aveOnOffShelfTime);
                    $("#categoryOperationTable tr").eq(1).find("td").eq(8).html(result.offShelfScore);
                    $("#categoryOperationTable tr").eq(1).find("td").eq(9).html(result.shelfSaleRatio);
                    $("#categoryOperationTable tr").eq(1).find("td").eq(10).html(result.stockSaleRatioScore);
                }
            });

        };
        return {
            init: function () {
                tableCategoryBasic();
                mychart_sale_proportion();
                mychart_sale_money();
                mychart_sale_ratio();
                mychart_sale_concentration_ratio();
                mychart_price();
                mychart_pv_uv();
                clickBt();
                insertTable();
            }
        };
    }();
    jQuery(document).ready(function () {
        categoryPerformanceDetail_info.init();
    });
</script>
</body>
</html>
