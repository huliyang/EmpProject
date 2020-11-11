<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
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
<div class="container">
	<div class="col-md-12">
		<div class="panel panel-info">
			<div class="panel-heading h1">增加部门信息</div>
			<div class="panel-body">
				<form action="<%=insertUrl%>" method="post" class="form-horizontal" id="insertForm">
					<div class="container">
						<fieldset>
							<legend><label>增加部门</label></legend>
							<div class="row form-group" id="deptnoDiv">
								<label class="col-md-3 control-label" for="deptno">部门编号</label>
								<div class="col-md-5">
									<input type="text" id="deptno" name="deptno" class="form-control" placeholder="请输入部门编号">
								</div>
								<div class="col-md-4" id="deptnoMsg"></div>
							</div>
							<div class="row form-group" id="dnameDiv">
								<label class="col-md-3 control-label" for="dname">部门名称</label>
								<div class="col-md-5">
									<input type="text" id="dname" name="dname" class="form-control" placeholder="请输入部门名称">
								</div>
								<div class="col-md-4" id="dnameMsg"></div>
							</div>
							<div class="row form-group" id="locDiv">
								<label class="col-md-3 control-label" for="loc">部门位置</label>
								<div class="col-md-5">
									<input type="text" id="loc" name="loc" class="form-control" placeholder="请输入部门位置">
								</div>
								<div class="col-md-4" id="locMsg"></div>
							</div>
						</fieldset>
						<div class="row form-group">
							<div class="col-md-5 col-md-offset-7">
								<button type="submit" class="btn btn-primary btn-sm">增加</button>
								<button type="reset" class="btn btn-warning btn-sm">重置</button>
							</div>
						</div>
					</div>
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
</body>
</html>