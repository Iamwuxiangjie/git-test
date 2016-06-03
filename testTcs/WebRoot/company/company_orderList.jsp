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
<style type="text/css">
	b{
		font-weight: normal;
	}
	.now{
		color: #a1b572;
		font-weight: bolder;
	}
	.befor{
		color: #aaa;
	}
	.after{
		color: #337ab7;
	}
</style>
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
    			<div class="col-xs-1 col-md-offset-5">
            		<img width="212px" height="300px" src="images/toshop.jpg">
            	</div>
    			<div class="col-xs-3 col-md-offset-5">
            		<h4>还没有订单,快去推广吧！</h4>
            	</div>
    		</s:if>
			<s:else>
				<table class="table" border="1" bordercolor="#d5d5d5" style="text-align: center;font-size:12px;min-width:1079px;">
					<thead>
						<tr style="background-color: #F1F1F1;">
							<td colspan="2" style="border-right-color: #f1f1f1">服务</td>
							<td width="120" style="border-right-color: #f1f1f1">单价</td>
							<td width="55" style="border-right-color: #f1f1f1">数量</td>
							<td width="128" style="border-right-color: #f1f1f1">实付款(元)</td>
							<td width="200" style="border-right-color: #f1f1f1">联系买家</td>
							<td width="107" style="border-right-color: #f1f1f1">交易状态</td>
							<td width="100">交易操作</td>
					</thead>
				</table>
						<s:iterator value="#request.orderlist" var="order">
						<div style="margin-top: 20px;">
							<table class="table" border="1" bordercolor="#d5d5d5" style="text-align: center;font-size:12px;min-width:1079px;">
							<thead>
							<tr style="background-color: #F1F1F1;">
								<td colspan="2" style="border-right-color: #f1f1f1"><strong><s:property value="#order.orderTime" /></strong>&nbsp;&nbsp;&nbsp;&nbsp;订单号:<s:property value="#order.orderNum" /></td>
								<td width="280" colspan="3" style="border-right-color: #f1f1f1"><span class="userName" title="<s:property value="#order.order_user.userName" />" style="cursor: pointer;"><s:property value="#order.order_user.userName" /></span></td>
								<td width="200" style="border-right-color: #f1f1f1">
									买家电话:<s:property value="#order.order_user.userPhone" />
								</td>
								<td width="100" style="border-right-color: #f1f1f1">&nbsp;</td>
								<td width="100">
									&nbsp;
								</td>
							</tr>
							</thead>
							<tr>
								<td style="border-right-color: #eee">
								<s:if test="#order.order_service.serviceImg==null">
								<div class="thumbnail">
									<a href="<%=path%>/web/Service_forwardto.action?page=1&serviceid=<s:property value="#order.order_service.serviceId"/>">
										<img id="preview" width="120" height="120" alt="服务图片" src="images/img.svg">
									</a>
								</div>
								</s:if>
								<s:else>
								<div class="thumbnail">
									<a href="<%=path%>/web/Service_forwardto.action?page=1&serviceid=<s:property value="#order.order_service.serviceId"/>">
										<img id="preview" width="120" height="120" alt="服务图片" src='<s:property value="#order.order_service.serviceImg"/>'>
									</a>
								</div>
								</s:else>
								</td>
								<td align="left" width="200px">
									<s:if test="#order.order_service!=null">
										<a href="<%=path%>/web/Service_forwardto.action?page=1&serviceid=<s:property value="#order.order_service.serviceId"/>">
											<span class="serviceName" title="<s:property value="#order.order_service.serviceName" />" style="cursor: pointer;line-height:30px"><s:property value="#order.order_service.serviceName" /></span>
										</a>
									</s:if> 
									<s:else>
										服务公司已删除该服务
									</s:else>
								</td>
								<td style="border-right-color: #eee">
									<span style="line-height:30px"><s:property value="#order.order_service.serviceprice" /></span>
								</td>
								<td style="border-right-color: #eee">
									<span style="line-height:30px"><s:property value="#order.orderServiceAmount" /></span>
								</td>
								<td>
									<span style="line-height:30px"><s:property value="#order.orderCost" /></span>
								</td>
								<td>
								<span style="line-height:30px">
									<a href="<%=path%>/company/Message_orderGetMessageToUser.action?userid=<s:property value="#order.order_user.userId"/>">
										发消息
									</a>
								</span>
								</td>
								<td>
								<s:if test="#order.orderStage==-1">
									<b class="now">新的订单</b><br>
									<b class="after">已接单</b><br>
									<b class="after">正在服务</b><br>
									<b class="after">等待用户确认</b><br>
									<b class="after">等待评价</b><br>
									<b class="after">交易完成</b>
								</s:if>
								<s:elseif test="#order.orderStage==0">
									<b class="now">新的订单</b><br>
									<b class="after">已接单</b><br>
									<b class="after">正在服务</b><br>
									<b class="after">等待用户确认</b><br>
									<b class="after">等待评价</b><br>
									<b class="after">交易完成</b>
								</s:elseif>
								<s:elseif test="#order.orderStage==1">
									<b class="befor">新的订单</b><br>
									<b class="now">已接单</b><br>
									<b class="after">正在服务</b><br>
									<b class="after">等待用户确认</b><br>
									<b class="after">等待评价</b><br>
									<b class="after">交易完成</b>
								</s:elseif>
								<s:elseif test="#order.orderStage==2">
									<b class="befor">新的订单</b><br>
									<b class="befor">已接单</b><br>
									<b class="now">正在服务</b><br>
									<b class="after">等待用户确认</b><br>
									<b class="after">等待评价</b><br>
									<b class="after">交易完成</b>
								</s:elseif>
								<s:elseif test="#order.orderStage==3">
									<b class="befor">新的订单</b><br>
									<b class="befor">已接单</b><br>
									<b class="befor">正在服务</b><br>
									<b class="now">等待用户确认</b><br>
									<b class="after">等待评价</b><br>
									<b class="after">交易完成</b>
								</s:elseif>
								<s:elseif test="#order.orderStage==4">
									<b class="befor">新的订单</b><br>
									<b class="befor">已接单</b><br>
									<b class="befor">正在服务</b><br>
									<b class="befor">等待用户确认</b><br>
									<b class="now">等待评价</b><br>
									<b class="after">交易完成</b>
								</s:elseif>
								<s:elseif test="#order.orderStage==5">
									<b class="befor">新的订单</b><br>
									<b class="befor">已接单</b><br>
									<b class="befor">正在服务</b><br>
									<b class="befor">等待用户确认</b><br>
									<b class="befor">等待评价</b><br>
									<b class="now">交易完成</b>
								</s:elseif>
								</td>
								<td>
								<s:if test="#order.orderStage==-1">
									<span style="line-height:30px">
										<a class="btn btn-danger" href="<%=path%>/company/Order_deleteOrder.action?orderId=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
											onclick="javascript: return confirm('真的要取消吗？');">
											取消订单
										</a><br>
									</span>
									<hr>
									<span style="line-height:30px;"><b class="befor">等待付款...</b></span>
								</s:if>
								<s:elseif test="#order.orderStage==0">
									<span style="line-height:30px">
										<a class="btn btn-danger" href="<%=path%>/company/Order_deleteOrder.action?orderId=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
											onclick="javascript: return confirm('真的要取消吗？');">
											取消订单
										</a><br>
									</span>
									<hr>
									<span style="line-height:30px">
										<a class="btn btn-success" href="<%=path%>/company/Order_orderComToDo.action?orderid=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>">
											确认接单
										</a>
									</span>
								</s:elseif>
								<s:elseif test="#order.orderStage==1">
									<span style="line-height:30px">
										<a class="btn btn-danger" href="<%=path%>/company/Order_deleteOrder.action?orderId=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
											onclick="javascript: return confirm('真的要取消吗？');">
											取消订单
										</a><br>
									</span>
									<hr>
									<span style="line-height:30px">
										<a class="btn btn-primary" href="<%=path%>/company/Order_orderComStart.action?orderid=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>">
											开始服务
										</a>
									</span>
								</s:elseif>
								<s:elseif test="#order.orderStage==2">
									<span style="line-height:30px">
										<a class="btn btn-info" href="<%=path%>/company/Order_orderComOK.action?orderid=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>">
											服务完成
										</a>
									</span>
								</s:elseif>
								<s:elseif test="#order.orderStage==3">
										<span style="line-height:30px;"><b class="befor">等待确认</b></span>
								</s:elseif>
								<s:elseif test="#order.orderStage==4">
										<span style="line-height:30px"><b class="befor">等待评价</b></span>
								</s:elseif>
								<s:elseif test="#order.orderStage==5">
										<span style="line-height:30px"><b class="now">已评价</b></span>
								</s:elseif>
								</td>
							</tr>
							<tr>
								<td colspan="8" align="left">
									服务地址： <s:property value="#order.order_user.userAddress" />/<s:property
								value="#order.order_user.userAddress2" /> 
								<s:if test="#order.orderStage==0">
									<s:if test="#order.orderComEndTime==null">
										<strong>|</strong>
										预计开始时间： <s:property value="#order.orderStartTime" />
									</s:if>
									<s:else>
										<strong>|</strong>
										公司确认完成时间：<s:property value="#order.orderComEndTime" />
									</s:else>
								</s:if>
								<s:elseif test="#order.orderStage==4">
									<strong>|</strong>
									订单结束时间：<s:property value="#order.orderEndTime" />
								</s:elseif>
								</td>
							</tr>
							</table>
							</div>
						</s:iterator>
						
						<div style="float:right">
					<s:if test="#request.page==1">
						<s:if test="10>=#request.counts">
							<a class="btn btn-default">首页</a>&nbsp;
							<a class="btn btn-default">上一页</a>&nbsp;
							第<s:property value="#request.page" />页&nbsp;
							<a class="btn btn-default">下一页</a>&nbsp;
							<a class="btn btn-default">尾页</a>
						</s:if>
						<s:else>
							<a class="btn btn-default">首页</a>&nbsp;
							<a class="btn btn-default">上一页</a>&nbsp;
							第<s:property value="#request.page" />页&nbsp;
							<a class="btn btn-success" href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
							<s:if test="#request.counts%10==0">
								<a class="btn btn-info" href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
							</s:if>
							<s:else>
								<a class="btn btn-info" href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
							</s:else>
						</s:else>
					</s:if>
					<s:else>
						<s:if test="#request.page*10>=#request.counts">
							<a class="btn btn-info" href="<%=path%>/company/Order_selectComAllOrder.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
							<a class="btn btn-success" href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
							第<s:property value="#request.page" />页&nbsp;
							<a class="btn btn-default">下一页</a>&nbsp;
							<a class="btn btn-default">尾页</a>
						</s:if>
						<s:else>
							<a class="btn btn-info" href="<%=path%>/company/Order_selectComAllOrder.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
							<a class="btn btn-success" href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
							第<s:property value="#request.page" />页&nbsp;
							<a class="btn btn-success" href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
						<s:if test="#request.counts%10==0">
							<a class="btn btn-info" href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:if>
						<s:else>
							<a class="btn btn-info" href="<%=path%>/company/Order_selectComAllOrder.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:else>
					</s:else>
				</s:else>
				</div>
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
