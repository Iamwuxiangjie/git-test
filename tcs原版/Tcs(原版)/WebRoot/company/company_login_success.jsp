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
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>公司信息管理界面</title>
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
                            <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
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
            <h3>
                公司服务管理
            </h3>
            <ul class="account-nav">
                <li class="active">
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
                <li>
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
            <div class="personal-information">
                <h3>
                    公司信息
                </h3>
                <ul class="pi-nav">
                	<li>
                        <a href="<%=path%>/company/company_summary.jsp">
                            <span class="glyphicon glyphicon-pencil">
                            </span>
                            <s:if test="#session.loginCompany.companySummary==null">
								填写公司简介
							</s:if>
							<s:else>
								修改公司简介
							</s:else>
                           
                        </a>
                    </li>
                    <li>
                        <a href="<%=path%>/company/company_repwd.jsp" class="change-password">
                            <span class="glyphicon glyphicon-lock">
                            </span>
                            修改密码
                        </a>
                    </li>
                </ul>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-4" style="margin-top:50px">
                    	<s:if test="#session.loginCompany.companyImg!=null">
                    		<a href="<%=path%>/company/company_upload.jsp">
								<img width="200" height="200" alt="公司图片" src="${sessionScope.loginCompany.companyImg }">
							</a>
						</s:if>
						<s:else>
							<a href="<%=path%>/company/company_upload.jsp">
								<img alt="公司图片" src="images/userimg.png">
							</a>
						</s:else>
							<p style="font-size:14px;color:#6495ED;margin-left:45px">点击修改公司图片</p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            公司名称:
                        </small>
                        <p>
                            ${sessionScope.loginCompany.companyName}
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            公司主要服务类型:
                        </small>
                        <p>
                            <s:if test="#session.loginCompany.company_facilitatorType==null">
								未选择<a href="<%=path%>/company/company_setType.jsp">去选择</a>
							</s:if>
							<s:else>
								已选择-${sessionScope.ftName}&nbsp;<a href="<%=path%>/company/company_setType.jsp">修改</a>
							</s:else>
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            营业执照:
                        </small>
                        <p>
                        <s:if test="#session.loginCompany.companyLicenseImg==null">
							<a href="<%=path%>/company/company_uploadLicenseImg.jsp">去上传</a>
						</s:if>
						<s:else>
							已上传
						</s:else>
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            邮箱:
                        </small>
                        <p>
                        <s:if test='#session.loginCompany.companyEmail==null||#session.loginCompany.companyEmail==""'>
							<a href="<%=path%>/company/company_email.jsp">去绑定</a>
						</s:if>
						<s:else>
							已绑定${sessionScope.loginCompany.companyEmail}
						</s:else>
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            公司评分:
                        </small>
                        <p>
                            <s:if test="#session.loginCompany.companyGrade==0">
								还未获得评分
							</s:if>
							<s:else>
								${sessionScope.loginCompany.companyGrade}
							</s:else>
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            公司状态:
                        </small>
                        <p>
                            <s:if test="#session.loginCompany.companyStage==0">
								公司还未通过审核，请耐心等待
							</s:if>
							<s:else>
								审核通过！<a href="<%=path%>/company/company_addService.jsp">推送服务！</a>
							</s:else>
                        </p>
                    </div>
                    <a href="<%=path%>/company/Company_refresh.action"" style="font-size:20px">刷新</a>
                </div>
            </div>
        </div>
        <div class="footer">
            Copyright &copy; 2016 DXSTUDIO. All Rights Reserved.
        </div>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/function.js"></script>


