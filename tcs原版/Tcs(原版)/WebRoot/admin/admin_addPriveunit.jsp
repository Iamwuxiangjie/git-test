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
	<link href="<%=basePath%>css/admin_addPriveunit.css" type="text/css" rel="stylesheet">
  </head>
  
  <body>
  	<div id="admin_addPriveunit">
  	<s:if test="#session.priveunit.size>0">
  		<h2>现有价格单位:</h2>
  		<table class="dataTable">
  			<tr>
  				<th>单位名称</th>
  				<th>操作</th>
  			</tr>
  			<s:iterator value="#session.priveunit" var="priveunit">
  				<tr>
  					<td><s:property value="#priveunit.priveunitName"/></td>
  					<td>
  						<a href="<%=path%>/admin/Priveunit_getPriveunitToUpdate.action?priveunitId=<s:property value="#priveunit.priveunitId"/>">修改</a>
  						<a href="<%=path%>/admin/Priveunit_delete.action?priveunitId=<s:property value="#priveunit.priveunitId"/>" onclick="javascript: return confirm('真的要删除吗？');">删除</a>
  					</td>
  				</tr>
  			</s:iterator>
  		</table>
  	</s:if>
  	<s:else>
  		<p>目前还没有价格单位</p>
  	</s:else>
  	<div class="form1">
  	<form action="<%=path%>/admin/Priveunit_addPriveunit.action" method="post">
  		价格单位：<input type="text" name="priveunitName" class="txt" />
  		<input type="submit" value="增加" class="btn" />
  		<input type="reset" value="重置" class="btn" />
  	</form>
  	</div>
  	</div>
  </body>
</html>
