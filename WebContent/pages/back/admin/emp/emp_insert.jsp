<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String insertUrl = basePath + "pages/back/admin/emp/EmpServlet/insert";
	String listUrl = basePath + "pages/back/admin/emp/EmpServlet/listSplit";
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
<%--以下是文本编辑器的引用文件 --%>
<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>
<script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>
<script>
KindEditor.ready(function(K) {
	var editor1 = K.create('textarea[name="note"]', {
		cssPath : '<%=basePath%>kindeditor/plugins/code/prettify.css',
		//uploadJson : '../jsp/upload_json.jsp',
		//fileManagerJson : '../jsp/file_manager_json.jsp',
		allowFileManager : true,
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
		}
	});
	prettyPrint();
});
</script>
<title>雇员管理程序</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="panel panel-info">
			<div class="panel-heading h1">增加雇员信息</div>
			<div class="panel-body">
				<form action="<%=insertUrl%>" method="post" enctype="multipart/form-data" onsubmit="return validateInsert()">
					<table class="table table-striped">
						<tr class="text-center">
							<td><strong>雇员编号</strong></td>
							<td><input type="text" id="empno" name="empno" onblur="validateEmpno()"></td>
							<td><span id="empnoMsg"></span></td>
							<td><strong>雇员照片</strong></td>
						</tr>
						<tr class="text-center">
							<td><strong>姓名</strong></td>
							<td><input type="text" id="ename" name="ename" onblur="validateEname()"></td>
							<td><span id="enameMsg"></span></td>
							<td rowspan="8"><div id="preview"></div></td>
						</tr>
						<tr class="text-center">
							<td><strong>职位</strong></td>
							<td><input type="text" id="job" name="job" onblur="validateJob()"></td>
							<td><span id="jobMsg"></span></td>
						</tr>
						<tr class="text-center">
							<td><strong>雇员领导</strong></td>
							<td>
								<select id="mgr" name="mgr">
									<option value="0">=====没有领导=====</option>
									<c:if test="${allEmps != null}" var="res">
										<c:forEach items="${allEmps}" var="t_emp">
											<option value="${t_emp.empno}">${t_emp.ename}</option>
										</c:forEach>
									</c:if>
								</select>
							</td>
							<td><span id="mgrMsg"></span></td>
						</tr>
						<tr class="text-center">
							<td><strong>所在部门</strong></td>
							<td>
								<select id="deptno" name="deptno">
									<option value="0">=====没有部门=====</option>
										<c:if test="${allDepts != null}" var="res">
											<c:forEach items="${allDepts}" var="t_dept">
												<option value="${t_dept.deptno}" ${t_dept.deptno == param.deptno ? "selected" : ""}>${t_dept.dname}</option>
											</c:forEach>
										</c:if>
								</select>
							</td>
							<td><span id="deptnoMsg"></span></td>
						</tr>
						<tr class="text-center">
							<td><strong>雇佣日期</strong></td>
							<td><input type="text" id="hiredate" name="hiredate" class="tcal"></td>
							<td><span id="hiredateMsg"></span></td>
						</tr>
						<tr class="text-center">
							<td><strong>工资</strong></td>
							<td><input type="text" id="sal" name="sal" onblur="validateSal()"></td>
							<td><span id="salMsg"></span></td>
						</tr>
						<tr class="text-center">
							<td><strong>佣金</strong></td>
							<td><input type="text" id="comm" name="comm" onblur="validateComm()"></td>
							<td><span id="commMsg"></span></td>
						</tr>
						<tr class="text-center">
							<td><strong>雇员照片</strong></td>
							<td><input type="file" id="photo" name="photo"  onchange="preview(this)"></td>
							<td><span id="fileMsg"></span></td>
						</tr>
						<tr class="text-center">
							<td><strong>雇员简介</strong></td>
							<td colspan="2">&nbsp;<span id="fileMsg"></span></td>
						</tr>
						<tr class="text-center">
							<td colspan="4">
								<textarea id="note" name="note" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
								<span id="fileMsg"></span>
							</td>
						</tr>
					</table>
					<div class="row form-group">
						<div class="col-md-2 col-md-offset-10">
							<button type="submit" class="btn btn-primary btn-sm">增加</button>
							<button type="reset" class="btn btn-warning btn-sm">重置</button>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer text-right">
				<a href="<%=listUrl%>" class="btn btn-info">
					<span class="glyphicon glyphicon-list"></span>&nbsp;雇员列表
				</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>