<%-- 
	<s:if test="#session.loginCompany.companyImg!=null">
		<a href="<%=path%>/company/company_upload.jsp">
			<img width="100" height="100" alt="公司头像" src="${sessionScope.loginCompany.companyImg }">
		</a>
	</s:if>
	<s:else>
		<a href="<%=path%>/company/company_upload.jsp">
			<img alt="公司头像" src="./defaultImg/ic_launcher.png">
		</a>
	</s:else>

	${sessionScope.loginCompany.companyName} Hello <br>
	公司简介：${sessionScope.loginCompany.companySummary}
	<s:if test='#session.unreadmessage==0'>
		<a href="<%=path%>/company/Message_selectComAllMessage.action?page=1">消息中心</a>
	</s:if>
	<s:else>
		<a href="<%=path%>/company/Message_selectComAllMessage.action?page=1">消息中心(${sessionScope.unreadmessage})</a>
	</s:else>
	<table border="1">
		<tr>
			<td>邮箱认证</td>
			<td><s:if test='#session.loginCompany.companyEmail==null||#session.loginCompany.companyEmail==""'>
					<a href="<%=path%>/company/company_email.jsp">去验证</a>
				</s:if>
				<s:else>已验证${sessionScope.loginCompany.companyEmail}</s:else>
			</td>
		</tr>
		<tr>
			<td>公司执照</td>
			<td><s:if test="#session.loginCompany.companyLicenseImg==null">
					<a href="<%=path%>/company/company_uploadLicenseImg.jsp">去上传，增加审核通过概率！</a>
				</s:if>
				<s:else>
					<img width="100" height="100" alt="公司执照" src="${sessionScope.loginCompany.companyLicenseImg }">
				</s:else>
			</td>
		</tr>
		<tr>
			<td>公司简介</td>
			<td><s:if test="#session.loginCompany.companySummary==null">
					<a href="<%=path%>/company/company_summary.jsp">去填写</a>
				</s:if>
				<s:else>已填写&nbsp;<a href="<%=path%>/company/company_summary.jsp">修改</a>
				</s:else>
			</td>
		</tr>
		<tr>
			<td>公司服务类型</td>
			<td><s:if test="#session.loginCompany.company_facilitatorType==null">
					<a href="<%=path%>/company/company_setType.jsp">去选择</a>
				</s:if>
				<s:else>已选择${sessionScope.ftName}&nbsp;<a href="<%=path%>/company/company_setType.jsp">修改</a>
				</s:else>
			</td>
		</tr>
		<tr>
			<td>公司服务范围</td>
			<td>${sessionScope.loginCompany.companyServiceScope}&nbsp;<a href="#">修改</a>
			</td>
		</tr>
		<tr>
			<td>公司评分</td>
			<td><s:if test="#session.loginCompany.companyGrade==0">
					还未获得评分
				</s:if>
				<s:else>${sessionScope.loginCompany.companyGrade}
				</s:else>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="<%=path%>/company/company_repwd.jsp">修改密码</a>
			</td>
		</tr>
			<s:if test="#session.loginCompany.companyStage==0"><!-- '%{#session.loginCompany.companyStage==0}' -->
			<tr>
				<td>公司状态</td>
				<td>公司还未通过审核，请耐心等待</td>
			</tr>
			</s:if>
			<s:else>
			<tr>
				<td>公司状态</td>
				<td>公司已通过审核！<a href="<%=path%>/company/company_addService.jsp">立即推送服务！</a></td>
			</tr>
			<tr>
				<td colspan="2"><a href="<%=path%>/company/Service_selectComAllService.action?page=1">查看全部推送服务</a></td>
			</tr>
			<tr>
				<td colspan="2"><a href="<%=path%>/company/Order_selectComAllOrder.action?page=1">查看全部订单</a></td>
			</tr>
			<tr>
				<td colspan="2"><a href="<%=path%>/company/Comment_selectComAllComment.action?page=1">查看全部评价</a></td>
			</tr>
			</s:else>
		
	</table>
	<s:fielderror />
	<a href="<%=path%>/company/Company_refresh.action"/>刷新</a>
	<a href="<%=path%>/company/Company_logout.action"/>退出登录</a>
	<a href="<%=path%>/web/index.jsp">首页</a>
	<button onclick="window.location='<%=path%>/user/Service_getLikeServices?page=1'">服务列表</button> --%>
</body>
</html>
