<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="sx" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>




<link href="${basePath}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/assets/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/assets/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN THEME GLOBAL STYLES -->
<link href="${basePath}/assets/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
<link href="${basePath}/assets/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
<!-- END THEME GLOBAL STYLES -->

<!-- BEGIN THEME LAYOUT STYLES -->
<link href="${basePath}/app/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/app/css/themes/light.min.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="${basePath}/app/css/custom.css" rel="stylesheet" type="text/css" />   




<decorator:head/>
</head>
<body>
  	<!--[if lt IE 9]
	<script src="${basePath}/assets/plugins/respond.min.js"></script>
	<script src="${basePath}/assets/plugins/excanvas.min.js"></script> 
	<[endif]>-->



 	<script src="${basePath}/assets/plugins/jquery.min.js" type="text/javascript"></script>
	<script src="${basePath}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${basePath}/assets/plugins/js.cookie.min.js" type="text/javascript"></script>
	<script src="${basePath}/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
	<script src="${basePath}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="${basePath}/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
	<script src="${basePath}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
	<script src="${basePath}/assets/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
	<script src="${basePath}/assets/scripts/app.min.js" type="text/javascript"></script> 




	<div class="page-content">
		<decorator:body/>
	</div>	
</body>
</html>