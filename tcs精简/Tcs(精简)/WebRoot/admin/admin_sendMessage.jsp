<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>管理员管理界面</title>
<link href="<%=basePath%>css/admin_sendMessage.css" type="text/css" rel="stylesheet">
</head>

<body>
	<div id="admin_sendMessage">
	<form action="<%=path%>/admin/Message_sendMessageToPeople.action" method="post">
		<s:if test="#request.toPerson==1">
			<input type="hidden" name="adminId" value="${requestScope.personId}">
		</s:if>
		<s:elseif test="#request.toPerson==2">
			<input type="hidden" name="userId" value="${requestScope.personId}">
		</s:elseif>
		<s:elseif test="#request.toPerson==3">
			<input type="hidden" name="companyId" value="${requestScope.personId}">
		</s:elseif>
		<p>收件人：<s:property value="#request.toPersonName" /></p>
		<p>标题：<input type="text" name="messageTitle" class="txt"></p>
		<p>内容：</p><textarea rows="5" cols="8" name="messageBody"></textarea>
		<p>
			<input type="submit" value="发送">
			<input type="reset" value="重置">
			<a href="javascript:history.go(-1);">返回</a>
		</p>
	</form>
	</div>
</body>
</html>
