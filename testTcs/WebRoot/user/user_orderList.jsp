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
<title>用户信息管理</title>
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
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only"> Toggle navigation </span> <span
					class="icon-bar"> </span> <span class="icon-bar"> </span> <span
					class="icon-bar"> </span>
			</button>
			<a class="navbar-brand" href="#"> <img src="images/logo.png"
				alt="TATA" /> </a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="<%=path%>/web/index.jsp"> 首页 </a></li>
				<li><a href="#"> 关于我们 </a></li>
				<li><a href="<%=path%>/user/Service_getLikeServices?page=1">
						服务列表 </a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="login.html"
					class="dropdown-toggle" data-toggle="dropdown"
					data-hover="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"> 欢迎！${sessionScope.loginUser.userName} <span
						class="caret"> </span> </a>
					<ul class="dropdown-menu">
						<li><a href="<%=path%>/user/User_logout.action"> 退出登录 </a></li>
					</ul></li>
			</ul>
			<form method="post" action="user/Service_getLikeServices"
				class="navbar-form navbar-right">
				<input type="hidden" name="page" value="1" /> <input type="hidden"
					name="ServiceTypeId"
					value="<s:property value='#ServiceTypeId==null?0:#ServiceTypeId'/>" />
				<div class="input-group">
					<input type="text" class="form-control" placeholder="服务名称关键字"
						name="likename" value="<s:property value="#likename"/>" /> <span
						class="input-group-btn">
						<button class="btn btn-default" type="submit">搜索</button> </span>
				</div>
			</form>
		</div>
	</div>
	</nav>
	<div class="information container">
		<h3>订单记录</h3>
		<ul class="account-nav">
			<li><a href="<%=path%>/user/user_login_success.jsp"> 账户 </a></li>
			<li class="active"><a
				href="<%=path%>/user/Order_selectUserAllOrder.action?page=1">
					订单记录 </a></li>
			<li><a
				href="<%=path%>/user/Comment_selectUserAllComment.action?page=1">
					评价记录 </a></li>
			<li><s:if test='#session.unreadmessage==0'>
					<a href="<%=path%>/user/Message_selectUserAllMessage.action?page=1">消息中心</a>
				</s:if> <s:else>
					<a href="<%=path%>/user/Message_selectUserAllMessage.action?page=1">消息中心
						<span class="badge">${sessionScope.unreadmessage}</span>
					</a>
				</s:else></li>
		</ul>
		<form action="<%=path%>/user/Order_selectUserAllOrder.action?page=1"
			method="get">
			<div class="container">
				<div class="row">
					<div class="indent-search col-xs-10 col-md-4">
						<div class="input-group">

							<input type="text" name="key" class="form-control"
								value="${request.key }" placeholder="请输入订单编号" /> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit">查询</button> </span>

						</div>
					</div>
				</div>
			</div>
		</form>
		<div class="table-responsive">
			<s:if test="#request.orderList.size()<1">
    			<div class="col-xs-1 col-md-offset-5">
            		<img width="212px" height="300px" src="images/toshop.jpg">
            	</div>
    			<div class="col-xs-3 col-md-offset-5">
            		<h4>还没有订单,快去选购吧！</h4>
            	</div>
    		</s:if>
			<s:else>
				<table class="table" border="1" bordercolor="#d5d5d5"
					style="text-align: center;font-size:12px;min-width:1079px;">
					<thead>
						<tr style="background-color: #F1F1F1">
							<td colspan="2" style="border-right-color: #f1f1f1">服务</td>
							<td width="120" style="border-right-color: #f1f1f1">单价</td>
							<td width="60" style="border-right-color: #f1f1f1">数量</td>
							<td width="120" style="border-right-color: #f1f1f1">实付款(元)</td>
							<td width="200" style="border-right-color: #f1f1f1">联系我们</td>
							<td width="110" style="border-right-color: #f1f1f1">交易状态</td>
							<td width="100">交易操作</td>
					</thead>
				</table>
						<s:iterator value="#request.orderList" var="order">
						<div style="margin-top: 20px;">
							<table class="table" border="1" bordercolor="#d5d5d5" style="text-align: center;font-size:12px;min-width:1079px;">
							<thead>
							<tr style="background-color: #F1F1F1;">
								<td colspan="2" style="border-right-color: #f1f1f1"><strong><s:property value="#order.orderTime" /></strong>&nbsp;&nbsp;&nbsp;&nbsp;订单号:<s:property value="#order.orderNum" /></td>
								<td width="280" colspan="3" style="border-right-color: #f1f1f1"><span class="companyName" title="<s:property value="#order.order_company.companyName" />" style="cursor: pointer;"><s:property value="#order.order_company.companyName" /></span></td>
								<td width="200" style="border-right-color: #f1f1f1;">
									公司电话:<s:property value="#order.order_company.companyPhone" />
								</td>
								<td width="200" colspan="2">
									公司评分:<s:property value="#order.order_company.companyGrade" />
								</td>
							</tr>
							</thead>
							<tr>
								<td style="border-right-color: #eee" align="center">
								<s:if test="#order.order_service.serviceImg==null">
								
								<div class="thumbnail">
									<a href="<%=path%>/web/Service_forwardto.action?page=1&serviceid=<s:property value="#order.order_service.serviceId"/>">
										<img id="preview" width="140" alt="服务图片" src="images/img.svg">
									</a>
								</div>	
								
								</s:if>
								<s:else>
								
								<div class="thumbnail">
									<a href="<%=path%>/web/Service_forwardto.action?page=1&serviceid=<s:property value="#order.order_service.serviceId"/>">
										<img id="preview" width="140" alt="服务图片" src='<s:property value="#order.order_service.serviceImg"/>'>
									</a>
								</div>
								
								</s:else>
								</td>
								<td align="left" width="200px">
									<s:if test="#order.order_service!=null">
										<a href="<%=path%>/web/Service_forwardto.action?page=1&serviceid=<s:property value="#order.order_service.serviceId"/>">
											<span class="serviceName" title="<s:property value="#order.order_service.serviceName" />" style="cursor: pointer;line-height:30px"><s:property value="#order.order_service.serviceName" /></span>
										</a>
										<br>
										<span style="line-height:30px;color:#888"><small><s:property value="#order.order_service.serviceExplain" /></small><br></span>
										<form method="get" action="web/Service_forwardto">
    										<input type="hidden" value="<s:property value="#order.order_service.serviceId"/>" name="serviceid"/>
    										<input type="hidden" value="1" name="page"/>
    										<button type="submit" class="btn btn-default"
												data-toggle="modal" data-target="#exampleModal" style="float:right;margin-top:5px">
												查看详情
											</button>
                            			</form>
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
									<a href="<%=path%>/user/Message_orderGetMessageToCom.action?comid=<s:property value="#order.order_company.companyId"/>">
										发消息
									</a><br>
									<a href="<%=path%>/user/Admin_getAllAdminName.action" style="color: #dd5555">
										举报商家
									</a>
									</span>
								</td>
								<td>
									<s:if test="#order.orderStage==-1">
										<b class="now">等待付款</b><br>
										<b class="after">已接单</b><br>
										<b class="after">正在服务</b><br>
										<b class="after">确认完成</b><br>
										<b class="after">等待评价</b><br>
										<b class="after">交易完成</b><br>
									</s:if>
									<s:if test="#order.orderStage==0">
										<b class="now">等待接单</b><br>
										<b class="after">已接单</b><br>
										<b class="after">正在服务</b><br>
										<b class="after">确认完成</b><br>
										<b class="after">等待评价</b><br>
										<b class="after">交易完成</b><br>
									</s:if>
									<s:elseif test="#order.orderStage==1">
										<b class="befor">等待接单</b><br>
										<b class="now">已接单</b><br>
										<b class="after">正在服务</b><br>
										<b class="after">确认完成</b><br>
										<b class="after">等待评价</b><br>
										<b class="after">交易完成</b><br>
									</s:elseif>
									<s:elseif test="#order.orderStage==2">
										<b class="befor">等待接单</b><br>
										<b class="befor">已接单</b><br>
										<b class="now">正在服务</b><br>
										<b class="after">确认完成</b><br>
										<b class="after">等待评价</b><br>
										<b class="after">交易完成</b><br>
									</s:elseif>
									<s:elseif test="#order.orderStage==3">
										<b class="befor">等待接单</b><br>
										<b class="befor">已接单</b><br>
										<b class="befor">正在服务</b><br>
										<b class="now">确认完成</b><br>
										<b class="after">等待评价</b><br>
										<b class="after">交易完成</b><br>
									</s:elseif>
									<s:elseif test="#order.orderStage==4">
										<b class="befor">等待接单</b><br>
										<b class="befor">已接单</b><br>
										<b class="befor">正在服务</b><br>
										<b class="befor">确认完成</b><br>
										<b class="now">等待评价</b><br>
										<b class="after">交易完成</b><br>
									</s:elseif>
									<s:elseif test="#order.orderStage==5">
										<b class="befor">等待接单</b><br>
										<b class="befor">已接单</b><br>
										<b class="befor">正在服务</b><br>
										<b class="befor">确认完成</b><br>
										<b class="befor">等待评价</b><br>
										<b class="now">交易完成</b><br>
									</s:elseif>
								</td>
								
								<td width="100px">
									<s:if test="#order.orderStage==-1">
										<a class="btn btn-danger" href="<%=path%>/user/Order_deleteOrder.action?orderId=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
											onclick="javascript: return confirm('真的要取消吗？');">
											取消订单
										</a>
										<hr>
										<span style="line-height:30px">
										<%-- <form action="<%=path %>/user/Order_pay.action?orderId=<s:property value="#order.orderId" />" method="post" >
                   							<input type="submit" class="btn btn-success" value="确认付款">
                   						</form> --%>
											<%-- <a class="btn btn-success" href="<%=path%>/company/Order_orderComToDo.action?orderid=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>">
												确认付款
											</a> --%>
											<a class="btn btn-success" href="<%=path %>/user/Order_pay.action?orderId=<s:property value="#order.orderId" />">
												确认付款
											</a>
										</span>
									</s:if>
									<s:elseif test="#order.orderStage==0">
										<a class="btn btn-danger" href="<%=path%>/user/Order_deleteOrder.action?orderId=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
											onclick="javascript: return confirm('真的要取消吗？');">
											取消订单
										</a><hr>
										<span style="line-height:30px;"><b class="befor">等待确认</b></span>
									</s:elseif>
									<s:elseif test="#order.orderStage==1">
										<a class="btn btn-danger" href="<%=path%>/user/Order_deleteOrder.action?orderId=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
											onclick="javascript: return confirm('真的要取消吗？');">
											取消订单
										</a><br>
									</s:elseif>
									<s:elseif test="#order.orderStage==2">
										<span style="line-height:30px;"><b class="befor">服务中...</b>
									</s:elseif>
									<s:elseif test="#order.orderStage==3">
										<a class="btn btn-info" href="<%=path%>/user/Order_orderUserOK.action?orderid=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
											onclick="javascript: return confirm('确认操作？');">
											服务完成
										</a>
									</s:elseif>
									<s:elseif test="#order.orderStage==4">
										<input type="hidden" value="<s:property value="#order.orderId"/>" id="order<s:property value="#order.orderId"/>">
										<input type="hidden" value="<s:property value="#request.page"/>" id="page<s:property value="#request.page"/>">
										<button type="button" class="btn btn-default" data-toggle="modal" data-target="#exampleModal"
											onclick="replace('order<s:property value="#order.orderId"/>','page<s:property value="#request.page"/>')">
											评价
										</button>
									</s:elseif>
									<s:elseif test="#order.orderStage==5">
										<span style="line-height:30px"><b class="now">已评价</b>
									</s:elseif>
								</td>
							</tr>
							<tr>
								<td colspan="8" align="left">
									服务地址： <s:property value="#order.order_user.userAddress" />/<s:property
								value="#order.order_user.userAddress2" /> <strong>|</strong>
								公司地址： <s:property value="#order.order_company.companyAddress" />/
								<s:property value="#order.order_company.companyAddress2" /><strong>|</strong>
								<s:if test="#order.orderStage==0">
									预计开始时间： <s:property value="#order.orderStartTime" />
								</s:if>
								<s:else>
									订单结束时间：<s:property value="#order.orderEndTime" />
								</s:else>
								
								</td>
							</tr>
							</table>
							</div>
						</s:iterator>
						
						<div style="float:right">
					<s:if test="#request.page==1">
					<s:if test="10>=#request.counts">
						<a class="btn btn-default" >首页</a>&nbsp;
						<a class="btn btn-default">上一页</a>&nbsp;
						第<s:property value="#request.page" />页&nbsp;
						<a class="btn btn-default">下一页</a>&nbsp;
						<a class="btn btn-default">尾页</a>
					</s:if>
					<s:else>
						<a class="btn btn-default" >首页</a>&nbsp;
						<a class="btn btn-default" >上一页</a>&nbsp;
						第<s:property value="#request.page" />页&nbsp;
						<a class="btn btn-success" href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
						<s:if test="#request.counts%10==0">
							<a class="btn btn-info" href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:if>
						<s:else>
							<a class="btn btn-info" href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:else>
					</s:else>
					</s:if>
					<s:else>
					<s:if test="#request.page*10>=#request.counts">
						<a class="btn btn-info" href="<%=path%>/user/Order_selectUserAllOrder.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
						<a class="btn btn-success" href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
						第<s:property value="#request.page" />页&nbsp;
						<a class="btn btn-default">下一页</a>&nbsp;
						<a class="btn btn-default">尾页</a>
					</s:if>
					<s:else>
						<a class="btn btn-info" href="<%=path%>/user/Order_selectUserAllOrder.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
						<a class="btn btn-success" href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
							第<s:property value="#request.page" />页&nbsp;
						<a class="btn btn-success" href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
						<s:if test="#request.counts%10==0">
							<a class="btn btn-info" href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:if>
						<s:else>
							<a class="btn btn-info" href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:else>
					</s:else>
				</s:else>
				</div>
			</s:else>		
		</div>
	</div>
	
	<form id="form1" action="" method="post">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
                    <h4 class="modal-title" id="exampleModalLabel">对本次服务的评价</h4>
                </div>
                <div class="modal-body">
                        <div class="clearfix">
                                <div id="pingfen">
                                    <ul>
                                        <li onclick="grade(1)">
                                        </li>
                                        <li onclick="grade(2)">
                                        </li>
                                        <li onclick="grade(3)">
                                        </li>
                                        <li onclick="grade(4)">
                                        </li>
                                        <li onclick="grade(5)">
                                        </li>
                                    </ul>
                                </div>
                                <div id="pingjia">
                                    尚未评价
                                </div>
                            </div>
                        <div class="form-group pj-content">
                            <label for="message-text"
									class="control-label">评价内容:</label>
                            <textarea class="form-control"
									id="message-text" style="height:100px" name="commentCont"></textarea>
                        </div>
                </div>
                <div class="modal-footer">
                	<input id="gd" type="hidden" name="commentGrade"
							value="0">
                    <button type="submit" class="btn btn-primary"
							onclick="return check()">确认评价</button>
                </div>
            </div>
        </div>
    </div>
	</form>
	<div class="footer">Copyright &copy; 2016 DXSTUDIO. All Rights
		Reserved.</div>
	<script src="js/jquery-1.12.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/user_orderList.js"></script>
	<script type="text/javascript">
	function replace(oid,pg){
		var form1=document.getElementById('form1');
		var o = document.getElementById(oid).value;
		var p = document.getElementById(pg).value;
		form1.action="<%=path%>/user/Comment_commentOK.action?orderid="+o+"&page="+p;
    	
	}
	
	function grade(id){
		document.getElementById("gd").value=id;
	}
	
	function check(){
		if(document.getElementById("gd").value=="0"){
			alert("请选择评分！");
			return false;
		}
	}
	</script>
</body>
</html>
