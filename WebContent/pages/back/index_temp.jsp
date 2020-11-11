<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String deptListPath = basePath + "pages/back/admin/dept/DeptServlet/list";
	String deptDetailsPath = basePath + "pages/back/admin/dept/DeptServlet/listDetails";
	String deptInsertPath = basePath + "pages/back/admin/dept/dept_insert.jsp";
	String empInsertPath = basePath + "pages/back/admin/emp/EmpServlet/insertPre";
	String empListPath = basePath + "pages/back/admin/emp/EmpServlet/list";
	String empListDetailsPath = basePath + "pages/back/admin/emp/EmpServlet/listDetails";
	String empListSplitPath = basePath + "pages/back/admin/emp/EmpServlet/listSplit";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no">
  <base href="<%=basePath%>">
  <title>后台管理系统</title>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="ionicons/css/ionicons.min.css"> 
  <link rel="stylesheet" href="css/style.css">
  <script src="jquery/jquery-3.4.1.min.js"></script> 
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <script src="jquery/jquery.nicescroll.min.js"></script>
  <script src="js/scroll-up-bar.min.js"></script>
  <script src="js/scripts.js"></script>
</head>

<body>
  <div>
    <div class="main-wrapper">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <ul class="navbar-nav navbar-right">
          <li class="dropdown">
          	<a href="#" data-toggle="dropdown" class="col-md-4 nav-link dropdown-toggle">
            	<span>User Name</span>
            </a>
            <div class="dropdown-menu pull-left">
              <a href="#" class="dropdown-item has-icon">
                <span class="ion ion-log-out"></span>&nbsp;Logout
              </a>
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="#">管理系统</a>
          </div>
          <div class="sidebar-user">
            <div class="sidebar-user-picture">
              <img alt="image" src="images/visa.png">
            </div>
            <div class="sidebar-user-details">
              <div class="user-name">User Name</div>
              <div class="user-role">
                Administrator
              </div>
            </div>
          </div>
          <ul class="sidebar-menu">
            <li class="menu-header">Components</li>
            <li>
              <a class="has-dropdown"><i class="ion ion-ios-albums-outline"></i><span>部门管理</span></a>
              <ul class="menu-dropdown">
                <li><a href="<%=deptListPath%>" target="contentFrame"><i class="ion ion-ios-circle-outline"></i>部门列表</a></li>
                <li><a href="<%=deptDetailsPath%>" target="contentFrame"><i class="ion ion-ios-circle-outline"></i>详细列表</a></li>
                <li><a href="<%=deptInsertPath%>" target="contentFrame"><i class="ion ion-ios-circle-outline"></i>增加部门</a></li>
              </ul>
            </li>
            <li>
              <a class="has-dropdown"><i class="ion ion-flag"></i><span>雇员管理</span></a>
              <ul class="menu-dropdown">
                <li><a href="<%=empListPath%>" target="contentFrame"><i class="ion ion-ios-circle-outline"></i>雇员列表</a></li>
                <li><a href="<%=empListDetailsPath%>" target="contentFrame"><i class="ion ion-ios-circle-outline"></i>详细列表</a></li>
                <li><a href="<%=empListSplitPath %>" target="contentFrame"><i class="ion ion-ios-circle-outline"></i>分页列表</a></li>
                <li><a href="<%=empInsertPath%>" target="contentFrame"><i class="ion ion-ios-circle-outline"></i>增加雇员</a></li>
              </ul>
            </li>
            <li>
              <a href="#" class="has-dropdown"><i class="ion ion-ios-copy-outline"></i><span>设置</span></a>
              <ul class="menu-dropdown">
                <li><a href="#" target="contentFrame"><i class="ion ion-ios-circle-outline"></i> Login</a></li>
                <li><a href="#" target="contentFrame"><i class="ion ion-ios-circle-outline"></i> Register</a></li>
                <li><a href="#" target="contentFrame"><i class="ion ion-ios-circle-outline"></i> Forgot Password</a></li>
              </ul>
            </li>
          </ul>
        </aside>
      </div>
      <div class="main-content">
	      <section class="section">
	          <h1 class="section-header"></h1>
			  <iframe name="contentFrame" width="100%" height="500" style="frameborder:no;border:0;scrolling:yes;">
			  </iframe>
	      </section>
      </div>
    </div>
  </div>
</body>
</html>