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
                    邮箱绑定
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
                
        		<center>
        			<form action="<%=path%>/user/User_bindEmail.action" method="post">
        				<p>
       			    		<label style="font-size:20px">
                      			请输入发送至您邮箱的验证码:
         	  	     		</label>
							<input type="text" name="verification" style="height:30px;width:100px;border:1px solid #ddd;border-radius:4px"> 
						</p>
						<div class="btn-group btn-group-justified" role="group" style="width:300px">
  							<div class="btn-group" role="group">
    							<button type="submit" class="btn btn-danger">绑定邮箱</button>
  							</div>
  							<div class="btn-group" role="group">
    							<button type="reset" class="btn btn-danger">清空</button>
 							</div>
						</div>
						<!-- <p style="height:40px">
						<input class="button register" type="submit" value="绑定邮箱" style="margin:0px 40px 10px 420px">
						<input class="button register" type="reset" value="清空">
						</p> -->
					</form>
					<s:fielderror />
				</center>       
				<a href="<%=path%>/user/User_refresh.action" style="margin-left:20px;font-size:20px">返回</a>
                
            </div>
        </div>
        <div class="footer">
            Copyright &copy; 2016 DXSTUDIO. All Rights Reserved.
        </div>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/function.js"></script>
  
  
    <%-- <form action="<%=path%>/user/User_bindEmail.action" method="post">
    	请输入发送至您邮箱的验证码: <input type="text" name="verification">
    	<input type="submit" value="绑定邮箱">
    </form>
    <a href="javascript:history.go(-1);"> 返回</a>
    <s:fielderror /> --%>
  </body>
</html>
