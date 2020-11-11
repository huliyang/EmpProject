<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String insertUrl = basePath + "pages/back/admin/dept/dept_insert.jsp";
	String deleteUrl = basePath + "pages/back/admin/dept/DeptServlet/delete";
	String updatePreUrl = basePath + "pages/back/admin/dept/DeptServlet/updatePre";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script type="text/javascript" src="jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/dept.js"></script>
<title>雇员管理程序</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading h1">部门信息列表</div>
					<div class="panel-body">
						<table class="table table-bordered table-hover table-striped">
							<tr class="text-center">
								<td><input type="checkbox" id="selall"></td>
								<td><strong>部门编号</strong></td>
								<td><strong>部门名称</strong></td>
								<td><strong>部门位置</strong></td>
								<td><strong>操作</strong></td>
							</tr>
							<c:if test="${allDepts != null}" var="res">
								<c:forEach items="${allDepts}" var="t_dept">
									<tr class="text-center">
										<td><input type="checkbox" id="deptno" name="deptno" value="${t_dept.deptno}"></td>
										<td>${t_dept.deptno}</td>
										<td>${t_dept.dname}</td>
										<td>${t_dept.loc}</td>
										<td>
											<a href="<%=updatePreUrl%>?deptno=${t_dept.deptno}" class="btn btn-warning btn-xs">
												<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑
											</a>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
					<div class="panel-footer text-right">
						<button onclick="deleteAll('<%=deleteUrl%>?p=p','deptno','deptno')" class="btn btn-danger btn-sm">
							<span class="glyphicon glyphicon-trash"></span>&nbsp;删除部门信息
						</button>
						<a href="<%=insertUrl%>" class="btn btn-info btn-sm"> <span
							class="glyphicon glyphicon-plus"></span>&nbsp;增加新部门
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="editDept">
		<div class="modal-dialog" style="width: 800px">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">编辑部门信息</h4>
				</div>
				<div class="modal-body">
					<form id="editDeptForm" method="post" class="form-horizontal">
						<fieldset>
							<legend>
								<label>编辑部门信息</label>
							</legend>
							<div class="form-group" id="deptnoDiv">
								<label class="col-md-3 control-label" for="deptno">部门编号：</label>
								<div class="col-md-5">
									<span id="deptno"></span>
								</div>
								<div class="col-md-4" id="deptnoMsg"></div>
							</div>
							<div class="form-group" id="dnameDiv">
								<label class="col-md-3 control-label" for="dname">部门名称：</label>
								<div class="col-md-5">
									<input type="text" id="dname" name="dname" class="form-control" placeholder="请输入部门名称">
								</div>
								<div class="col-md-4" id="dnameMsg"></div>
							</div>
							<div class="form-group" id="locDiv">
								<label class="col-md-3 control-label" for="loc">部门位置：</label>
								<div class="col-md-5">
									<input type="text" id="loc" name="loc" class="form-control" placeholder="请输入部门位置">
								</div>
								<div class="col-md-4" id="locMsg"></div>
							</div>
							<div class="form-group">
	                            <div class="col-md-2 col-md-offset-7">
	                                <button type="button" id="updateBtn" class="btn btn-primary btn-sm">修改部门数据</button>
	                            </div>
                        	</div>
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success btn-sm" data-dismiss="modal">关闭编辑界面</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>