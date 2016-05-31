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
	<link href="<%=basePath%>css/admin_updateServiceType.css" type="text/css" rel="stylesheet">
  </head>
  
  <body>
  	<div id="admin_updateServiceType">
    <form action="<%=path%>/admin/ServiceType_updateType.action" method="post">
  		<input type="hidden" value="${request.type.serviceTypeId }" name="serviceTypeId" />
  		服务类型：<input type="text" name="serviceTypeName" value="${request.type.serviceTypeName }" class="txt" />
  		<input type="submit" value="修改" onclick="javascript: return confirm('确认修改？');" class="btn" />
  		<input type="reset" value="重置" class="btn" />
  	</form>
  	</div>
  </body>
</html>
