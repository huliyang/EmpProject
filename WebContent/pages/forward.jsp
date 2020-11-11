<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;

%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>雇员管理程序</title>
</head>
<body>
<script type="text/javascript">
	alert("<%=request.getAttribute("msg")%>");
	window.location = "<%=basePath%>" + "<%=request.getAttribute("url")%>";
</script>
</body>
</html>