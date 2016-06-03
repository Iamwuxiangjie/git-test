<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin_serviceTop.jsp' starting page</title>
	<link href="<%=basePath%>css/admin_serviceTop.css" type="text/css" rel="stylesheet">
  </head>
  
 <s:if test="#session.loginAdmin== null">
	<body onload="pageIndexHref('<%=basePath%>');">
</s:if>
<s:else>
	<body>
</s:else>
  	<div id="admin_serviceTop">
  	<s:if test="#request.toplist.size>0">
  		<table class="dataTable">
  			<tr>
  				<th>排名</th>
  				<th>服务名称</th>
  				<th>公司名称</th>
  				<th>购买次数</th>
  				<th>总消费金额</th>
  			</tr>
  			<s:iterator value="#request.toplist" var="top" status="st"> 
  				<tr>
  					<td><s:property value="#st.index+1"/></td>
  					<td><s:property value="#top.serviceName"/></td>
  					<td><s:property value="#top.companyName"/></td>
  					<td><s:property value="#top.counts"/></td>
  					<td><s:property value="#top.money"/></td>
  				</tr>
  			</s:iterator>
  		</table>
  	</s:if>
  	<s:else>
  		暂无排名情报
  	</s:else>
	</div>
	<script type="text/javascript">
	function pageIndexHref(h) {
		parent.location.href = h + "/admin/admin_login.jsp";
	}
	</script>
  </body>
</html>
