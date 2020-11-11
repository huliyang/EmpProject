<%@ page pageEncoding="UTF-8"%>
<link type="text/css" rel="stylesheet" href="css/mldn.css">
<%--
    <div id="splitBarDiv" style="float:right">
    <jsp:include page="/pages/split_page_plugin_barplus.jsp">
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
<%--
  <div id="splitBarDiv" style="float:right">
    <jsp:include page="/pages/split_page_plugin_barplus.jsp"/>
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
    int seed = 3;//种子数
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
        //var ls = document.getElementById("lsSel").value;
        try{
            var kw = document.getElementById("kw").value;
            var col = document.getElementById("colSel").value;
            window.location = "<%=url%>?cp=" + vcp + "&ls=" + <%=lineSize%> +"&kw=" + kw +"&col=" + col + "&<%=paramName%>=<%=paramValue%>";
        }catch(Exception){
            window.location = "<%=url%>?cp=" + vcp + "&ls=" + <%=lineSize%> + "&<%=paramName%>=<%=paramValue%>";
        }
        
    }
</script>
<ul class="pagination">
	<%
if(pageSize > seed * 3){
%>
	<li class="<%=currentPage==1?"active":""%>"><a
		onclick="goSplit(1)">1</a></li>
	<%
    if(currentPage > seed * 2){
%>
	<li><span>...</span></li>
	<%
        int startPage = currentPage - seed;
        int endPage = currentPage + seed;
        for(int i=startPage;i<=endPage;i++){
            if(i<pageSize){
%>
	<li class="<%=currentPage==i?"active":""%>"><a
		onclick="goSplit(<%=i%>)"><%=i%></a></li>
	<%
            }
        }
        if((currentPage+seed*2) <= pageSize){
 %>
	<li><span>...</span></li>
	<%           
        }
    }else{
        for(int i=2;i<=currentPage+seed;i++){
%>
	<li class="<%=currentPage==i?"active":""%>"><a
		onclick="goSplit(<%=i%>)"><%=i%></a></li>
	<%
        }
        if((currentPage + seed * 2) <= pageSize){
 %>
	<li><span>...</span></li>
	<%           
        }
    }
%>
	<li class="<%=currentPage==pageSize?"active":""%>"><a
		onclick="goSplit(<%=pageSize%>)"><%=pageSize%></a></li>
	<%
    }else{
    for(int i=1;i<=pageSize;i++){
%>
	<li class="<%=currentPage==i?"active":""%>"><a
		onclick="goSplit(<%=i%>)"><%=i%></a></li>
	<%
    }
}
%>
</ul>