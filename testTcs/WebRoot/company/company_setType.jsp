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
                    服务类型选择
                </h3>
                <ul class="pi-nav">
                    <li>
                        <a href="<%=path%>/company/company_repwd.jsp" class="change-password">
                            <span class="glyphicon glyphicon-lock">
                            </span>
                            修改密码
                        </a>
                    </li>
                </ul>
                
                <center>
                <form action="<%=path%>/company/Company_setType.action" method="post">
                    <p>
                        <label style="font-size:20px">
                            公司主要服务类型:
                        </label><br>
                        
						<s:if test="#session.loginCompany.company_facilitatorType==null">
                        	<select id="first" name="facilitatorType" style="height:40px;width:200px;font-size:20px;border:1px solid #ddd;border-radius:4px" onChange="Explain(this)">
                        		<option>请选择</option>
                        		<s:iterator value="#session.facilitatorType" var="type">
                        			<option><s:property value="#type.facilitatorTypeName"/></option>
                        		</s:iterator>
                        	</select>
						</s:if>
						<s:else>
							<input id="type" type="hidden" value="${session.loginCompany.company_facilitatorType.facilitatorTypeName}"/>
                        	<select name="facilitatorType" style="height:40px;width:200px;font-size:20px;border:1px solid #ddd;border-radius:4px" onChange="Explain(this)">
                        		<option id="op0"></option>
                        		<s:iterator value="#session.facilitatorType" var="type">
                        			<option><s:property value="#type.facilitatorTypeName"/></option>
                        		</s:iterator>
                        	</select>
						</s:else>                        
                        
                        <%-- <select name="facilitatorType" style="height:40px;width:200px;font-size:20px;border:1px solid #ddd;border-radius:4px" onChange="Explain(this)">
                        	<s:iterator value="#session.facilitatorType" var="type">
                        		<option><s:property value="#type.facilitatorTypeName"/></option>
                        	</s:iterator>
                        </select> --%>
                        
                        <%-- <s:select name="facilitatorType"
							list="#session.facilitatorType" listValue="facilitatorTypeName" 
							style="height:40px;width:200px;font-size:20px;border:1px solid #ddd;border-radius:4px" 
							onChange="Explain(this)">
						</s:select> --%>
						<div>
								<p class="typeExplain"><s:property value="#session.loginCompany.company_facilitatorType.facilitatorTypeExplain"/></p>
								<s:iterator value="#session.facilitatorType" var="explain">
									<p class="typeExplain"><s:property value="#explain.facilitatorTypeExplain"/></p>
								</s:iterator>
							
						</div>
                    </p>
                    <input class="btn btn-danger center-block" type="submit" value="提交" onclick="return test()">
                    <a href="<%=path%>/company/Admin_getAllAdminName">没有适合自己公司的服务类型？点这里！</a>
                </form>
                <s:fielderror />
                </center>
                <a href="<%=path%>/company/Company_refresh.action" style="font-size:20px;margin-left:20px">返回</a>
            </div>
        </div>
        <div class="footer">
            Copyright &copy; 2016 DXSTUDIO. All Rights Reserved.
        </div>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/function.js"></script>
		<script type="text/javascript">		
			var typeExplain=document.getElementsByClassName("typeExplain");
			for(var i=1;i<typeExplain.length;i++){
				typeExplain[i].style.display="none";
			}
			function test(){
				var index=document.getElementById("first").selectedIndex;
				var type = document.getElementById("first")[index].innerHTML;
				if(type=="请选择"){
					alert("请选择类型！");
					return false;
				}else{
					return true;
				}
   			 }
			
			function Explain(osel){
				var typeIndex=osel.selectedIndex;
				for(var i=0;i<typeExplain.length;i++){
					typeExplain[i].style.display="none";
				}
				typeExplain[typeIndex].style.display="block";
   			 }
   			 window.onload = function() {
				document.getElementById("op0").innerHTML = document.getElementById("type").value;
				document.getElementById("op0").value = document.getElementById("type").value;
			}
		</script>
</body>
</html>
