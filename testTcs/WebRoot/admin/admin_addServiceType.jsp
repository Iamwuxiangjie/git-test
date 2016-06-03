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
    
    <title>管理员管理界面</title>
	<link href="<%=basePath%>css/admin_addServiceType.css" type="text/css" rel="stylesheet">
  </head>
  
<s:if test="#session.loginAdmin== null">
	<body onload="pageIndexHref('<%=basePath%>');">
</s:if>
<s:else>
	<body>
</s:else>
  	<div id="admin_addServiceType">
  	<s:if test="#session.serviceType.size>0">
  		<h2>现有服务类型:</h2>
  		<table class="dataTable">
  			<tr>
  				<th>类型名称</th>
  				<th>操作</th>
  			</tr>
  			<s:iterator value="#session.serviceType" var="type">
  				<tr>
  					<td><s:property value="#type.serviceTypeName"/></td>
  					<td>
  						<a href="<%=path%>/admin/ServiceType_getTypeToUpdate.action?serviceTypeId=<s:property value="#type.serviceTypeId"/>">修改</a>
  						<a href="<%=path%>/admin/ServiceType_delete.action?serviceTypeId=<s:property value="#type.serviceTypeId"/>" onclick="javascript: return confirm('真的要删除吗？');">删除</a>
  					</td>
  				</tr>
  			</s:iterator>
  		</table>
  	</s:if>
  	<s:else>
  		<p>目前还没有服务类型</p>
  	</s:else>
  	<div class="form1">
  	<form action="<%=path%>/admin/ServiceType_addType.action" method="post">
  		服务类型：<input type="text" name="ServiceTypeName" class="txt">
  		<input type="submit" value="增加" class="btn">
  		<input type="reset" value="重置" class="btn">
  	</form>
  	</div>
  	</div>
  	<script type="text/javascript">
	function pageIndexHref(h) {
		parent.location.href = h + "/admin/admin_login.jsp";
	}
	</script>
  </body>
</html>
