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
    
    <title>My JSP 'uploadError.jsp' starting page</title>
    <link href="<%=basePath%>css/uploadError.css" type="text/css" rel="stylesheet">
  </head>
  
<s:if test="#session.loginAdmin== null">
	<body onload="pageIndexHref('<%=basePath%>');">
</s:if>
<s:else>
	<body>
</s:else>
  	<div id="uploadError">
	    <p>上传图片失败，图片格式错误或过大(图片大小不大于1M)</p>
	    <a href="<%=path%>/admin/admin_upload.jsp">返回</a>
    </div>
    <script type="text/javascript">
	function pageIndexHref(h) {
		parent.location.href = h + "/admin/admin_login.jsp";
	}
	</script>
  </body>
</html>
