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
<link href="<%=basePath%>css/admin_repwd.css" type="text/css" rel="stylesheet">
<script src="<%=basePath%>js/admin_repwd.js" type="text/javascript"></script>
</head>

<s:if test="#session.loginAdmin== null">
	<body onload="pageIndexHref('<%=basePath%>');">
</s:if>
<s:else>
	<body>
</s:else>
	<div id="admin_repwd">
		<div class="form1">
		<form action="<%=path%>/admin/Admin_rePwd.action" method="post" name="frm">
			<p>
				旧 密 码 ：<input type="password" name="oldpwd" id="txtold" />	
			</p>
			<s:fielderror />
			<span id="oldpwd"></span>
			<p>
				新 密 码 ：<input type="password" name="newpwd" id="txtnew" />
			</p>
			<span id="newpwd"></span>
			<p>
				确认密码：<input type="password" name="newrepwd" id="txtre" />
			</p>
			<span id="newrepwd"></span>
			<input type="submit" value="确认修改" class="btn" onclick="return repwd()" />
		</form>
		</div>
	</div>
	<script type="text/javascript">
	function pageIndexHref(h) {
		parent.location.href = h + "/admin/admin_login.jsp";
	}
	</script>
</body>
</html>
