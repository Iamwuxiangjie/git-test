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
	<link href="<%=basePath%>css/admin_updateFacilitatorType.css" type="text/css" rel="stylesheet">
  </head>
  
  <body>
  	<div id="admin_updateFacilitatorType">
  	<form action="<%=path%>/admin/FacilitatorType_updateType.action" method="post">
  		<input type="hidden" value="${request.type.facilitatorTypeId }" name="facilitatorTypeId" />
  		公司类型：<input type="text" name="facilitatorTypeName" value="${request.type.facilitatorTypeName }" class="txt" />
  		类型描述：<input type="text" name="facilitatorTypeExplain"  value="${request.type.facilitatorTypeExplain }" class="txtDes" />
  		<input type="submit" value="修改" onclick="javascript: return confirm('确认修改？');" class="btn" />
  		<input type="reset" value="重置" class="btn" />
  	</form>
  	</div>
  </body>
</html>
