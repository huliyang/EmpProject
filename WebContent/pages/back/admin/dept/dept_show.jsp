<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.hly.vo.*"%>
<%@page import="cn.hly.factory.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String deleteUrl = basePath + "pages/back/admin/emp/emp_delete_do.jsp";
	String updateUrl = basePath + "pages/back/admin/emp/emp_update.jsp";
	String insertUrl = basePath + "pages/back/admin/emp/emp_insert.jsp";
	String showUrl = basePath + "pages/back/admin/emp/emp_show.jsp";
	String deptShowUrl = basePath + "pages/back/admin/dept/dept_show.jsp";
%>
<%
	request.setCharacterEncoding("UTF-8");
	int deptno = Integer.parseInt(request.getParameter("deptno"));
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
	<%
		String url = basePath + "pages/back/admin/dept/dept_show.jsp";
		int currentPage = 1;
		int lineSize = 5;
		int allRecorders = 0;//保存总记录数
		String keyWord = "";
		String column = "ename";//定义默认的查询列
		String columnData = "雇员编号:empno|雇员姓名:ename|雇员职位:job";
	%>
	<%
		//负责接收数据
		try {
			//如果接收不到cp参数的值，那么就出现NumberFormatException
			currentPage = Integer.parseInt(request.getParameter("cp"));
		} catch (Exception e) {
		}
		try {
			lineSize = Integer.parseInt(request.getParameter("ls"));
		} catch (Exception e) {
		}
		if (request.getParameter("kw") != null) {
			keyWord = request.getParameter("kw");
		}
		if (request.getParameter("col") != null) {
			column = request.getParameter("col");
		}
	%>
	<%
		Dept dept = ServiceFactory.getIDeptServiceInstance().show(deptno, currentPage, lineSize, column, keyWord);
		List<Emp> all = dept.getEmps();
		allRecorders = (Integer)dept.getStat().get("count");
	%>
	<h1>雇员列表</h1>
		<table border="1" cellpadding="5" cellspace="0" width="100%" bgcolor="#F2F2F2">
		<tr onmouseover="changeColor(this,'#FFFFFF')" onmouseout="changeColor(this,'#F2F2F2')">
			<td><strong>部门编号</strong></td>
			<td><strong>部门名称</strong></td>
			<td><strong>部门位置</strong></td>
			<td><strong>部门人数</strong></td>
			<td><strong>平均工资</strong></td>
			<td><strong>总工资</strong></td>
			<td><strong>最高工资</strong></td>
			<td><strong>最低工资</strong></td>
		</tr>
		<tr>
			<td><%=dept.getDeptno()%></td>
			<td><%=dept.getDname()%></td>
			<td><%=dept.getLoc()%></td>
			<td><%=dept.getStat().get("count")%></td>
			<td><%=dept.getStat().get("avg")%></td>
			<td><%=dept.getStat().get("sum")%></td>
			<td><%=dept.getStat().get("max")%></td>
			<td><%=dept.getStat().get("min")%></td>
		</tr>
		</table>
	<div id="splitSearchDiv">
		<jsp:include page="/pages/split_page_plugin_search.jsp">
			<jsp:param name="columnData" value="<%=columnData%>" />
			<jsp:param name="column" value="<%=column%>" />
			<jsp:param name="keyWord" value="<%=keyWord%>" />
			<jsp:param name="allRecorders" value="<%=allRecorders%>" />
		</jsp:include>
	</div>
	<div id="dataDiv">
	<table border="1" cellpadding="5" cellspace="0" width="100%" bgcolor="#F2F2F2">
		<tr onmouseover="changeColor(this,'#FFFFFF')" onmouseout="changeColor(this,'#F2F2F2')">
			<td><input type="checkbox" id="selall" onclick="checkboxSelect(this,'empno')"></td>
			<td><strong>雇员编号</strong></td>
			<td><strong>姓名</strong></td>
			<td><strong>职位</strong></td>
			<td><strong>领导</strong></td>
			<td><strong>部门</strong></td>
			<td><strong>雇佣日期</strong></td>
			<td><strong>工资</strong></td>
			<td><strong>佣金</strong></td>
			<td><strong>操作</strong></td>
		</tr>
		<%
			Iterator<Emp> iter = all.iterator();
			while(iter.hasNext()){
				Emp vo = iter.next();
		%>
			<tr onmouseover="changeColor(this,'#FFFFFF')" onmouseout="changeColor(this,'#F2F2F2')">
				<td><input type="checkbox" id="empno" name="empno" value="<%=vo.getEmpno()%>"></td>
				<td><%=vo.getEmpno()%></td>
				<td><a onclick="openPage('<%=showUrl%>?empno=<%=vo.getEmpno()%>')"><%=vo.getEname()%></a></td>
				<td><%=vo.getJob()%></td>
				<td><a  onclick="openPage('<%=showUrl%>?empno=<%=vo.getMgr().getEmpno()%>')"><%=vo.getMgr().getEname() == null? "" : vo.getMgr().getEname()%></a></td>
				<td><a  onclick="openPage('<%=deptShowUrl%>?deptno=<%=vo.getDept().getDeptno()%>')"><%=vo.getDept().getDname() == null? "" : vo.getDept().getDname()%></a></td>
				<td><%=vo.getHiredate()%></td>
				<td><%=vo.getSal()%></td>
				<td><%=vo.getComm()%></td>
				<td><a href="<%=updateUrl%>?empno=<%=vo.getEmpno()%>&backurl=<%=url%>&cp=<%=currentPage%>&ls=<%=lineSize%>&col=<%=column%>&kw=<%=keyWord%>">修改</a></td>
			</tr>
		<%
			}
		%>
	</table>
	<div>
		<input type="button" value="删除雇员数据" onclick="deleteAll('<%=deleteUrl%>?backurl=<%=url%>&cp=<%=currentPage%>&ls=<%=lineSize%>&col=<%=column%>&kw=<%=keyWord%>&cp=<%=currentPage%>&ls=<%=lineSize%>&col=<%=column%>&kw=<%=keyWord%>','empno','empno')">
		<a href="<%=insertUrl%>">增加新雇员</a>
	</div>
</div>
    <div id="splitBarDiv" style="float:right">
    <jsp:include page="/pages/split_page_plugin_barplus.jsp">
        <jsp:param name="currentPage" value="<%=currentPage%>"/>
        <jsp:param name="lineSize" value="<%=lineSize%>"/>
        <jsp:param name="column" value="<%=column%>"/>
        <jsp:param name="keyWord" value="<%=keyWord%>"/>
        <jsp:param name="allRecorders" value="<%=allRecorders%>"/>
        <jsp:param name="url" value="<%=url%>"/>
        <jsp:param name="paramName" value="deptno"/>
        <jsp:param name="paramValue" value="<%=deptno%>"/>
    </jsp:include>
	</div>
</body>
</html>