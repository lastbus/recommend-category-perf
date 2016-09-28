<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
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
<div class="row">
    <div class="col-md-12">
        <div class="portlet light ">
            <div class="caption" style="height:30px;">
                <i class="icon-settings font-black"></i>
                <span class="caption-subject bold uppercase" id="category-score">品类映射</span>
            </div>
            <div class="portlet-body ">
                <div class="form-horizontal" name="my-row" action="">
                    <div class="form-group">
                        <label class="col-md-1  control-label" style="text-align: center">品类</label>
                        <div class="col-md-3 ">
                            <div class="input-group">
                                <input type="text" id="categoryid" class="form-control" placeholder="品类Id">
                                <span class="input-group-btn">
                                <button id="queryCategory" class="btn btn-outline" type="button">选择</button>
                            </span>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <a href="javascript:;" id="queryBtn" class="btn green">
                                <i class="glyphicon glyphicon-search"></i>查询</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
                <table class="table table-striped table-bordered table-hover" id="categoryPerformanceBasicTable"></table>
            </div>
            <div class=" portlet-body  col-md-12">
                <hr style="border-top:1px solid #2dc0cd;" />
            </div>
            <div class="row"></div>
        </div>
    </div>
</div>
<div id="ztree-modal" class="modal fade" role="dialog" aria-hidden="true">
    <div class="modal-dialog" style="width:400px;">
        <div class="modal-content ">
            <div class="modal-header">
                <h4 class="modal-title">类目列表</h4>
            </div>
            <div class="modal-body" style="height:350px;">
                <form class="form-horizontal category-list-form" name="category-list-form" action="">
                    <div class="form-body">
                        <div id="menuContent" class="menuContent" style="height:330px;overflow:auto;">
                            <ul id="categoryTree" class="ztree" ></ul>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn dark btn-outline" data-dismiss="modal" aria-hidden="true">取消</button>
                <button class="btn green"  data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>

<div id="edit-Modal" class="modal fade" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 750px;" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">变更</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add-form" name="myform" action="">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label">自有类目树</label>
                            <div class="col-md-8">
                                <input type="text" id="blCategoryTree" name="keyword" class="form-control" disabled="disabled" placeholder="Enter text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">一号店类目树</label>
                            <div class="col-md-8">
                                <div class="input-group">
                                    <input type="text" id="yhdCategory" class="form-control" disabled="disabled" placeholder="一号店类目树">
                                    <span class="input-group-btn">
                                        <button id="queryYhdCategory" class="btn btn-outline" type="button">选择</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions row">
                        <div class="col-md-12" style="text-align: center">
                            <button type="button" id="categoryYhdSubmit" class="btn btn-circle ">&nbsp;修改&nbsp;</button>
                            <button class="btn btn-circle grey-salsa btn-outline" data-dismiss="modal" aria-hidden="true">&nbsp;取消&nbsp;</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="yhdCateogryModal" class="modal fade" role="dialog" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content " style="height:530px; width: 450px; text-align: center;" >
            <div class="modal-header">
                <h4 class="modal-title">一号店类目列表</h4>
            </div>
            <div class="modal-body" style="height:400px;">

                <form class="form-horizontal category-list-form" name="category-list-form" action="">
                    <div class="form-body">
                        <div id="yhdMenuContent" class="menuContent" style="height:390px;overflow:auto;">
                            <ul id="yhdCategoryTree" class="ztree" ></ul>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn green" id="categoryYhdConfirm" data-dismiss="modal">确定</button>
                <button class="btn dark btn-outline" id="categoryYhdCancel" data-dismiss="modal" aria-hidden="true">取消</button>
            </div>
        </div>
    </div>
</div>

<script src="${basePath}/assets/plugins/bootstrap-table/js/bootstrap-table.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>

<script src="${basePath}/assets/plugins/ztree/js/jquery.ztree.core.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/ztree/js/jquery.ztree.all.js" type="text/javascript"></script>

