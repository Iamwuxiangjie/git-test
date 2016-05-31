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
	<link href="<%=basePath%>css/admin_addFacilitatorType.css" type="text/css" rel="stylesheet">
  </head>
  
  <body>
  	<div id="admin_addFacilitatorType">
  	<s:if test="#session.facilitatorType.size>0">
  		<h2>现有公司类型:</h2>
  		<table class="dataTable">
  			<tr>
  				<th>类型名称</th>
  				<th>描述</th>
  				<th>操作</th>
  			</tr>
  			<s:iterator value="#session.facilitatorType" var="type">
  				<tr>
  					<td><s:property value="#type.facilitatorTypeName"/></td>
  					<s:if test="#type.facilitatorTypeExplain==null">
  						<td>暂无简介</td>
  					</s:if>
  					<s:else>
  						<td><s:property value="#type.facilitatorTypeExplain"/></td>
  					</s:else>
  					<td>
  						<a href="<%=path%>/admin/FacilitatorType_getTypeToUpdate.action?facilitatorTypeId=<s:property value="#type.facilitatorTypeId"/>">修改</a>
  						<a href="<%=path%>/admin/FacilitatorType_delete.action?facilitatorTypeId=<s:property value="#type.facilitatorTypeId"/>" onclick="javascript: return confirm('真的要删除吗？');">删除</a>
  					</td>
  				</tr>
  			</s:iterator>
  		</table>
  	</s:if>
  	<s:else>
  		<p>目前还没有公司类型</p>
  	</s:else>
  	<div class="form1">
  	<form action="<%=path%>/admin/FacilitatorType_addType.action" method="post">
  		公司类型：<input type="text" name="facilitatorTypeName" class="txt" />
  		类型描述：<input type="text" name="facilitatorTypeExplain" class="txtDes" />
  		<input type="submit" value="增加" class="btn">
  		<input type="reset" value="重置" class="btn" />
  	</form>
  	</div>
  	</div>
  </body>
</html>
