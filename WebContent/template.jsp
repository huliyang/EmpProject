<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.hly.vo.*" %>
<%@page import="cn.hly.factory.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>雇员管理程序</title>
</head>
<body>
<c:if test="${param.msg == 'hello'}" var="result">
	<h1>成立</h1>
</c:if>
<c:if test="${param.msg != 'hello'}" var="result">
	<h1>不成立</h1>
</c:if>
<h1>判断结果：${result}</h1>
</body>
</html>