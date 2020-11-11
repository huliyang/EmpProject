<%@ page pageEncoding="UTF-8"%>
<%--
<div id="splitSearchDiv">
    <jsp:include page="/pages/split_page_plugin_search.jsp">
        <jsp:param name="columnData" value="<%=columnData%>"/>
        <jsp:param name="column" value="<%=column%>"/>
        <jsp:param name="keyWord" value="<%=keyWord%>"/>
        <jsp:param name="allRecorders" value="<%=allRecorders%>"/>
    </jsp:include>
</div>
--%>
<%--
	<div id="splitSearchDiv">
		<jsp:include page="/pages/split_page_plugin_search.jsp">
			<jsp:param name="columnData" value="${columnData}" />
			<jsp:param name="column" value="${column}" />
			<jsp:param name="keyWord" value="${keyWord}" />
			<jsp:param name="allRecorders" value="${allRecorders}" />
		</jsp:include>
	</div>
 --%>
 <%--
    <div id="splitBarDiv" style="float:right">
    <jsp:include page="/pages/split_page_plugin_barplus.jsp"/>
	</div>
  --%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%
    String columnData = null;
    String keyWord = null;
    String column = null;
    int allRecorders = 0;
%>
<%
    try{
        allRecorders = (Integer)request.getAttribute("allRecorders");
    }catch(Exception e){}
    columnData = (String)request.getAttribute("columnData");
    keyWord = (String)request.getAttribute("keyWord");
    column = (String)request.getAttribute("column");
%>
请输入查询关键字:
<%
    if(columnData != null){
%>
    <select id="colSel">
        <%
            String[] result = columnData.split("\\|");
            for(int i=0;i<result.length;i++){
                String[] temp = result[i].split(":");
        %>
            <option value="<%=temp[1]%>" <%=column.equals(temp[1])?"selected":""%>><%=temp[0]%></option>
        <%
            }
        %>
    </select>
<%
    }
%>
<input type="text" id="kw" name="kw" value="<%=keyWord%>">
<input type="button" value="检索" onclick="goSplit(1)"><br>
<span>查询的记录数:<%=allRecorders%></span><br>