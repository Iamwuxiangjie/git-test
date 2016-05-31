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
<link href="<%=basePath%>css/admin_repwdSuccess.css" type="text/css" rel="stylesheet">
</head>

<body>
	<div id="admin_repwdSuccess">
		<p>
			<span>密码修改成功！请</span>
			<a href="<%=path%>/admin/admin_login.jsp" target="_top">重新登录</a>
		</p>
	</div>
</body>
</html>
