<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
  </head>
  
  <body>
  <!-- navbar -->
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
                        <li class="dropdown">
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
		<h3>评价记录</h3>
		<ul class="account-nav">
			<li>
                    <a href="<%=path%>/user/user_login_success.jsp">
                        账户
                    </a>
                </li>
                <li>
                    <a href="<%=path%>/user/Order_selectUserAllOrder.action?page=1">
                        订单记录
                    </a>
                </li>
                <li class="active">
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
		<div class="container">
			<div class="row">
			</div>
		</div>
		<div class="table-responsive">
			<s:if test="#request.commentlist.size()<1">
    	没有评价
    </s:if>
			<s:else>
				<table class="table table-hover">
					<thead>
						<tr>
							<td>服务公司</td>
				<td>服务名称</td>
				<td>评价时间</td>
				<td>评价星级</td>
				<td>评价</td>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#request.commentlist" var="comm">
			<tr>
				<td><s:property value="#comm.comment_company.companyName" />
				</td>
				<td>
					<s:if test="#comm.comment_service!=null">
						<s:property value="#comm.comment_service.serviceName" />
					</s:if>
					<s:else>
						服务公司已删除该服务
					</s:else>
				</td>
				<td><s:property value="#comm.commentTime" />
				</td>
				<td><s:property value="#comm.commentGrade" />
				</td>
				<td><s:property value="#comm.commentCont" />
				</td>
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
				<a href="<%=path%>/user/Comment_selectUserAllComment.action?page=<s:property value="#request.page+1"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
					<a href="<%=path%>/user/Comment_selectUserAllComment.action?page=<s:property value="#request.counts/10"/>">尾页</a>
				</s:if>
				<s:else>
					<a href="<%=path%>/user/Comment_selectUserAllComment.action?page=<s:property value="#request.counts/10+1"/>">尾页</a>
				</s:else>
			</s:else>
    	</s:if>
		<s:else>
			<s:if test="#request.page*10>=#request.counts" >
				<a href="<%=path%>/user/Comment_selectUserAllComment.action?page=1">首页</a>&nbsp;
				<a href="<%=path%>/user/Comment_selectUserAllComment.action?page=<s:property value="#request.page-1"/>">上一页</a>&nbsp;
				第<s:property value="#request.page"/>页&nbsp;下一页&nbsp;尾页
			</s:if>
			<s:else>
				<a href="<%=path%>/user/Comment_selectUserAllComment.action?page=1">首页</a>&nbsp;
				<a href="<%=path%>/user/Comment_selectUserAllComment.action?page=<s:property value="#request.page-1"/>">上一页</a>&nbsp;
				第<s:property value="#request.page"/>页&nbsp;
				<a href="<%=path%>/user/Comment_selectUserAllComment.action?page=<s:property value="#request.page+1"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
					<a href="<%=path%>/user/Comment_selectUserAllComment.action?page=<s:property value="#request.counts/10"/>">尾页</a>
				</s:if>
				<s:else>
					<a href="<%=path%>/user/Comment_selectUserAllComment.action?page=<s:property value="#request.counts/10+1"/>">尾页</a>
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
