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

<title>My JSP 'admin_servicePrice.jsp' starting page</title>
<link href="<%=basePath%>css/admin_servicePrice.css" type="text/css" rel="stylesheet">
<script src="<%=basePath%>js/admin_servicePrice.js" type="text/javascript"></script>
</head>

<s:if test="#session.loginAdmin== null">
	<body onload="pageIndexHref('<%=basePath%>');">
</s:if>
<s:else>
	<body>
</s:else>
	<div id="admin_servicePrice">
		<s:if test="#request.typenamelist.size>0">
			<div id="service">
				<ul>
					<s:iterator value="#request.typenamelist" var="typename"
						status="st1">
						<li onclick="fan(this)">
							<div id="serName">
								<s:property value="#typename" />
							</div> 
							<s:iterator value="#request.pricelist" status="st2">
								<s:if test="#st1.index==#st2.index">
									<div id="serPrice">
										<s:if test="avg!=0">
											<p>
												平均价格:
												<s:property value="avg" />
											</p>
											<p>
												最高价:
												<s:property value="max" />
											</p>
											<p>
												最低价:
												<s:property value="min" />
											</p>
										</s:if>
										<s:else>
  										<p>该服务类别暂无价格</p>
										</s:else>
									</div>
								</s:if>
							</s:iterator></li>
					</s:iterator>
				</ul>
			</div>
		</s:if>
		<s:else>
  		暂无价格情报
  	</s:else>
	</div>
	<script type="text/javascript">
	function pageIndexHref(h) {
		parent.location.href = h + "/admin/admin_login.jsp";
	}
	</script>
</body>
</html>
