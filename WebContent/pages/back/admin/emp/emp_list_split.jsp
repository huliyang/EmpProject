<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String deleteUrl = basePath + "pages/back/admin/emp/EmpServlet/delete";
	String updateUrl = basePath + "pages/back/admin/emp/EmpServlet/updatePre";
	String insertUrl = basePath + "pages/back/admin/emp/EmpServlet/insertPre";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<script type="text/javascript" src="js/mldn.js"></script>
<script type="text/javascript" src="jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/mldn.css">
<title>雇员管理程序</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12" id="splitSearchDiv">
			<jsp:include page="/pages/split_page_plugin_search.jsp"/>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">雇员信息列表</div>
				<div class="panel-body" id="dataDiv">
					<table class="table table-border table-hover table-striped">
						<tr class="text-center">
							<td><input type="checkbox" id="selall" onclick="checkboxSelect(this,'empno')"></td>
							<td><strong>雇员编号</strong></td>
							<td><strong>姓名</strong></td>
							<td><strong>职位</strong></td>
							<td><strong>雇佣日期</strong></td>
							<td><strong>工资</strong></td>
							<td><strong>佣金</strong></td>
							<td><strong>操作</strong></td>
						</tr>
						<c:if test="${allEmps != null}" var="res">
							<c:forEach items="${allEmps}" var="t_emp">
							<tr class="text-center">
								<td><input type="checkbox" id="empno" name="empno" value="${t_emp.empno}"></td>
								<td>${t_emp.empno}</td>
								<td>${t_emp.ename}</td>
								<td>${t_emp.job}</td>
								<td>${t_emp.hiredate}</td>
								<td>${t_emp.sal}</td>
								<td>${t_emp.comm}</td>
								<td>
									<a href="<%=updateUrl%>?empno=${t_emp.empno}&backurl=${url}&cp=${currentPage}&ls=${lineSize}&col=${column}&kw=${keyWord}" class="btn btn-warning btn-xs">
										<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑
									</a>
								</td>
							</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<div class="panel-footer text-right">
					<button onclick="deleteAll('<%=deleteUrl%>?backurl=${url}&cp=${currentPage}&ls=${lineSize}&col=${column}&kw=${keyWord}','empno','empno')" class="btn btn-danger btn-sm">
						<span class="glyphicon glyphicon-trash"></span>&nbsp;删除雇员数据
					</button>
					<a href="<%=insertUrl%>" class="btn btn-info btn-sm">
						<span class="glyphicon glyphicon-plus"></span>&nbsp;增加新雇员
					</a>
				</div>
				<div class="row">
					<div class="col-md-12 text-right" id="splitBarDiv">
						<jsp:include page="/pages/split_page_plugin_barplus.jsp"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>