<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.hly.vo.*" %>
<%@page import="cn.hly.factory.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="css/mldn.css">
<script type="text/javascript" src="js/mldn.js"></script>
<title>雇员管理程序</title>
</head>
<body>
<h1>发生错误请联系管理员</h1>
</body>
</html>