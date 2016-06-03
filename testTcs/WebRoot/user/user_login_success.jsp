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
     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>
            用户信息管理
        </title>
        <link rel="shortcut icon" href="images/favicon.ico"/>
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet"/>
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
            <h3>
                我的账户
            </h3>
            <ul class="account-nav">
                <li class="active">
                    <a href="<%=path%>/user/user_login_success.jsp">
                        账户
                    </a>
                </li>
                <li>
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
            <div class="personal-information">
                <h3>
                    个人信息
                </h3>
                <ul class="pi-nav">
                    <li>
                        <a href="<%=path%>/user/user_update.jsp">
                            <span class="glyphicon glyphicon-pencil">
                            </span>
                            编辑信息
                        </a>
                    </li>
                    <li>
                        <a href="<%=path%>/user/user_repwd.jsp" class="change-password">
                            <span class="glyphicon glyphicon-lock">
                            </span>
                            修改密码
                        </a>
                    </li>
                </ul>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-4" style="margin-top:20px">
                    	<s:if test="#session.loginUser.userImg!=null">
                    	<div class="thumbnail" style="padding-top: 15px;">
							<img width="250px" title="用户头像" alt="用户头像" src="${sessionScope.loginUser.userImg }">
						</div>
						</s:if>
						<s:else>
						<div class="thumbnail" style="padding-top: 10px;">
							<img title="用户头像" alt="用户头像" src="images/userimg.png">
						</div>
						</s:else>
						<p style="font-size:14px;color:#6495ED;margin-left:45px">修改头像在修改信息中</p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            用户昵称:
                        </small>
                        <p>
                            ${sessionScope.loginUser.userName}
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            需要的服务:
                        </small>
                        <p>
                            <s:if test="#session.loginUser.userLike==null">
								暂未设置偏好
							</s:if>
							<s:else>
								${sessionScope.loginUser.userLike}
							</s:else>
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            实名认证:
                        </small>
                        <p>
                        <s:if test='#session.loginUser.userRealName==null||#session.loginUser.userRealName==""'>
								还未认证&nbsp;<a href="<%=path%>/user/user_realName.jsp" class="verification">去认证</a>
						</s:if>
						<s:else>已认证</s:else>
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            邮箱:
                        </small>
                        <p>
                        <s:if test='#session.loginUser.userEmail==null||#session.loginUser.userEmail==""'>
							<span style="cursor: pointer;font-size:24px;color:#232323">
								未绑定&nbsp;<a href="<%=path%>/user/user_email.jsp" class="verification">去绑定</a>
							</span>
						</s:if>
						<s:else>
							<span title="邮箱：${sessionScope.loginUser.userEmail}" style="cursor: pointer;font-size:24px;color:#232323">
								已绑定&nbsp;
							</span>
						</s:else>
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            地址:
                        </small>
                        <p>
                            ${sessionScope.loginUser.userAddress}
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            详细地址:
                        </small>
                        <p>
                            ${sessionScope.loginUser.userAddress2}
                        </p>
                    </div>
                    <div style="width: 100px;margin-bottom: 10px">
                    <a href="<%=path%>/user/User_refresh.action" style="font-size:20px">刷新</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            Copyright &copy; 2016 DXSTUDIO. All Rights Reserved.
        </div>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/function.js"></script>
  </body>
</html>
