<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>

	<div class="page-sidebar-wrapper">
		<div class="page-sidebar navbar-collapse collapse" >
			<ul id="page-sidebar-menu" style="background-color: #2f405c" class="page-sidebar-menu  page-header-fixed page-sidebar-menu-compact " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">

				<li class="nav-item " style="background-color: #2f405c">
					<a href="javascript:;"  class="nav-link nav-toggle" style="background-color: #2f405c">
						<i class="fa fa-dashboard"></i>
	                 	<span class="title">品类管理</span>
	                 	<span class="selected"></span>
						<span class="arrow"></span>
					</a>
					<ul class="sub-menu" id="categoryPerformance-content">
						<li class="nav-item">
							<a href="${basePath}/category/categoryIndex.html" id="dashboard-page" class="nav-link" >
								<i class="fa fa-table"></i>
								<span class="title">品类概况</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="${basePath}/category/categoryPerformance.html"   class="nav-link" >
								<i class="fa fa-table"></i>
								<span class="title">品类绩效</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="${basePath}/category/categoryAssistant.html"  class="nav-link" >
								<i class="fa fa-table"></i>
								<span class="title">品类助手</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="${basePath}/category/categoryConfiguration.html"  class="nav-link" >
								<i class="fa fa-table"></i>
								<span class="title">品类配置</span>
							</a>
						</li>
					</ul>
				</li>

			</ul>
		</div>
	</div>