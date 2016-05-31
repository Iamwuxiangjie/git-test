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
<script src="<%=basePath%>js/admin_mymessage.js" type="text/javascript"></script>
<link href="<%=basePath%>css/admin_mymessage.css" type="text/css" rel="stylesheet">
</head>

<body>
	<div id="admin_mymessage">
		<h2>未读消息</h2>
		<s:if test="#request.unreadmessage==null">
    	没有未读消息
    </s:if>
		<s:else>
			<form method="post" id="form1">
			<div class="ytable">
				<table class="dataTable">
					<tr>
						<th><input type="checkbox" id="all1" onclick="checkall(this,'message1')">全选</th>
						<th>发件人</th>
						<th>标题</th>
						<th>发件时间</th>
						<th>信息内容</th>
						<th>操作</th>
					</tr>
					<s:iterator value="#request.unreadmessage" var="message">
						<tr>
							<td><input class="message1" type="checkbox"
								name="messageidlist"
								value="<s:property value="#message.messageId"/>"
								onclick="check('message1')">
							</td>
							<td><s:if test="#message.messageFromCompany!=null">
							服务公司：<s:property value="#message.messageFromCompany.companyName" />
								</s:if> <s:elseif test="#message.messageFromUser!=null">
							用户：<s:property value="#message.messageFromUser.userName" />
								</s:elseif> <s:elseif test="#message.messageFromAdmin!=null">
							管理员：<s:property value="#message.messageFromAdmin.adminName" />
								</s:elseif> <s:else>
							系统中心
						</s:else></td>
							<td><s:property value="#message.messageTitle" /></td>
							<td><s:property value="#message.messageTime" /></td>
							<td><s:property value="#message.messageBody" /></td>
							<!-- 信息内容将隐藏，选中该行后显示在下面的详细信息中 -->
							<td><a
								href="<%=path%>/admin/Message_readMessage.action?messageidlist=<s:property value="#message.messageId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>">已读</a>
								<a
								href="<%=path%>/admin/Message_deleteMessage.action?messageidlist=<s:property value="#message.messageId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
								onclick="javascript: return confirm('真的要删除吗？');">删除</a> <s:if
									test="#message.messageFromUser!=null||#message.messageFromAdmin!=null||#message.messageFromCompany!=null">
									<a
										href="<%=path%>/admin/Message_getMessageToPeople?msgid=<s:property value="#message.messageId"/>&key=<s:property value="#request.key"/>">回复</a>
								</s:if></td>
						</tr>
					</s:iterator>
				</table>
				</div>
				<input type="submit" class="btn" value="批量删除" onclick="pd(this)">
				<input type="submit" class="btn" value="批量已读" onclick="pd(this)">
			</form>
		</s:else>

		<h2>已读消息</h2>
		<form
			action="<%=path%>/admin/Message_selectAdminAllMessage.action?page=1"
			method="get">
			请输入信息标题关键字：<input type="text" class="txt" name="key" value="${request.key }">
			<input type="submit" value="搜索" class="search">
		</form>
		<s:if test="#request.readmessage==null">
    	没有消息
    </s:if>
		<s:else>
			<form
				action="<%=path%>/admin/Message_deleteMessage.action?page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
				method="post">
				<table class="dataTable">
					<tr>
						<th><input type="checkbox" id="all2" onclick="checkall(this,'message2')">全选</th>
						<th>发件人</th>
						<th>标题</th>
						<th>发件时间</th>
						<th>信息内容</th>
						<th>操作</th>
					</tr>
					<s:iterator value="#request.readmessage" var="message">
						<tr>
							<td><input class="message2" type="checkbox"
								name="messageidlist"
								value="<s:property value="#message.messageId"/>"
								onclick="check('message2')">
							</td>
							<td><s:if test="#message.messageFromCompany!=null">
							服务公司：<s:property value="#message.messageFromCompany.companyName" />
								</s:if> <s:elseif test="#message.messageFromUser!=null">
							用户：<s:property value="#message.messageFromUser.userName" />
								</s:elseif> <s:elseif test="#message.messageFromAdmin!=null">
							管理员：<s:property value="#message.messageFromAdmin.adminName" />
								</s:elseif> <s:else>
							系统中心
						</s:else></td>
							<td><s:property value="#message.messageTitle" /></td>
							<td><s:property value="#message.messageTime" /></td>
							<td><s:property value="#message.messageBody" /></td>
							<!-- 信息内容将隐藏，选中该行后显示在下面的详细信息中 -->
							<td><a
								href="<%=path%>/admin/Message_deleteMessage.action?messageidlist=<s:property value="#message.messageId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
								onclick="javascript: return confirm('真的要删除吗？');">删除</a> <s:if
									test="#message.messageFromUser!=null||#message.messageFromAdmin!=null||#message.messageFromCompany!=null">
									<a
										href="<%=path%>/admin/Message_getMessageToPeople.action?msgid=<s:property value="#message.messageId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>">回复</a>
								</s:if></td>
						</tr>
					</s:iterator>
				</table>
				<input type="submit" value="批量删除" class="btn">
			</form>
			<div id="page">
			<s:if test="#request.page==1">
				<s:if test="10>=#request.counts">
				首页&nbsp;上一页&nbsp;第<s:property value="#request.page" />页&nbsp;下一页&nbsp;尾页
			</s:if>
				<s:else>
				首页&nbsp;上一页&nbsp;第<s:property value="#request.page" />页&nbsp;
				<a
						href="<%=path%>/admin/Message_selectAdminAllMessage.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
						<a
							href="<%=path%>/admin/Message_selectAdminAllMessage.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
					</s:if>
					<s:else>
						<a
							href="<%=path%>/admin/Message_selectAdminAllMessage.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
					</s:else>
				</s:else>
			</s:if>
			<s:else>
				<s:if test="#request.page*10>=#request.counts">
					<a
						href="<%=path%>/admin/Message_selectAdminAllMessage.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
				<a
						href="<%=path%>/admin/Message_selectAdminAllMessage.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
				第<s:property value="#request.page" />页&nbsp;下一页&nbsp;尾页
			</s:if>
				<s:else>
					<a
						href="<%=path%>/admin/Message_selectAdminAllMessage.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
				<a
						href="<%=path%>/admin/Message_selectAdminAllMessage.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
				第<s:property value="#request.page" />页&nbsp;
				<a
						href="<%=path%>/admin/Message_selectAdminAllMessage.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
						<a
							href="<%=path%>/admin/Message_selectAdminAllMessage.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
					</s:if>
					<s:else>
						<a
							href="<%=path%>/admin/Message_selectAdminAllMessage.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
					</s:else>
				</s:else>
			</s:else>
			</div>
		</s:else>
		
	</div>
</body>
</html>
