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
		<h3>
                公司服务管理
            </h3>
            <ul class="account-nav">
                <li>
                    <a href="<%=path%>/company/company_login_success.jsp">
                        公司账户
                    </a>
                </li>
                <s:if test="#session.loginCompany.companyStage!=0">
				<li class="active">
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
		<form action="<%=path%>/company/Service_selectComAllService.action?page=1" method="get">
		<div class="container">
			<div class="row">
				<div class="indent-search col-xs-10 col-md-4">
                        <div class="input-group">
                        	
                            <input type="text" name="key" value="${request.key }" class="form-control" placeholder="服务名称关键字"/>
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
			<s:if test="#request.allservice.size()<1">
    			<div class="col-xs-2 col-md-offset-5">
            		<img width="200px" height="260px" src="images/addservice.jpg">
            	</div>
    			<div class="col-xs-3 col-md-offset-5">
            		<h4>还没有服务,快去添加吧！</h4>
            	</div>
    		</s:if>
			<s:else>
				<table class="table">
					<thead>
						<tr bgcolor="#e1f5b2">
							<td>服务名称</td>
				<td>描述</td>
				<td>图片</td>
				<td>服务价格</td>
				<td>单位</td>
				<td>服务类型</td>
				<td>评分</td>
				<td>服务处理</td>
				<td>操作</td>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#request.allservice" var="ser" status="st">
					<s:if test="#st.odd">
						<tr>
					</s:if>
					<s:else>
						<tr bgcolor="#f1f1f1">
					</s:else>
					<td>
						<a class="serviceName" href="<%=path%>/web/Service_forwardto.action?page=1&serviceid=<s:property value="#ser.serviceId"/>" style="cursor: pointer;"><s:property value="#ser.serviceName" /></a>
					</td>

					<s:if test="#ser.serviceExplain==null">
						<td>暂无简介</td>
					</s:if>
					<s:else>
						<td><%-- <s:property value="#ser.serviceExplain" /> --%>
						<span class="serviceExplain" title="<s:property value="#ser.serviceExplain" />" style="cursor: pointer;"><s:property value="#ser.serviceExplain" /></span>
						</td>
					</s:else>

					<s:if test="#ser.serviceImg==null">
						<td>暂无图片
						</td>
					</s:if>
					<s:else>
						<td><img width="50" height="50" alt="服务图片"
							src='<s:property value="#ser.serviceImg"/>'></td>
					</s:else>

					<td><s:property value="#ser.serviceprice" />
					</td>
					<td><s:property value="#ser.service_priveunit.priveunitName" />
					</td>
					<td><s:property value="#ser.service_serviceType.serviceTypeName" />
					</td>

					<s:if test="#ser.serviceGrade==0">
						<td>暂未获得评分</td>
					</s:if>
					<s:else>
						<td><s:property value="#ser.serviceGrade" /></td>
					</s:else>

					<s:if test="#ser.serviceStage==0">
						<td><a
							href="<%=path%>/company/Service_updownService.action?serviceid=<s:property value="#ser.serviceId"/>&operand=1&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>">上架</a>
						</td>
					</s:if>
					<s:elseif  test="#ser.serviceStage==1">
						<td><a
							href="<%=path%>/company/Service_updownService.action?serviceid=<s:property value="#ser.serviceId"/>&operand=0&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
							onclick="javascript: return confirm('真的要下架吗？');">下架</a></td>
					</s:elseif>
					<s:else>
						<td>您的服务已被管理员冻结，请联系管理员</td>
					</s:else>
					<td><a
						href="<%=path%>/company/Service_getService.action?serviceid=<s:property value="#ser.serviceId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>">修改</a>
						<a
						href="<%=path%>/company/Service_delete.action?serviceid=<s:property value="#ser.serviceId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
						onclick="javascript: return confirm('真的要删除吗？');" ondragstart="return false">删除</a></td>
				</tr>
			</s:iterator>
					</tbody>
				</table>
				<div style="float:right">
				<s:if test="#request.page==1">
					<s:if test="10>=#request.counts" >
						<a class="btn btn-default">首页</a>&nbsp;
						<a class="btn btn-default">上一页</a>&nbsp;
						第<s:property value="#request.page"/>页&nbsp;
						<a class="btn btn-default">下一页</a>&nbsp;
						<a class="btn btn-default">尾页</a>
					</s:if>
					<s:else>
						<a class="btn btn-default">首页</a>&nbsp;
						<a class="btn btn-default">上一页</a>&nbsp;
						第<s:property value="#request.page"/>页&nbsp;
						<a class="btn btn-success" href="<%=path%>/company/Service_selectComAllService.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
						<s:if test="#request.counts%10==0">
							<a class="btn btn-info" href="<%=path%>/company/Service_selectComAllService.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:if>
						<s:else>
							<a class="btn btn-info" href="<%=path%>/company/Service_selectComAllService.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:else>
					</s:else>
    			</s:if>
				<s:else>
					<s:if test="#request.page*10>=#request.counts" >
						<a class="btn btn-info" href="<%=path%>/company/Service_selectComAllService.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
						<a class="btn btn-success" href="<%=path%>/company/Service_selectComAllService.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
						第<s:property value="#request.page"/>页&nbsp;
						<a class="btn btn-default">下一页</a>&nbsp;
						<a class="btn btn-default">尾页</a>
					</s:if>
					<s:else>
						<a class="btn btn-info" href="<%=path%>/company/Service_selectComAllService.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
						<a class="btn btn-success" href="<%=path%>/company/Service_selectComAllService.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
						第<s:property value="#request.page"/>页&nbsp;
						<a class="btn btn-success" href="<%=path%>/company/Service_selectComAllService.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
						<s:if test="#request.counts%10==0">
							<a class="btn btn-info" href="<%=path%>/company/Service_selectComAllService.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
						</s:if>
						<s:else>
							<a class="btn btn-info" href="<%=path%>/company/Service_selectComAllService.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
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
