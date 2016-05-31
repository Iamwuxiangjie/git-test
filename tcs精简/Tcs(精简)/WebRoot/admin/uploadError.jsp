<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
  
  <body>
  	<div id="uploadError">
	    <p>上传图片失败，图片格式错误或过大(图片大小不大于1M)</p>
	    <a href="<%=path%>/admin/admin_upload.jsp">返回</a>
    </div>
  </body>
</html>
