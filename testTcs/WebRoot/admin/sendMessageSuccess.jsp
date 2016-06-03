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
<link href="<%=basePath%>css/sendMessageSuccess.css" type="text/css" rel="stylesheet">
</head>

<s:if test="#session.loginAdmin== null">
	<body onload="pageIndexHref('<%=basePath%>');">
</s:if>
<s:else>
	<body>
</s:else>
	<div id="sendMessageSuccess">
		<p>
			<span>信息发送成功！</span>
		</p>
		<p>
			<a href="javascript:history.go(-2);">返回</a>
		</p>
	</div>
	<script type="text/javascript">
	function pageIndexHref(h) {
		parent.location.href = h + "/admin/admin_login.jsp";
	}
	</script>
</body>
</html>
