<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String updateUrl = basePath + "pages/back/admin/emp/emp_update_do.jsp";
	String listUrl = basePath + "pages/back/admin/emp/emp_list_split.jsp";
	String showUrl = basePath + "pages/back/admin/emp/EmpServlet/show";
	String deptShowUrl = basePath + "pages/back/admin/dept/DeptServlet/show";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="css/mldn.css">
<link rel="stylesheet" type="text/css" href="css/calendar.css"/>
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/emp.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<title>雇员管理程序</title>
</head>
<body>
<c:if test="${emp != null}" var="res">
<div class="container">
	<div class="row">
		<div class="panel panel-info">
			<div class="panel-heading h1">查看雇员信息</div>
			<div class="panel-body">
				<table class="table table-bordered table-hover table-striped">
					<tr>
						<td width="15%"><strong>雇员编号</strong></td>
						<td width="45%">${emp.empno}</td>
						<td width="10%"><strong>雇员照片</strong></td>
					</tr>
					<tr>
						<td><strong>姓名</strong></td>
						<td>${emp.ename}</td>
						<td rowspan="8"><img src="upload/${emp.photo}"></td>
					</tr>
					<tr>
						<td><strong>职位</strong></td>
						<td>${emp.job}</td>
					</tr>
					<tr>
						<td><strong>雇员领导</strong></td>
						<td><a href="<%=showUrl%>?empno=${emp.mgr.empno}">${emp.mgr.ename}</a></td>
					</tr>
					<tr>
						<td><strong>部门</strong></td>
						<td><a href="<%=deptShowUrl%>?deptno=${emp.dept.deptno}">${emp.dept.dname}</a></td>
					</tr>
					<tr>
						<td><strong>雇佣日期</strong></td>
						<td>${emp.hiredate}</td>
					</tr>
					<tr>
						<td><strong>工资</strong></td>
						<td>${emp.sal}</td>
					</tr>
					<tr>
						<td><strong>佣金</strong></td>
						<td>${emp.comm}</td>
					</tr>
					<tr>
						<td><strong>雇员简介</strong></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="3">${emp.note != null ? emp.note : "暂无简介"}</td>
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