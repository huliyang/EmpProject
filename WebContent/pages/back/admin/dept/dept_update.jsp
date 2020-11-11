<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String updateUrl = basePath + "pages/back/admin/dept/DeptServlet/update";
	String listUrl = basePath + "pages/back/admin/dept/DeptServlet/list";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<script type="text/javascript" src="jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/mldn.css">
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/dept.js"></script>
<title>雇员管理程序</title>
</head>
<body>
<c:if test="${dept != null}" var="res">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading h1">编辑部门信息</div>
					<div class="panel-body">
						<form action="<%=updateUrl%>" method="post" onsubmit="return validateUpdate()">
						<table class="table table-bordered table-hover table-striped">
							<tr class="text-center">
								<td><strong>部门编号</strong></td>
								<td><span>${dept.deptno}</span></td>
								<td><span id="deptnoMsg"></span></td>
							</tr>
							<tr class="text-center">
								<td><strong>部门名称</strong></td>
								<td><input type="text" id="dname" name="dname" onblur="validateDname()" value="${dept.dname}"></td>
								<td><span id="dnameMsg"></span></td>
							</tr>
							<tr class="text-center">
								<td width="15%"><strong>部门位置</strong></td>
								<td width="45%"><input type="text" id="loc" name="loc" onblur="validateLoc()" value="${dept.loc}"></td>
								<td width="10%"><span id="locMsg"></span></td>
							</tr>
						</table>
						<div class="row form-group">
							<div class="col-md-2 col-md-offset-10">
								<button type="submit" class="btn btn-primary btn-sm">修改</button>
								<button type="reset" class="btn btn-warning btn-sm">重置</button>
							</div>
						</div>
						<input type="hidden" id="deptno" name="deptno" value="${dept.deptno}">
						</form>
					</div>
					<div class="panel-footer text-right">
						<a href="<%=listUrl%>" class="btn btn-info">
							<span class="glyphicon glyphicon-list"></span>&nbsp;部门列表
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
</body>
</html>