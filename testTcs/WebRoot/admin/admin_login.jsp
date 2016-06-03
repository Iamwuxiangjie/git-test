<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>塔塔家政网-管理员查看所有用户</title>
<link href="<%=basePath%>images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="<%=basePath%>css/admin_login.css" type="text/css" rel="stylesheet">
<script src="<%=basePath%>js/admin_login.js" type="text/javascript"></script>
</head>
<body>
	<div id="admin_login">
		<h1>智慧社区家政服务管理系统</h1>
		<div class="login">
			<div>
				<span>管 理 登 录</span>
			</div>
			<form action="<%=path%>/admin/Admin_login.action" method="post" name="form1">
				<input type="text" name="adminAccount" value="${session.loginAdmin.adminAccount}" class="txtName" placeholder="Username" autocomplete="off">
				<input type="password" name="adminPwd" value="${session.loginAdmin.adminPwd}" class="txtPwd" placeholder="Password" autocomplete="off">
				<input type="submit" value="登 录" class="btn" id="btnlogin" onclick="login()">
			</form>
			<s:fielderror />
		</div>
		<div id="loading" class="loading"></div>
		版权所有 ©智慧社区家政服务
	</div>
</body>
</html>

