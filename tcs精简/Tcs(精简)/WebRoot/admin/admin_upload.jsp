<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang='en'>
<head>
<base href="<%=basePath%>">

<title>管理员管理界面</title>
<link href="<%=basePath%>css/admin_upload.css" type="text/css" rel="stylesheet">
<script src="<%=basePath%>js/admin_upload.js" type="text/javascript"></script>
</head>

<body>
	<div id="admin_upload">
		<div id="localImag">
			<s:if test="#session.loginAdmin.adminImg==null">
				<img id="preview" width="200" height="200" alt="管理员头像"
					src="./defaultImg/ic_launcher.png">
			</s:if>
			<s:else>
				<img id="preview" width="200" height="200" alt="管理员头像"
					src="${sessionScope.loginAdmin.adminImg }">
			</s:else>
		</div>
		<div id="localForm">
			<div id="localError">未上传任何图片</div>
			<s:form action="/admin/Admin_upload.action" method="post"
				enctype="multipart/form-data">
				<s:file name="img" id="doc" onchange="javascript:setImagePreview();"></s:file>
				<s:submit value="上传" onclick="return setUpload()" />
			</s:form>
		</div>
	</div>
</body>
</html>