<script type="text/javascript">
    var categoryPerformanceDetail_info = function(){
        var tableCategoryBasic = function () {
            var url = '${basePath}/category/categoryPerformanceBasicTable';
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
                        categoryid: $("#categoryid").val().split(":")[0],
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
                height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                checkboxHeader: false,
                columns: [/*{
                 checkbox: true
                 }, */{
                    field: 'categorySid',
                    title: '品类ID'
                }, {
                    field: 'blCategoryTree',
                    title: '自有类目树',
                }, {
                    field: 'brandNum',
                    title: '品牌数',
                }, {
                    field: 'totalGoodsNum',
                    title: '商品数',
                }, {
                    field: 'yhdCategoryTree',
                    title: '一号店类目树',
                }, {
                    field: 'brandsnum',
                    title: '品牌数',
                }, {
                    field: 'goodsnum',
                    title: '商品数',
                }, {
                    field: 'yhdCategoryUrl',
                    title: '一号店URL',
                    align: 'center',
                    events: {
                        'click .getYhdCategoryUrl': function (e, value, row, index) {
                            //  alert('重新发送该邀请, row: ' + JSON.stringify(row));
                            window.open(row.yhdCategoryUrl)
                        }
                    },
                    formatter: function() {
                        var operate =
                                '<a class="getYhdCategoryUrl" title="查看"><span class="glyphicon glyphicon-search"/></a>';
                        return operate;
                    }
                }, {
                    field: 'edit',
                    title: '变更',
                    align: 'center',
                    events: {
                        'click .edit': function (e, value, row, index) {
                            //  alert('重新发送该邀请, row: ' + JSON.stringify(row));
                            $("#edit-Modal").modal("show");
                            $("#blCategoryTree").val(row.categoryTree)
                            $("#yhdCategory").val(row.yhdCategoryTree)
                            $("#categoryYhdSubmit").click(function () {
                                $.ajax({
                                    type: 'post',
                                    url: '${basePath}/category/updateCategoryBasic',
                                    data: {yhdCategoryTree: $("#yhdCategory").val(),
                                            categorySid: row.categorySid},
                                    dataType: 'json',
                                    success: function (result) {
                                        if (result == "2") {
                                            alert("更新成功!")
                                            $("#edit-Modal").modal("hide");
                                            $("#categoryPerformanceBasicTable").bootstrapTable("refresh");
                                        } else {
                                            alert("无更改!")
                                            $("#edit-Modal").modal("hide");
                                        }
                                    }
                                });
                            });
                        }
                    },
                    formatter: function() {
                        var operate =
                                '<a class="edit" title="查看"><span class="glyphicon glyphicon-pencil"/></a>';
                        return operate;
                    }
                }]
            };
            $("#categoryPerformanceBasicTable").bootstrapTable(option);
            //根据表头排序
            $('#categoryPerformanceBasicTable').on('sort.bs.table', function (e, name, order) {});
        };
        var categoryZtree = function () {
            var setting = {
                check: {
                    enable: true,
                    chkStyle: "radio",
                    radioType: "all"
                },
                async: {
                    enable: true,
                    url:"${basePath}/category/getCategoryTree",
                    autoParam: ["id"],
                    dataFilter : filter,
                },
                data:{ // 必须使用data
                    simpleData : {
                        enable : true,
                        idKey : "id", // id编号命名
                        pIdKey : "pid", // 父id编号命名
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
                $("#categoryid").val(v);
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
            $("#queryCategory").click(function () {
                $("#ztree-modal").modal("show");
                showMenu();
            });
            $.fn.zTree.init($("#categoryTree"), setting, zNodes);
        };

        var yhdCategoryTree = function () {
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
                var zTree = $.fn.zTree.getZTreeObj("yhdCategoryTree");
                zTree.checkNode(treeNode, !treeNode.checked, null, true);
                return false;
            }
            function onCheck(e, treeId, treeNode) {
               //  alert(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
                var zTree = $.fn.zTree.getZTreeObj("yhdCategoryTree"),
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
               // $("#yhdCategory").attr("value", v);
                $("#categoryYhdConfirm").click(function () {
                    $("#yhdCategory").val(v);
                });
            }
            function showMenu() {
                $("#yhdMenuContent").slideDown("fast");
                $("body").bind("mousedown", onBodyDown);
            }
            function hideMenu() {
                $("#yhdMenuContent").fadeOut("fast");
                $("body").unbind("mousedown", onBodyDown);
            }
            function onBodyDown(event) {
                /*  if (!(event.target.id == "queryCategory" || event.target.id == "categoryid" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
                 hideMenu();
                 }*/
            }
            hideMenu()
            showMenu();
            $.fn.zTree.init($("#yhdCategoryTree"), setting, zNodes);
        };
        var clickBt = function () {
            $("#queryBtn").click(function () {
                if(!isNaN($("#categoryid").val().split(":")[0])) {
                    $("#categoryPerformanceBasicTable").bootstrapTable("refresh");
                } else {
                    alert("请输入正确的品类ID");
                }
            });
            $("#queryYhdCategory").click(function () {
                $("#yhdCateogryModal").modal("show");
            });
        };
        return {
            init: function () {
                tableCategoryBasic();
                categoryZtree();
                yhdCategoryTree();
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
