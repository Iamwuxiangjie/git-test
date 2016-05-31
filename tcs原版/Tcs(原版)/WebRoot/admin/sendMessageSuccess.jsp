<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>管理员管理界面</title>
<link href="<%=basePath%>css/sendMessageSuccess.css" type="text/css" rel="stylesheet">
</head>

<body>
	<div id="sendMessageSuccess">
		<p>
			<span>信息发送成功！</span>
		</p>
		<p>
			<a href="javascript:history.go(-2);">返回</a>
		</p>
	</div>
</body>
</html>
