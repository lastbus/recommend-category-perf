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
            <div class="portlet-title">
                <div class="caption font-black">
                    <i class="icon-settings font-black"></i>
                    <span class="caption-subject bold uppercase" id="category-score">品类得分</span>
                </div>
            </div>
            <div class="portlet-body ">
                <div class="form-horizontal" name="my-row" action="">
                    <div class="form-group">
                        <label class="col-md-1  control-label">品类</label>
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
                                <i class="fa fa-search"></i>查询</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
                <div class="form-horizontal" name="my-row" action="">
                    <div class="form-group">
                        <label class="col-md-1  control-label">层级</label>
                        <a class="col-md-1  control-label" id="categoryDirectory1" href="javascript:;">一级目录</a>
                        <a class="col-md-1  control-label" id="categoryDirectory2" href="javascript:;">二级目录</a>
                        <a class="col-md-1  control-label" id="categoryDirectory3" href="javascript:;">三级目录</a>
                        <a class="col-md-1  control-label" id="categoryDirectory4" href="javascript:;">四级目录</a>
                        <a class="col-md-1  control-label" id="categoryDirectory5" href="javascript:;">五级目录</a>
                        <a class="col-md-1  control-label" id="categoryDirectory6" href="javascript:;">末级类目</a>
                    </div>
                </div>
            </div>

            <table class="table table-striped table-bordered table-hover" id="categoryTable"></table>
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
                <button class="btn green" id="sale-submit" data-dismiss="modal">确定</button>
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
    var categoryPerformance_info = function(){
        var TableInit = function () {
            var url = '${basePath}/category/categoryPerformance';
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
                        categoryid: $("#categoryid").val().split(":")[0],
                        parentSid: $("#parentId").val(),
                        level: $("#categoryDirectory1").attr('name')
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
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: false,                //是否启用点击选中行
                height: 516,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                 //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                checkboxHeader: false,
                columns: [{
                    field: 'categorySid',
                    title: '品类ID'
                }, {
                    field: 'categoryName',
                    title: '品类名'
                }, {
                    field: 'level',
                    title: '层级',
                    sortable:true
                },{
                    field: 'rank',
                    title: '排名',
                    sortable:true
                },{
                    field: 'salesVolume',
                    title: '销量',
                    sortable:true
                },{
                    field: 'configuration',
                    title: '配置',
                    sortable:true
                },{
                    field: 'operation',
                    title: '营运',
                    sortable:true
                },{
                    field: 'drainage',
                    title: '人气',
                    sortable:true
                }, {
                    field: 'performance',
                    title: '综合绩效',
                    sortable:true
                },{
                    field: 'NextLevel',
                    width: '30px',
                    title: '下级',
                    events: {
                        'click .getSecondCategoryLevel': function (e, value, row, index) {
                              //  alert('重新发送该邀请, row: ' + JSON.stringify(row));
                                var data = {
                                    categoryId: row.categorySid
                                };
                            $.ajax({
                                type: 'post',
                                async: true,
                                url: "${basePath}/category/categoryPerformanceResult",
                                data: {
                                    categorySid: $("#categoryId").val(),
                                    parentSid: row.categorySid
                                },
                                dataType: "json",
                                success: function(result) {
                                    if (result == 1) {
                                        $("#parentId").val(row.categorySid);
                                        $("#categoryid").val("");
                                        $("#categoryDirectory1").attr("name", "");
                                        $("#categoryTable").bootstrapTable("refresh");
                                    } else {
                                        alert("已经是末级类目！");
                                    }
                                }
                            });

                        }
                    },
                    formatter: function() {
                        var operate =
                                '<a href="javascript:void(0);" class="getSecondCategoryLevel col-md-6" title="下级类目">' +
                                '<span class="glyphicon glyphicon-arrow-down"/></a>'
                        return operate;
                    },
                },{
                    field: 'beforeLevel',
                    width: '30px',
                    title: '上级',
                    events: {
                        'click .getBeforeCategoryLevel': function (e, value, row, index) {
                              //  alert('重新发送该邀请, row: ' + JSON.stringify(row));
                            $.ajax({
                                type: 'post',
                                async: true,
                                url: "${basePath}/category/getBeforeCategoryLevel",
                                data: {
                                    categorySid: row.categorySid
                                },
                                dataType: "json",
                                success: function(result) {
                                    if (result == "0") {
                                        alert("已经是一级类目!");
                                    } else {
                                        $("#parentId").val("");
                                        $("#categoryid").val(result.sid);
                                        $("#categoryDirectory1").attr("name", "");
                                        $("#categoryTable").bootstrapTable("refresh");
                                    }
                                }
                            });
                        }
                    },
                    formatter: function() {
                        var operate =
                                '<a href="javascript:void(0);" class="getBeforeCategoryLevel col-md-6" title="上级">' +
                                '<span class="glyphicon glyphicon-arrow-up"/></a>'
                        return operate;
                    },
                },{
                    field: 'detail',
                    width: '30px',
                    title: '详细',
                    events: {
                        'click .getcategoryPerformanceDetail': function (e, value, row, index) {
                             // alert('重新发送该邀请, row: ' + JSON.stringify(row));
                                var data = {
                                    categoryId: row.categorySid,
                                };
                            toMainPage("${basePath}/category/categoryPerformanceDetail.html", data);
                        }
                    },
                    formatter: function() {
                        var operate =
                                '<a href="javascript:void(0);" class="getcategoryPerformanceDetail col-md-6" title="详细">' +
                                '<span class="glyphicon glyphicon-zoom-in"/></a>'
                        return operate;
                    },
                }]
            };
            $("#categoryTable").bootstrapTable(option);
            //根据表头排序
            $('#categoryTable').on('sort.bs.table', function (e, name, order) {
             //   $("#categoryTable").bootstrapTable("refresh");
            });
        };

        var query = function () {
            $("#queryBtn").click(function () {
                $("#categoryDirectory1").attr("name", "");
                $("#parentId").val("");
                if(!isNaN($("#categoryid").val().split(":")[0])) {
                    $("#categoryTable").bootstrapTable("refresh");
                } else {
                    alert("请输入正确的品类ID");
                }
            });

        };

        var categoryQuery = function () {
            $("#categoryDirectory1").click(function() {
                $("#categoryDirectory1").attr("name", "1");
                $("#categoryTable").bootstrapTable("refresh");
            });

            $("#categoryDirectory2").click(function() {
                $("#categoryDirectory1").attr("name", "2");
                $("#categoryTable").bootstrapTable("refresh");
            });

            $("#categoryDirectory3").click(function() {
                $("#categoryDirectory1").attr("name", "3");
                $("#categoryTable").bootstrapTable("refresh");
            });

            $("#categoryDirectory4").click(function() {
                $("#categoryDirectory1").attr("name", "4");
                $("#categoryTable").bootstrapTable("refresh");
            });

            $("#categoryDirectory5").click(function() {
                $("#categoryDirectory1").attr("name", "5");
                $("#categoryTable").bootstrapTable("refresh");
            });
            $("#categoryDirectory6").click(function() {
               /* $("#categoryDirectory1").attr("name", "");
                $("#parentId").val("0");
                $("#categoryTable").bootstrapTable("refresh");*/
            });
        };

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
        function InitialZtree() {
            $("#queryCategory").click(function () {
                $("#ztree-modal").modal("show");
                showMenu();
            });
            $.fn.zTree.init($("#categoryTree"), setting, zNodes);
        }
        return {
            init: function () {
                categoryQuery();
                TableInit();
                query();
                InitialZtree();
            }
        };
    }();
    jQuery(document).ready(function () {
        categoryPerformance_info.init();
    });
</script>
</body>
</html>
