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
	<link href="<%=basePath%>css/admin_updatePriveunit.css" type="text/css" rel="stylesheet">
  </head>
  
<s:if test="#session.loginAdmin== null">
	<body onload="pageIndexHref('<%=basePath%>');">
</s:if>
<s:else>
	<body>
</s:else>
  	<div id="admin_updatePriveunit">
  	<form action="<%=path%>/admin/Priveunit_updatePriveunit.action" method="post">
  		<input type="hidden" value="${request.priveunit.priveunitId }" name="priveunitId" />
  		价格单位：<input type="text" name="priveunitName" value="${request.priveunit.priveunitName }" class="txt" />
  		<input type="submit" value="修改" onclick="javascript: return confirm('确认修改？');" class="btn" />
  		<input type="reset" value="重置" class="btn" />
  	</form>
    </div>
    <script type="text/javascript">
	function pageIndexHref(h) {
		parent.location.href = h + "/admin/admin_login.jsp";
	}
	</script>
  </body>
</html>
