<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String insertUrl = basePath + "pages/back/admin/dept/DeptServlet/insert";
	String listUrl = basePath + "pages/back/admin/dept/DeptServlet/list";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script type="text/javascript" src="jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<script src="jquery/jquery.metadata.js"></script>
<script src="jquery/jquery.validate.min.js"></script>
<script src="jquery/additional-methods.min.js"></script>
<script src="jquery/messages_zh.js"></script>
<link type="text/css" rel="stylesheet" href="css/mldn.css">
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/dept.js"></script>
<title>雇员管理程序</title>
</head>
<body>
<c:if test="${dept != null}" var="res">

<div class="container">
	<div class="col-md-12">
		<div class="panel panel-info">
			<div class="panel-heading h1">查看部门信息</div>
			<div class="panel-body">
			<table class="table table-bordered table-hover table-striped">
					<tr>
						<td width="15%"><strong>部门编号</strong></td>
						<td width="45%">${dept.deptno}</td>
					</tr>
					<tr>
						<td><strong>部门名称</strong></td>
						<td>${dept.dname}</td>
					</tr>
					<tr>
						<td><strong>部门位置</strong></td>
						<td>${dept.loc}</td>
					</tr>
				</table>
			</div>
			<div class="panel-footer text-right">
				<button  onclick="closePage()" class="btn btn-info btn-xm">关闭窗口</button>
			</div>
	</div>
	</div>
</div>
</c:if>
</body>
</html>