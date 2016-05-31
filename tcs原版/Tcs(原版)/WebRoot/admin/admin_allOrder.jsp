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

<title>My JSP 'admin_allOrder.jsp' starting page</title>
<link href="<%=basePath%>css/admin_allOrder.css" type="text/css" rel="stylesheet">
</head>

<body>
	<div id="admin_allOrder">
		<form action="<%=path%>/admin/Order_selectAllOrder.action?page=1"
			method="get">
			请输入订单号：<input type="text" class="txt" name="key" value="${request.key }">
			<input type="submit" class="search" value="搜索">
		</form>
		<s:if test="#request.orderlist==null">
    	没有订单
    </s:if>
		<s:else>
			<table class="dataTable">
				<tr>
					<th>订单状态</th>
					<th>下单时间</th>
					<th>服务名称</th>
					<th>用户昵称</th>
					<th>用户电话</th>
					<th>公司名称</th>
					<th>公司电话</th>
					<th>购买次数</th>
					<th>订单金额</th>
					<th>公司确认完成时间</th>
					<th>订单完成时间</th>
				</tr>
				<s:iterator value="#request.orderlist" var="order">
					<tr>
						<td><s:property value="#order.orderNum" /></td>
						<td><s:property value="#order.orderTime" /></td>
						<td><s:if test="#order.order_service!=null">
								<s:property value="#order.order_service.serviceName" />
							</s:if> <s:else>
							服务公司已删除该服务
						</s:else>
						</td>
						<td><s:property value="#order.order_user.userName" /></td>
						<td><s:property value="#order.order_user.userPhone" /></td>
						<td><s:property value="#order.order_company.companyName" />
						</td>
						<td><s:property value="#order.order_company.companyPhone" />
						</td>
						<td><s:property value="#order.orderServiceAmount" /></td>
						<td><s:property value="#order.orderCost" /></td>

						<s:if test="#order.orderComEndTime==null">
							<td>公司尚未确认完成</td>
						</s:if>
						<s:else>
							<td><s:property value="#order.orderComEndTime" />
							</td>
						</s:else>

						<s:if test="#order.orderEndTime==null">
							<td>订单暂未完成</td>
						</s:if>
						<s:else>
							<td><s:property value="#order.orderEndTime" />
							</td>
						</s:else>
					</tr>
				</s:iterator>
			</table>
			<div id="page">
			<s:if test="#request.page==1">
				<s:if test="10>=#request.counts">
				首页&nbsp;上一页&nbsp;第<s:property value="#request.page" />页&nbsp;下一页&nbsp;尾页
			</s:if>
				<s:else>
				首页&nbsp;上一页&nbsp;第<s:property value="#request.page" />页&nbsp;
				<a
						href="<%=path%>/admin/Order_selectAllOrder.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
						<a
							href="<%=path%>/admin/Order_selectAllOrder.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
					</s:if>
					<s:else>
						<a
							href="<%=path%>/admin/Order_selectAllOrder.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
					</s:else>
				</s:else>
			</s:if>
			<s:else>
				<s:if test="#request.page*10>=#request.counts">
					<a
						href="<%=path%>/admin/Order_selectAllOrder.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
				<a
						href="<%=path%>/admin/Order_selectAllOrder.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
				第<s:property value="#request.page" />页&nbsp;下一页&nbsp;尾页
			</s:if>
				<s:else>
					<a
						href="<%=path%>/admin/Order_selectAllOrder.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
				<a
						href="<%=path%>/admin/Order_selectAllOrder.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
				第<s:property value="#request.page" />页&nbsp;
				<a
						href="<%=path%>/admin/Order_selectAllOrder.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
						<a
							href="<%=path%>/admin/Order_selectAllOrder.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
					</s:if>
					<s:else>
						<a
							href="<%=path%>/admin/Order_selectAllOrder.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
					</s:else>
				</s:else>
			</s:else>
			</div>
		</s:else>
	</div>
</body>
</html>
