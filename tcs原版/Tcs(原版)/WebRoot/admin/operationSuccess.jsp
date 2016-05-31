<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'operationSuccess.jsp' starting page</title>
<link href="<%=basePath%>css/operationSuccess.css" type="text/css" rel="stylesheet">
</head>

<body>
	<div id="operationSuccess">
		<p><span>操作成功！</span></p>
		<p><a href="javascript:history.go(-1);">返回</a></p>
	</div>
</body>
</html>
