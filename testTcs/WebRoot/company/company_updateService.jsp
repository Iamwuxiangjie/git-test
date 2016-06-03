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
                    公司信息
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
                <form 
                action="<%=path%>/company/Service_updateService.action?serviceid=<s:property value="#request.service.serviceId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
				method="post" enctype="multipart/form-data">
				 <p>
					<div id="localImag">
					<label style="font-size:20px">
                            服务图片:
                    </label>
                    <s:if test="#request.service.serviceImg==null">
						<img id="preview" width="300" height="300" alt="服务图片" src="images/img.svg">
					</s:if>
					<s:else>
						<img id="preview" width="300" height="300" alt="服务图片" src='<s:property value="#request.service.serviceImg"/>'>
					</s:else>
					</div>
					<s:file label="选择图片" name="img" id="doc" onchange="javascript:setImagePreview();"></s:file>
                </p>
                    <p>
                        <label style="font-size:20px">
                            服务名称:
                        </label>
                        <input type="text" name="serviceName"
					value="${request.service.serviceName }" class="input-pw" id="Name" tabindex="1" style="height:40px;width:300px;font-size:20px;border:1px solid #ddd;border-radius:4px"/>
                    </p>
                    <p>
                        <label style="font-size:20px">
                           服务简介:
                        </label>
                        <textarea name="serviceExplain" id="Explain" style="resize: none;width:300px;height:200px;font-size:20px;border:1px solid #ddd;border-radius:4px">${request.service.serviceExplain }</textarea>
                    </p>
                   
                    <p>
                        <label style="font-size:20px">
                            服务价格:
                        </label>
                        <input type="text" name="serviceprice"
					value="${request.service.serviceprice }" class="input-pw" id="Price" tabindex="1" style="height:40px;width:300px;font-size:20px;border:1px solid #ddd;border-radius:4px"/>
                    </p>
                    <p>
                        <label style="font-size:20px">
                            服务类型:
                        </label>
                        
                        <input id="name" type="hidden" value="${request.service.service_serviceType.serviceTypeName}"/>
                        <select name="serviceType" style="height:40px;width:300px;font-size:20px;border:1px solid #ddd;border-radius:4px">
                        	<option id="op0"></option>
                        	<s:iterator value="#session.serviceType" var="type">
                        		<option><s:property value="#type.serviceTypeName"/></option>
                        	</s:iterator>
                        </select>
                        
                        
                       <%--  <select name="serviceType" style="height:40px;width:300px;font-size:20px;border:1px solid #ddd;border-radius:4px">
                        	<s:iterator value="#session.serviceType" var="type">
                        		<option><s:property value="#type.serviceTypeName"/></option>
                        	</s:iterator>
                        </select> --%>
                        
                        <%-- <s:select name="serviceType" list="#session.serviceType" listValue="serviceTypeName" style="height:40px;width:300px;font-size:20px;border:1px solid #ddd;border-radius:4px">
						</s:select> --%>
                    </p>
                    <p>
                        <label style="font-size:20px">
                           价格单位:
                        </label>
                        
                        <input id="pr" type="hidden" value="${request.service.service_priveunit.priveunitName}"/>
                        <select name="priveunit" style="height:40px;width:300px;font-size:20px;border:1px solid #ddd;border-radius:4px">
                        	<option id="op1"></option>
                        	<s:iterator value="#session.priveunit" var="type">
                        		<option><s:property value="#type.priveunitName"/></option>
                        	</s:iterator>
                        </select>
                        
                        <%-- <s:select name="priveunit" list="#session.priveunit" listValue="priveunitName" style="height:40px;width:300px;font-size:20px;border:1px solid #ddd;border-radius:4px">
						</s:select> --%>
                    </p>
                    
                    <div class="btn-group btn-group-justified" role="group" style="width:300px">
  						<div class="btn-group" role="group">
    						<button type="submit" class="btn btn-danger" onclick="javascript: return confirm('确认修改？');">提交</button>
  						</div>
  						<div class="btn-group" role="group">
    						<button type="reset" class="btn btn-danger" onclick="javascript: return confirm('确认还原？');">还原</button>
 						</div>
					</div>
                </form>
                </center>
                <a href="javascript:history.go(-1);" style="font-size:20px;margin-left:40px">返回</a>

            </div>
        </div>
        <div class="footer">
            Copyright &copy; 2016 DXSTUDIO. All Rights Reserved.
        </div>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/function.js"></script>
		<script  type="text/javascript">  
		function setImagePreview() {          
		    var docObj=document.getElementById("doc");           
		    var imgObjPreview=document.getElementById("preview");  
		    if(docObj.files && docObj.files[0]){                          
		        //imgObjPreview.src = docObj.files[0].getAsDataURL();  
		        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式          
		        imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);  
		     }else{                          
		         //IE下，使用滤镜                          
		         docObj.select();                          
		         var imgSrc = document.selection.createRange().text;                          
		         var localImagId = document.getElementById("localImag");  
		         //必须设置初始大小                          
		         localImagId.style.width = "50px";                          
		         localImagId.style.height = "50px";  
		        //图片异常的捕捉，防止用户修改后缀来伪造图片  
		        try{                                  
		            localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";                                  
		            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;                          
		        }catch(e){                                  
		            alert("您上传的图片格式不正确，请重新选择!");                                  
		            return false;                          
		        }  
		            imgObjPreview.style.display = 'none';                          
		            document.selection.empty();                  
		     }                  
		     return true;          
		 }  
		 window.onload = function() {
				document.getElementById("op0").innerHTML = document.getElementById("name").value;
				document.getElementById("op0").value = document.getElementById("name").value;
				document.getElementById("op1").innerHTML = document.getElementById("pr").value;
				document.getElementById("op1").value = document.getElementById("pr").value;
			}
		</script>
</body>
</html>
