<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String empInsertUrl = basePath + "pages/back/admin/emp/emp_insert.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script type="text/javascript" src="js/mldn.js"></script>
<script type="text/javascript" src="js/dept.js"></script>
<script type="text/javascript" src="jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/mldn.css">
<title>雇员管理程序</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">部门详细列表</div>
				<div class="panel-body">
					<table class="table table-bordered table-hover table-striped">
						<tr class="text-center">
							<td><strong>部门编号</strong></td>
							<td><strong>部门名称</strong></td>
							<td><strong>部门位置</strong></td>
							<td><strong>部门人数</strong></td>
							<td><strong>平均工资</strong></td>
							<td><strong>总工资</strong></td>
							<td><strong>最高工资</strong></td>
							<td><strong>最低工资</strong></td>
							<td><strong>操作</strong></td>
						</tr>
						<c:if test="${allDepts != null}" var="res">
							<c:forEach items="${allDepts}" var="dept">
								<tr class="text-center">
									<td>${dept.deptno}</td>
									<td>${dept.dname}</td>
									<td>${dept.loc}</td>
									<td>${dept.stat['count']}</td>
									<td>${dept.stat['avg']}</td>
									<td>${dept.stat['sum']}</td>
									<td>${dept.stat['max']}</td>
									<td>${dept.stat['min']}</td>
									<td>
										<a href="<%=empInsertUrl%>?deptno=${dept.deptno}" class="btn btn-info btn-xs">
											<span class="glyphicon glyphicon-plus"></span>&nbsp;增加雇员
										</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<div class="panel-footer"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>