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
    <div class="col-md-12" >
        <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-black">
                    <i class="icon-settings font-black"></i>
                    <span class="caption-subject bold uppercase" id="category-score">品类助手</span>
                </div>
            </div>
            <div class="portlet-body " style="height: 400px">
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
                                <i class="glyphicon glyphicon-thumbs-up"></i>选品建议</a>
                        </div>
                    </div>
                </div>
            </div>
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
        var query = function () {
            $("#queryBtn").click(function () {
                var category = $("#categoryid").val().split(":")[0];
                if(!isNaN(category) && category != "" && category != null) {
                    var data = {
                        categoryId: category
                    };
                    toMainPage("${basePath}/category/categoryChooseGoodsSuggest.html", data);
                } else {
                    alert("请输入正确的品类ID");
                }
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
