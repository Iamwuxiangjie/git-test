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
        <div class="login-in container">
            <h3>
                登录
            </h3>
            <div class="content-body">
                <form action="<%=path %>/web/Person_login.action" method="post">
                    <p>
                        <label for="username">
                            账号:
                        </label>
                        <input type="text" class="input-text" name="account" id="LoginName" tabindex="1"/>
                    </p>
                    <p>
                        <label for="password" class="sign-pw">
                            密码:
                        </label>
                        <a class="lost-password" href="<%=path %>/web/forgetpwd.jsp" tabindex="3">
                            忘记密码?
                        </a>
                        <input type="password" class="input-pw" name="pwd" id="LoginPwd" tabindex="2"/>
                    </p>
                    <div class="iradio_square-blue">
                        <input tabindex="4" type="radio" id="square-radio-1" name="person" value="user"/>
                    </div>
                    <label for="square-radio-1">
                        用 户
                    </label>
                    <div class="iradio_square-blue">
                        <input tabindex="5" type="radio" id="square-radio-2" name="person" value="company"/>
                    </div>
                    <label for="square-radio-2">
                        公 司
                    </label>
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
        <div class="footer">
            Copyright &copy; 2016 DXSTUDIO. All Rights Reserved.
        </div>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/function.js"></script>
  </body>
</html>
