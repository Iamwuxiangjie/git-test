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
    <!--[if lt IE 9]>
            <script src="js/html5shiv.min.js"></script>
            <script src="js/respond.js"></script>
        <![endif]-->
</head>

<body>
	<!-- navbar -->
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
                                欢迎！${sessionScope.loginUser.userName}
                                <span class="caret">
                                </span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="<%=path%>/user/User_logout.action">
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
                    <a href="<%=path%>/user/user_login_success.jsp">
                        账户
                    </a>
                </li>
                <li class="active">
                    <a href="<%=path%>/user/Order_selectUserAllOrder.action?page=1">
                        订单记录
                    </a>
                </li>
                <li>
                    <a href="<%=path%>/user/Comment_selectUserAllComment.action?page=1">
                    评价记录
                    </a>
                </li>
                <li>
                    <s:if test='#session.unreadmessage==0'>
						<a href="<%=path%>/user/Message_selectUserAllMessage.action?page=1">消息中心</a>
					</s:if>
					<s:else>
						<a href="<%=path%>/user/Message_selectUserAllMessage.action?page=1">消息中心 <span class="badge">${sessionScope.unreadmessage}</span></a>
					</s:else>
                </li>
		</ul>
		<form action="<%=path%>/user/Order_selectUserAllOrder.action?page=1" method="get">
		<div class="container">
			<div class="row">
				<div class="indent-search col-xs-10 col-md-4">
                        <div class="input-group">
                        	
                            <input type="text" name="key" class="form-control" value="${request.key }" placeholder="请输入订单编号"/>
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
			<s:if test="#request.orderList.size()<1">
    	没有订单
    		</s:if>
			<s:else>
				<table class="table table-hover">
					<thead>
						<tr>
							<td>图片</td>
							<td>订单号</td>
							<td>服务公司</td>
							<td>服务名称</td>
							<td>服务地址</td>
							<td>公司电话</td>
							<td>下单时间</td>
							<td>订单预计开始时间</td>
							<td>数量</td>
							<td>订单完成时间</td>
							<td>金额</td>
							<td>状态</td>
							<td>操作</td>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#request.orderList" var="order">
							<tr>
								<td>
								<s:if test="#order.order_service.serviceImg==null">
									<img id="preview" width="100" height="100" alt="服务图片" src="images/img.svg">
								</s:if>
								<s:else>
									<img id="preview" width="100" height="100" alt="服务图片" src='<s:property value="#order.order_service.serviceImg"/>'>
								</s:else>
								</td>
								<td><s:property value="#order.orderNum" />
								</td>
								<td><s:property value="#order.order_company.companyName" />
								</td>
								<td><s:if test="#order.order_service!=null">
										<s:property value="#order.order_service.serviceName" />
									</s:if> 
									<s:else>
							服务公司已删除该服务
									</s:else>
								</td>
								<td><s:property value="#order.order_user.userAddress2" />
								</td>
								<td><s:property value="#order.order_company.companyPhone" />
								</td>
								<td><s:property value="#order.orderTime" />
								</td>
								<td><s:property value="#order.orderStartTime" />
								</td>
								<td><s:property value="#order.orderServiceAmount" />
								</td>
								<s:if test="#order.orderEndTime==null">
									<td>订单暂未完成</td>
								</s:if>
								<s:else>
									<td><s:property value="#order.orderEndTime" /></td>
								</s:else>
								<td><s:property value="#order.orderCost" />
								</td>
								<s:if test="#order.orderStage==0">
									<td><a
										href="<%=path%>/user/Order_orderUserOK.action?orderid=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>" onclick="javascript: return confirm('确认操作？');">确认收货</a>
									</td>
								</s:if>
								<s:else>
									<td>已确认收货</td>
								</s:else>
								<s:if test="#order.orderStage==0">
									<td><a
										href="<%=path%>/user/Message_orderGetMessageToCom.action?comid=<s:property value="#order.order_company.companyId"/>">发消息</a>
										<a
										href="<%=path%>/user/Order_deleteOrder.action?orderId=<s:property value="#order.orderId"/>"onclick="javascript: return confirm('真的要取消吗？');">取消订单</a>
									</td>
								</s:if>
								<s:elseif test="#order.orderStage==1">
									<td>
									
									<input type="hidden" value="<s:property value="#order.orderId"/>" id="order<s:property value="#order.orderId"/>">
									<input type="hidden" value="<s:property value="#request.page"/>" id="page<s:property value="#request.page"/>">
									<button type="button" class="btn btn-default" data-toggle="modal" data-target="#exampleModal"
										 onclick="replace('order<s:property value="#order.orderId"/>','page<s:property value="#request.page"/>')">
										评价
									</button>
									<a href="<%=path%>/user/Message_orderGetMessageToCom.action?comid=<s:property value="#order.order_company.companyId"/>">
										发消息
									</a>
									</td>
								</s:elseif>
								<s:else>
									<td>已评价 <a
										href="<%=path%>/user/Message_orderGetMessageToCom.action?comid=<s:property value="#order.order_company.companyId"/>">发消息</a>
									</td>
								</s:else>

							</tr>
						</s:iterator>
					</tbody>
				</table>
				<s:if test="#request.page==1">
					<s:if test="10>=#request.counts">
				首页&nbsp;上一页&nbsp;第<s:property value="#request.page" />页&nbsp;下一页&nbsp;尾页
			</s:if>
					<s:else>
				首页&nbsp;上一页&nbsp;第<s:property value="#request.page" />页&nbsp;
				<a
							href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
							<a
								href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:if>
						<s:else>
							<a
								href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:else>
					</s:else>
				</s:if>
				<s:else>
					<s:if test="#request.page*10>=#request.counts">
						<a
							href="<%=path%>/user/Order_selectUserAllOrder.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
				<a
							href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
				第<s:property value="#request.page" />页&nbsp;下一页&nbsp;尾页
			</s:if>
					<s:else>
						<a
							href="<%=path%>/user/Order_selectUserAllOrder.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
				<a
							href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
				第<s:property value="#request.page" />页&nbsp;
				<a
							href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
							<a
								href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:if>
						<s:else>
							<a
								href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:else>
					</s:else>
				</s:else>
			</s:else>
		</div>
	</div>
	
	<form id="form1" action="" method="post">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">对本次服务的评价</h4>
                </div>
                <div class="modal-body">
                    <form>
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
                            <label for="message-text" class="control-label">评价内容:</label>
                            <textarea class="form-control" id="message-text" style="height:100px" name="commentCont"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                	<input id="gd" type="hidden" name="commentGrade">
                    <button type="submit" class="btn btn-primary">确认评价</button>
                </div>
            </div>
        </div>
    </div>
	</form>
	
	<div class="footer">Copyright &copy; 2016 DXSTUDIO. All Rights
		Reserved.</div>
	<script src="js/jquery-1.12.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/function.js"></script>
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
	</script>


	<%-- <form action="<%=path%>/user/Order_selectUserAllOrder.action?page=1" method="get">
	请输入订单编号<input type="text" name="key" value="${request.key }">
		<input type="submit" value="搜索">
	</form>
    <s:if test="#request.orderList.size()<1">
    	没有订单
    </s:if>
	<s:else>
		<table border="1">
			<tr>
				<td>订单号</td>
				<td>服务公司</td>
				<td>服务名称</td>
				<td>服务地址</td>
				<td>服务详细地址</td>
				<td>公司电话</td>
				<td>下单时间</td>
				<td>订单预计开始时间</td>
				<td>数量</td>
				<td>订单完成时间</td>
				<td>金额</td>
				<td>状态</td>
				<td>操作</td>
			</tr>
			<s:iterator value="#request.orderList" var="order">
			<tr>
					<td><s:property value="#order.orderNum" />
				</td>
				<td><s:property value="#order.order_company.companyName" />
				</td>
				<td>
					<s:if test="#order.order_service!=null">
							<s:property value="#order.order_service.serviceName" />
						</s:if>
						<s:else>
							服务公司已删除该服务
						</s:else>
				</td>
				<td><s:property value="#order.order_user.userAddress" />
				</td>
				<td><s:property value="#order.order_user.userAddress2" />
				</td>
				<td><s:property value="#order.order_company.companyPhone" />
				</td>
				<td><s:property value="#order.orderTime" />
				</td>
				<td><s:property value="#order.orderStartTime" />
				</td>
				<td><s:property value="#order.orderServiceAmount" />
				</td>
				<s:if test="#order.orderEndTime==null">
						<td>订单暂未完成</td>
				</s:if>
				<s:else>
					<td><s:property value="#order.orderEndTime" /></td>
				</s:else>
				<td><s:property value="#order.orderCost" />
				</td>
				<s:if test="#order.orderStage==0">
					<td><a href="<%=path%>/user/Order_orderUserOK.action?orderid=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>">确认收货</a></td>
				</s:if>
				<s:else>
					<td>已确认收货</td>
				</s:else>
				<s:if test="#order.orderStage==0">
					<td>
						还未确认收货，不能评价
						<a href="<%=path%>/user/Message_orderGetMessageToCom.action?comid=<s:property value="#order.order_company.companyId"/>">发消息</a>
					</td>
				</s:if>
				<s:elseif test="#order.orderStage==1">
					<td>
						<a href="<%=path%>/user/Comment_temp.action?orderid=<s:property value="#order.orderId"/>&page=<s:property value="#request.page"/>">评价</a>
						<a href="<%=path%>/user/Message_orderGetMessageToCom.action?comid=<s:property value="#order.order_company.companyId"/>">发消息</a>	
					</td>
				</s:elseif>
				<s:else>
					<td>
						已评价
						<a href="<%=path%>/user/Message_orderGetMessageToCom.action?comid=<s:property value="#order.order_company.companyId"/>">发消息</a>
					</td>
				</s:else>
				
			</tr>
			</s:iterator>
		</table>
		<s:if test="#request.page==1">
			<s:if test="10>=#request.counts" >
				首页&nbsp;上一页&nbsp;第<s:property value="#request.page"/>页&nbsp;下一页&nbsp;尾页
			</s:if>
			<s:else>
				首页&nbsp;上一页&nbsp;第<s:property value="#request.page"/>页&nbsp;
				<a href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
					<a href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
				</s:if>
				<s:else>
					<a href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
				</s:else>
			</s:else>
    	</s:if>
		<s:else>
			<s:if test="#request.page*10>=#request.counts" >
				<a href="<%=path%>/user/Order_selectUserAllOrder.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
				<a href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
				第<s:property value="#request.page"/>页&nbsp;下一页&nbsp;尾页
			</s:if>
			<s:else>
				<a href="<%=path%>/user/Order_selectUserAllOrder.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
				<a href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
				第<s:property value="#request.page"/>页&nbsp;
				<a href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
					<a href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
				</s:if>
				<s:else>
					<a href="<%=path%>/user/Order_selectUserAllOrder.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
				</s:else>
			</s:else>
		</s:else>
		<s:fielderror />
	</s:else>
	<br>
	<a href="<%=path%>/user/User_refresh.action">返回</a> --%>
</body>
</html>
