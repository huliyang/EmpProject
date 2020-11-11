<%@ page pageEncoding="UTF-8"%>
<%--
    <div id="splitBarDiv">
    <jsp:include page="/pagessplit_page_plugin_bar.jsp">
        <jsp:param name="currentPage" value="<%=currentPage%>"/>
        <jsp:param name="lineSize" value="<%=lineSize%>"/>
        <jsp:param name="column" value="<%=column%>"/>
        <jsp:param name="keyWord" value="<%=keyWord%>"/>
        <jsp:param name="allRecorders" value="<%=allRecorders%>"/>
        <jsp:param name="url" value="<%=url%>"/>
        <jsp:param name="paramName" value="参数名称"/>
        <jsp:param name="paramValue" value="参数内容"/>
    </jsp:include>
</div>
--%>
<%--
    <div id="splitBarDiv" style="float:right">
    <jsp:include page="/pages/split_page_plugin_barplus.jsp">
        <jsp:param name="currentPage" value="${currentPage}"/>
        <jsp:param name="lineSize" value="${lineSize}"/>
        <jsp:param name="column" value="${column}"/>
        <jsp:param name="keyWord" value="${keyWord}"/>
        <jsp:param name="allRecorders" value="${allRecorders}"/>
        <jsp:param name="url" value="${url}"/>
    </jsp:include>
	</div>
 --%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setCharacterEncoding("UTF-8");
%>
<%
    String url = null;
    int currentPage = 1;
    int lineSize = 5;
    String column = null;
    String keyWord = null;
    int allRecorders = 0;
    int pageSize = 0;
    int[] lsData = new int[]{3,5,10,50};
    String paramName = request.getParameter("paramName");
    String paramValue = request.getParameter("paramValue");
%>
<% //接收参数
    try{
        currentPage = (Integer)request.getAttribute("currentPage");
    }catch(Exception e){}
    try{
        allRecorders = (Integer)request.getAttribute("allRecorders");
    }catch(Exception e){}
    try{
        lineSize = (Integer)request.getAttribute("lineSize");
    }catch(Exception e){}
    column = (String)request.getAttribute("column");
    keyWord = (String)request.getAttribute("keyWord");
    url = basePath + request.getAttribute("url");
%>
<%
    if(allRecorders > 0){
        pageSize = (allRecorders + lineSize -1)/lineSize;
    }else{
        pageSize = 1;
    }
%>
<script>
    function goSplit(vcp){
        var ls = document.getElementById("lsSel").value;
        try{
            var kw = document.getElementById("kw").value;
            var col = document.getElementById("colSel").value;
            window.location = "<%=url%>?cp=" + vcp + "&ls=" + ls +"&kw=" + kw +"&col=" + col + "&<%=paramName%>=<%=paramValue%>";
        }catch(Exception){
            window.location = "<%=url%>?cp=" + vcp + "&ls=" + ls + "&<%=paramName%>=<%=paramValue%>";
        }
        
    }
</script>
    <input type="button" value="首页" onclick="goSplit(1)" <%=currentPage == 1?"disabled":""%>>
    <input type="button" value="上一页" onclick="goSplit(<%=currentPage-1%>)" <%=currentPage == 1?"disabled":""%>>
    <input type="button" value="下一页" onclick="goSplit(<%=currentPage+1%>)" <%=currentPage == pageSize?"disabled":""%>>
    <input type="button" value="尾页" onclick="goSplit(<%=pageSize%>)" <%=currentPage == pageSize?"disabled":""%>>
    跳转到第
    <select id="cpSel" onchange="goSplit(this.value)">
<%
    for(int i=1;i<=pageSize;i++){
%>
        <option value="<%=i%>" <%=currentPage == i? "selected" : ""%>><%=i%></option>
<%
        }
%>
    </select>
    页&nbsp;
    每页显示
    <select id="lsSel" onchange="goSplit(1)">
        <%
            for(int i=0;i<lsData.length;i++){
        %>
                <option value="<%=lsData[i]%>" <%=lineSize == lsData[i]? "selected":""%>><%=lsData[i]%></option>           
        <%
            }
        %>
    </select>
    行记录
