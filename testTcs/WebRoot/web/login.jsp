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
            登录
        </title>
        <link rel="shortcut icon" href="images/favicon.ico"/>
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link href="css/style2.css" rel="stylesheet"/>
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
                        <li class="dropdown">
                            <a href="<%=path%>/user/Service_getLikeServices?page=1">
                                服务列表
                            </a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="<%=path%>/web/login.jsp">
                                登录
                            </a>
                        </li>
                        <li>
                            <a href="<%=path%>/web/register.jsp">
                                注册
                            </a>
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
        <div class="header-wrapper container">
            <h3>
                欢迎游客，要预约服务请先登录!
            </h3>
        </div>
        <div class="login-in container-fluid">
        	<div class="banner"></div>
            <div class="row-fluid">
			<div class="col-md-8 content-img">
			<div class="carousel slide" id="limg">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#limg">
					</li>
					<li data-slide-to="1" data-target="#limg">
					</li>
					<li data-slide-to="2" data-target="#limg">
					</li>
					<li data-slide-to="3" data-target="#limg">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="images/l1.jpg"  />
					</div>
					<div class="item">
						<img alt="" src="images/l2.jpg" />
					</div>
					<div class="item">
						<img alt="" src="images/l3.jpg" />
					</div>
					<div class="item">
						<img alt="" src="images/l4.jpg" />
					</div>
				</div>
				<a data-slide="prev" href="#limg" class="left carousel-control">‹</a>
				<a data-slide="next" href="#limg" class="right carousel-control">›</a>
			</div>
			</div>
            <div class="col-md-5 content-body">
            	<div class="login-title">账户登录</div>
                <form action="<%=path %>/web/Person_login.action" method="post" class="bs-example bs-example-form" role="form">
                    <div class="input-group field">
        				<span class="input-group-addon input-text"></span>
                        <input type="text" class="form-control" name="account" id="LoginName" placeholder="账号" />
                   </div>
                   <div class="input-group field">
        				<span class="input-group-addon input-pw"></span>
                        <input type="password" class="form-control" name="pwd" id="LoginPwd" placeholder="密码" />
                   </div> 
                   <div class="login-links">
                        <div class="iradio_square-blue">
                        	<input type="radio" id="square-radio-1" name="person" value="user"/>
                    	</div>
                    	<div class="radio-text">
                    		<span>用 户</span>
                    	</div>
	                    <div class="iradio_square-blue">
	                        <input type="radio" id="square-radio-2" name="person" value="company"/>
	                    </div>
	                    <div class="radio-text">
                    		<span>公 司</span>
                    	</div>
                        <a class="lost-password" href="<%=path %>/web/forgetpwd.jsp" >
                          	  忘记登录密码
                        </a>
                   	</div>
                    <p class="clearfix">
                        <input type="submit" class="button" id="LoginBtn" name="login" value="登录"/>
                        <a class="button register-button" href="<%=path %>/web/register.jsp">
                            	注册
                        </a>
                    </p>
                    <s:fielderror/>
                </form>
            </div>
        </div>
        </div>
        <div class="footer">
            Copyright &copy; 2016 DXSTUDIO. All Rights Reserved.
        </div>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/function.js"></script>
        <script src="js/login.js"></script>
  </body>
</html>
