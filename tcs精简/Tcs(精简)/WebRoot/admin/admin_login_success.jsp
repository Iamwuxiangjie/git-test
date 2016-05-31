<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>管理员管理界面</title>
<link href="<%=basePath%>images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="<%=basePath%>css/admin_login_success.css" type="text/css" rel="stylesheet">
</head>
<s:if test="#session.loginAdmin== null">
	<body onload="pageIndexHref('<%=basePath%>');">
</s:if>
<s:else>
	<body>
</s:else>
<div id="top">
	<div class="logo"></div>
	<div class="admin">
		<s:if test="#session.loginAdmin.adminImg!=null">
		<a href="<%=path%>/admin/admin_upload.jsp" target="main">
			<img width="50" height="50" title="修改头像" alt="管理员头像" src="${sessionScope.loginAdmin.adminImg }" />
		</a>
		</s:if>
		<s:else>
			<a href="<%=path%>/admin/admin_upload.jsp" target="main">
				<img width="50" height="50" title="修改头像" alt="管理员头像" src="./defaultImg/ic_launcher.png">
			</a>
		</s:else>
		<span>${sessionScope.loginAdmin.adminName}</span>
	</div>
</div>
<div id="left">
	<ul>
		<li>
			<s:if test='#session.unreadmessage==0'>
				<a href="<%=path%>/admin/Message_selectAdminAllMessage.action?page=1" target="main">消息中心</a>
			</s:if>
			<s:else>
				<a href="<%=path%>/admin/Message_selectAdminAllMessage.action?page=1" target="main">消息中心(<span>${sessionScope.unreadmessage}</span>)</a>
			</s:else>
		</li>
		<li>
			<a href="<%=path%>/admin/Company_selectAllCompany.action?page=1" target="main">查看所有公司</a>
		</li>
		<li>
			<a href="<%=path%>/admin/Order_selectAllOrder.action?page=1" target="main">查看所有订单</a>
		</li>
		<li>
			<a href="<%=path%>/admin/Service_servicePrice.action" target="main">查看服务类型价格</a>
		</li>
		<li>
			<a href="<%=path%>/admin/Service_serviceTop.action?page=1" target="main">查看服务排行</a>
		</li>
		<li>
			<a href="<%=path%>/admin/FacilitatorType_getType.action" target="main">增加公司类型</a>
		</li>
		<li>
			<a href="<%=path%>/admin/ServiceType_getServiceType.action" target="main">增加服务类型</a>
		</li>
		<li>
			<a href="<%=path%>/admin/Priveunit_getPriveunit.action" target="main">增加价格单位</a>
		</li>
		<li>
			<a href="<%=path%>/admin/admin_repwd.jsp" target="main">密码修改</a>
		</li>
		
		<li>
			<a href="<%=path%>/admin/Admin_refresh.action">刷新</a>
		</li>
		<li>
			<a href="<%=path%>/admin/Admin_logout.action">退出登录</a>
		</li>
	</ul>
</div>
<div id="main">
	<div class="ifrm">
		<iframe name="main" src="<%=path%>/admin/Message_selectAdminAllMessage.action?page=1"></iframe>
	</div>	
</div>
<script type="text/javascript">
	function pageIndexHref(h) {
		window.location.href = h + "/admin/admin_login.jsp";
	}
</script>
</body>
</html>