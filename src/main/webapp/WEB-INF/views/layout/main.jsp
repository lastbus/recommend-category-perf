<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="sx" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>

<html lang="en">
<head>
<meta charset="utf-8" />
<title>品类管理平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<link href="${basePath}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/assets/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/assets/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/assets/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
<link href="${basePath}/assets/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/app/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/app/css/themes/default.min.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="${basePath}/app/css/custom.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="${basePath}/app/img/favicon.ico" />
<script src="${basePath}/assets/plugins/jquery.min.js" type="text/javascript"></script>

</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-md page-sidebar-fixed page-footer-fixed">
<script src="${basePath}/app/pages/commonUtils.js" type="text/javascript"></script>
<jsp:include page="head.jsp"></jsp:include>
     <div class="clearfix"></div>
     <div class="page-container">
		<!-- 导航栏 -->
		<jsp:include page="_nav.jsp"></jsp:include>
         <div class="page-content-wrapper">
             <div id="main-content" class="main-content"></div>
         </div>
     </div>
<jsp:include page="footer.jsp"></jsp:include>

<script src="${basePath}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/scripts/app.min.js" type="text/javascript"></script>
<script src="${basePath}/app/scripts/layout.min.js" type="text/javascript"></script>
<script src="${basePath}/app/scripts/main.js" type="text/javascript"></script>

</body>
</html>