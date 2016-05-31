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
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>公司信息管理界面</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
</head>

<body>
	<nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">
                            Toggle navigation
                        </span>
                        <span class="icon-bar">
                        </span>
                        <span class="icon-bar">
                        </span>
                        <span class="icon-bar">
                        </span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img src="images/logo.png" alt="TATA"/>
                    </a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="<%=path%>/web/index.jsp">
                                首页
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                关于我们
                            </a>
                        </li>
                        <li>
                            <a href="<%=path%>/user/Service_getLikeServices?page=1">
                                服务列表
                            </a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="login.html" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                欢迎！${sessionScope.loginCompany.companyName}
                                <span class="caret">
                                </span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="<%=path%>/company/Company_logout.action">
                                        退出登录
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <form method="post" action="user/Service_getLikeServices" class="navbar-form navbar-right">
                        <input type="hidden" name="page" value="1"/>
  						<input type="hidden" name="ServiceTypeId" value="<s:property value='#ServiceTypeId==null?0:#ServiceTypeId'/>"/>	
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="服务名称关键字" name="likename" value="<s:property value="#likename"/>"/>
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                    搜索
                                </button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
        </nav>
	<div class="information container">
		<h3>订单记录</h3>
		<ul class="account-nav">
                <li>
                    <a href="<%=path%>/company/company_login_success.jsp">
                        公司账户
                    </a>
                </li>
                <s:if test="#session.loginCompany.companyStage!=0">
				<li>
                    <a href="<%=path%>/company/Service_selectComAllService.action?page=1">
                        全部推送服务
                    </a>
                </li>
                <li class="active">
                    <a href="<%=path%>/company/Order_selectComAllOrder.action?page=1">
                        订单记录
                    </a>
                </li>
                <li>
                    <a href="<%=path%>/company/Comment_selectComAllComment.action?page=1">
                        评价记录
                    </a>
                </li>
				</s:if>
                <li>
                    <s:if test='#session.unreadmessage==0'>
						<a href="<%=path%>/company/Message_selectComAllMessage.action?page=1">消息中心</a>
					</s:if>
					<s:else>
						<a href="<%=path%>/company/Message_selectComAllMessage.action?page=1">消息中心 <span class="badge">${sessionScope.unreadmessage}</span></a>
					</s:else>
                </li>
            </ul>
		<form action="<%=path%>/company/Order_selectComAllOrder.action?page=1" method="get">
		<div class="container">
			<div class="row">
				<div class="indent-search col-xs-10 col-md-4">
                        <div class="input-group">
                        	
                            <input type="text" name="key" value="${request.key }"class="form-control" placeholder="请输入订单编号"/>
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                    查询
                                </button>
                            </span>
                           
                        </div>
                    </div>
			</div>
		</div>
		 </form>
		<div class="table-responsive">
			<s:if test="#request.orderlist.size()<1">
    	没有订单
    		</s:if>
			<s:else>
				<table class="table table-hover">
					<thead>
						<tr>
							<td>订单状态</td>
				<td>下单时间</td>
				<td>服务名称</td>
				<td>用户昵称</td>
				<td>用户地址</td>
				<td>用户详细地址</td>
				<td>用户电话</td>
				<td>购买次数</td>
				<td>订单金额</td>
				<td>公司确认完成时间</td>
				<td>订单完成时间</td>
				<td>操作</td>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#request.orderlist" var="order">
				<tr>
					<td><s:property value="#order.orderNum" /></td>
					<td><s:property value="#order.orderTime" /></td>
					<td>
						<s:if test="#order.order_service!=null">
							<s:property value="#order.order_service.serviceName" />
						</s:if>
						<s:else>
							服务公司已删除该服务
						</s:else>
					</td>
					<td><s:property value="#order.order_user.userName" /></td>
					<td><s:property value="#order.order_user.userAddress" /></td>
					<td><s:property value="#order.order_user.userAddress2" /></td>
					<td><s:property value="#order.order_user.userPhone" /></td>
					<td><s:property value="#order.orderServiceAmount" /></td>
					<td><s:property value="#order.orderCost" /></td>

					<s:if test="#order.orderComEndTime==null">
						<td><a
							href="<%=path%>/company/Order_orderComOK.action?orderid=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>">本公司确认完成</a>
						</td>
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
					<td><a href="<%=path%>/company/Message_orderGetMessageToUser.action?userid=<s:property value="#order.order_user.userId"/>">发消息</a></td>
				</tr>
			</s:iterator>
					</tbody>
				</table>
				<s:if test="#request.page==1">
			<s:if test="10>=#request.counts" >
				首页&nbsp;上一页&nbsp;第<s:property value="#request.page"/>页&nbsp;下一页&nbsp;尾页
			</s:if>
			<s:else>
				首页&nbsp;上一页&nbsp;第<s:property value="#request.page"/>页&nbsp;
				<a href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
					<a href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
				</s:if>
				<s:else>
					<a href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
				</s:else>
			</s:else>
    	</s:if>
		<s:else>
			<s:if test="#request.page*10>=#request.counts" >
				<a href="<%=path%>/company/Order_selectComAllOrder.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
				<a href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
				第<s:property value="#request.page"/>页&nbsp;下一页&nbsp;尾页
			</s:if>
			<s:else>
				<a href="<%=path%>/company/Order_selectComAllOrder.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
				<a href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
				第<s:property value="#request.page"/>页&nbsp;
				<a href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
					<a href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
				</s:if>
				<s:else>
					<a href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
				</s:else>
			</s:else>
		</s:else>
	</s:else>
		</div>
	</div>
	<div class="footer">Copyright &copy; 2016 DXSTUDIO. All Rights
		Reserved.</div>
	<script src="js/jquery-1.12.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/function.js"></script>
</body>
</html>
