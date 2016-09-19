<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>


        <div class="page-header navbar navbar-fixed-top" >
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo" style="background-color: #2f405c">
                    <a href="javascript:;">
                    	<%--<img src="${basePath}/app/img/head-logo.png" alt="logo" class="logo-default" />--%>
                    </a>
                    <div class="menu-toggler sidebar-toggler"></div>
                </div>
                <!-- END LOGO -->
               <%-- <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
                <div class="page-actions">
                </div>--%>

                <div class="page-top" style="background-color: aliceblue">
                    <div class="top-menu">
                        <ul class="nav navbar-nav pull-right">
                            <li class="dropdown dropdown-user">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                  <%--  <img alt="" class="img-circle" src="${basePath}/app/img/avatar.png" />--%>
                                  <%--  <span class="username username-hide-on-mobile" style="color: #fff;">  ${user.name } </span>--%>
                                </a>
                            </li>
                            <%--<li class="dropdown quick-sidebar-toggler" onclick="userlogout();">
                               &lt;%&ndash; <i class="icon-logout"><a href="${basePath}/user/logout"></a></i>&ndash;%&gt;
                            </li>--%>
                            <!-- END QUICK SIDEBAR TOGGLER -->
                        </ul>
                    </div>
                    <!-- END TOP NAVIGATION MENU -->
                </div>
                <!-- END PAGE TOP -->
            </div>
            <!-- END HEADER INNER -->
        </div>