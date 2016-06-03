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
                消息中心
            </h3>
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
                <li>
                    <a href="<%=path%>/user/Comment_selectUserAllComment.action?page=1">
                        评价记录
                    </a>
                </li>
                <li class="active">
                    <s:if test='#session.unreadmessage==0'>
						<a href="<%=path%>/user/Message_selectUserAllMessage.action?page=1">消息中心</a>
					</s:if>
					<s:else>
						<a href="<%=path%>/user/Message_selectUserAllMessage.action?page=1">消息中心 <span class="badge">${sessionScope.unreadmessage}</span></a>
					</s:else>
                </li>
            </ul>
            <div class="alert alert-warning" role="alert">
                <strong>
                    未读消息
                </strong>
            </div>
            
            <s:if test="#request.unreadmessage==null">
            	<div class="table-responsive" style="overflow: hidden;">
    			<div class="col-xs-2 col-md-offset-5">
            		<img width="60px" height="50px" src="images/unread.jpg">
            		<h5>暂无未读消息</h5>
            	</div>
            	</div>
    		</s:if>
            
            <s:else>
            <form method="post" id="form1">
            <div class="table-responsive" style="overflow: hidden;max-height: 405px;">
            <%-- <s:if test="#request.unreadmessage==null">
    			<div class="col-xs-2 col-md-offset-5">
            		<img width="60px" height="50px" src="images/unread.jpg">
            		<h5>暂无未读消息</h5>
            	</div>
    		</s:if>
    		<s:else>
    		<form method="post" id="form1"> --%>
                <table class="table">
                    <thead>
                        <tr bgcolor="#e1f5b2">
                            <td><input type="checkbox" id="all1" onclick="checkall(this,'message1')">&nbsp;全选</td>
							<th>发件人</th>
							<th>标题</th>
							<th>发件时间</th>
							<th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="#request.unreadmessage" var="message" status="st">
					<s:if test="#st.odd">
							<tr>
						</s:if>
						<s:else>
							<tr bgcolor="#f1f1f1">
						</s:else>
					<td><input type="checkbox" class="message1" name="messageidlist" value="<s:property value="#message.messageId"/>" onclick="check('message1')"></td>
					<td>
						<s:if test="#message.messageFromCompany!=null">
							<span class="messageFrom" title="服务公司:<s:property value="#message.messageFromCompany.companyName" />" style="cursor: pointer;">服务公司:<s:property value="#message.messageFromCompany.companyName" /></span>
						</s:if>
						<s:elseif test="#message.messageFromUser!=null">
							<span class="messageFrom" title="用户:<s:property value="#message.messageFromUser.userName" />" style="cursor: pointer;">用户:<s:property value="#message.messageFromUser.userName" /></span>
						</s:elseif>
						<s:elseif test="#message.messageFromAdmin!=null">
							<span class="messageFrom" title="管理员:<s:property value="#message.messageFromAdmin.adminName" />" style="cursor: pointer;">管理员:<s:property value="#message.messageFromAdmin.adminName" /></span>
						</s:elseif>
						<s:else>
							系统中心
						</s:else>
					</td>
					<td>
						<span class="messageTitle" title="<s:property value="#message.messageTitle" />" style="cursor: pointer;"><s:property value="#message.messageTitle" /></span>
					</td>
					<td><s:property value="#message.messageTime" />
					</td>
				
					<td>
						<input type="hidden" value="<s:property value="#message.messageBody" />" id="<s:property value="#message.messageId"/>">
						<a href="#" class="check" data-toggle="modal" data-target="#myModal" onclick="replace(<s:property value="#message.messageId"/>)">查看</a>
                        <s:if test="#message.messageFromUser!=null||#message.messageFromAdmin!=null||#message.messageFromCompany!=null">
							<a href="<%=path%>/user/Message_getMessageToPeople?msgid=<s:property value="#message.messageId"/>">回复</a>
						</s:if>
						<a href="<%=path%>/user/Message_readMessage.action?messageidlist=<s:property value="#message.messageId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>">已读</a>
						<a href="<%=path%>/user/Message_deleteMessage.action?messageidlist=<s:property value="#message.messageId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
						onclick="javascript: return confirm('真的要删除吗？');">删除</a>
					</td>
				</tr>
			</s:iterator>
                    </tbody>
                </table>
               <!--  <input role="button" class="btn btn-default" type="submit" value="批量删除" onclick="pd(this)">
                &nbsp;
                <input role="button" class="btn btn-default" type="submit" value="批量已读" onclick="pd(this)">
		</form> -->
              </div>
            <div style="margin-top: 5px">
             <input role="button" class="btn btn-danger" type="submit" value="批量删除" onclick="pd(this)">
                &nbsp;
                <input role="button" class="btn btn-success" type="submit" value="批量已读" onclick="pd(this)">
            </div>
			</form>
			 </s:else>
            
            
            
            <div class="alert alert-info" role="alert">
                <strong>
                    已读消息
                </strong>
            </div>
            <div class="message-search">
            <form action="<%=path%>/user/Message_selectUserAllMessage.action?page=1" method="get">
                <div class="input-group">
						<input type="text" name="key" value="${request.key }" class="form-control" placeholder="请输入信息标题关键字">
					 	<span class="input-group-btn">
					 	<button class="btn btn-default" type="submit">
                            搜索
                        </button>
                        </span>
                </div>
                </form>
            </div>
            <div class="table-responsive" style="overflow: hidden;">
            <s:if test="#request.readmessage==null">
    			<div class="col-xs-2 col-md-offset-5">
            		<img width="60px" height="50px" src="images/read.jpg">
            		<h5>暂无已读消息</h5>
            	</div>
    		</s:if>
	<s:else>
		<form action="<%=path%>/user/Message_deleteMessage.action?page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>" method="post">
		<table class="table">
			<thead>
			<tr bgcolor="#e1f5b2">
				<td><input type="checkbox" id="all2" onclick="checkall(this,'message2')">&nbsp;全选</td>
				<th>发件人</th>
				<th>标题</th>
				<th>发件时间</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
			<s:iterator value="#request.readmessage" var="message"  status="st">
				<s:if test="#st.odd">
							<tr>
						</s:if>
						<s:else>
							<tr bgcolor="#f1f1f1">
						</s:else>
					<td><input type="checkbox" class="message2" name="messageidlist" value="<s:property value="#message.messageId"/>" onclick="check('message2')"></td>
					<td>
						<s:if test="#message.messageFromCompany!=null">
							<span class="messageFrom" title="服务公司:<s:property value="#message.messageFromCompany.companyName" />" style="cursor: pointer;">服务公司:<s:property value="#message.messageFromCompany.companyName" /></span>
						</s:if>
						<s:elseif test="#message.messageFromUser!=null">
							<span class="messageFrom" title="用户:<s:property value="#message.messageFromUser.userName" />" style="cursor: pointer;">用户:<s:property value="#message.messageFromUser.userName" /></span>
						</s:elseif>
						<s:elseif test="#message.messageFromAdmin!=null">
							<span class="messageFrom" title="管理员:<s:property value="#message.messageFromAdmin.adminName" />" style="cursor: pointer;">管理员:<s:property value="#message.messageFromAdmin.adminName" /></span>
						</s:elseif>
						<s:else>
							系统中心
						</s:else>
					</td>
					<td>
						<span class="messageTitle" title="<s:property value="#message.messageTitle" />" style="cursor: pointer;"><s:property value="#message.messageTitle" /></span>
					</td>
					<td><s:property value="#message.messageTime" />
					</td>
					<td>
						<input type="hidden" value="<s:property value="#message.messageBody" />" id="<s:property value="#message.messageId"/>">
						<a href="#" class="check" data-toggle="modal" data-target="#myModal" onclick="replace(<s:property value="#message.messageId"/>)">查看</a>
                        <s:if test="#message.messageFromUser!=null||#message.messageFromAdmin!=null||#message.messageFromCompany!=null">
							<a href="<%=path%>/user/Message_getMessageToPeople?msgid=<s:property value="#message.messageId"/>">回复</a>
						</s:if>
						<a href="<%=path%>/user/Message_deleteMessage.action?messageidlist=<s:property value="#message.messageId"/>&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
						onclick="javascript: return confirm('真的要删除吗？');">删除</a>
					</td>
				</tr>
			</s:iterator>
			</tbody>
		</table>
		<input class="btn btn-danger" type="submit" value="批量删除" onclick="javascript: return confirm('真的要删除吗？');">
		</form>
		<div style="float:right;margin-bottom: 5px">
		<s:if test="#request.page==1">
			<s:if test="10>=#request.counts" >
				<a class="btn btn-default" >首页</a>&nbsp;
				<a class="btn btn-default" >上一页</a>&nbsp;
				第<s:property value="#request.page"/>页&nbsp;
				<a class="btn btn-default" >下一页</a>&nbsp;
				<a class="btn btn-default" >尾页</a>
			</s:if>
			<s:else>
				<a class="btn btn-default" >首页</a>&nbsp;
				<a class="btn btn-default" >上一页&nbsp</a>
				第<s:property value="#request.page"/>页&nbsp;
				<a class="btn btn-success" href="<%=path%>/user/Message_selectUserAllMessage.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
					<a class="btn btn-info" href="<%=path%>/user/Message_selectUserAllMessage.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
				</s:if>
				<s:else>
					<a class="btn btn-info" href="<%=path%>/user/Message_selectUserAllMessage.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
				</s:else>
			</s:else>
    	</s:if>
		<s:else>
			<s:if test="#request.page*10>=#request.counts" >
				<a class="btn btn-info" href="<%=path%>/user/Message_selectUserAllMessage.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
				<a class="btn btn-success" href="<%=path%>/user/Message_selectUserAllMessage.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
				第<s:property value="#request.page"/>页&nbsp;
				<a class="btn btn-default" >下一页</a>&nbsp;
				<a class="btn btn-default" >尾页</a>
			</s:if>
			<s:else>
				<a class="btn btn-info" href="<%=path%>/user/Message_selectUserAllMessage.action?page=1&key=<s:property value="#request.key"/>">首页</a>&nbsp;
				<a class="btn btn-success" href="<%=path%>/user/Message_selectUserAllMessage.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>">上一页</a>&nbsp;
				第<s:property value="#request.page"/>页&nbsp;
				<a class="btn btn-success" href="<%=path%>/user/Message_selectUserAllMessage.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
					<a class="btn btn-info" href="<%=path%>/user/Message_selectUserAllMessage.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>">尾页</a>
				</s:if>
				<s:else>
					<a class="btn btn-info" href="<%=path%>/user/Message_selectUserAllMessage.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>">尾页</a>
				</s:else>
			</s:else>
		</s:else>
		</div>
		</s:else>
		</div>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">
                                &times;
                            </span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                           	 消息内容
                        </h4>
                    </div>
                    <div class="modal-body" id="body">
                        
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            Copyright &copy; 2016 DXSTUDIO. All Rights Reserved.
        </div>
        <script src="js/jquery-1.12.1.min.js">
        </script>
        <script src="js/bootstrap.min.js">
        </script>
<script type="text/javascript">
	function  replace(id){
    	document.getElementById("body").innerText=document.getElementById(id).value;
    	
	}

	function checkall(ev,m){
		var obj= document.getElementsByTagName('input');
		if(ev.checked==true)
		{
			for(var i=0;i<obj.length;i++)
			{
				if(obj[i].className == m)
				{
					obj[i].checked=true;
				}
			}
		}
		else if(ev.checked==false)
		{
			for(var i=0;i<obj.length;i++)
			{
				if(obj[i].className == m)
				{
					obj[i].checked=false;
				}
			}
		}
	}
	
	function check(m){
		var obj= document.getElementsByTagName('input');
		if(m == "message1"){
			var count = obj.length;
			var flag = 0;
			for(var i=0;i<obj.length;i++)
			{
				flag++;
				if(obj[i].className == m)
				{
					if(obj[i].checked==false)
					{
						document.getElementById("all1").checked=false;
						break;
					}
				}
			}
			if(flag==count)
			{
				document.getElementById("all1").checked=true;
			}
		}else{
			var count = obj.length;
			var flag = 0;
			for(var i=0;i<obj.length;i++)
			{
				flag++;
				if(obj[i].className == m)
				{
					if(obj[i].checked==false)
					{
						document.getElementById("all2").checked=false;
						break;
					}
				}
			}
			if(flag==count)
			{
				document.getElementById("all2").checked=true;
			}
		}
	}
	
	function pd(ev){
		var form1=document.getElementById('form1');
		if(ev.value=='批量删除')form1.action='<%=path%>/user/Message_deleteMessage.action?page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>';
		else if(ev.value=='批量已读')form1.action='<%=path%>/user/Message_readMessage.action?page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>';
	}
	window.onload = function() {
		var messageFrom=document.getElementsByClassName("messageFrom");
		var messageTitle=document.getElementsByClassName("messageTitle");
		for(var i=0;i<messageFrom.length;i++){
			if(messageFrom[i].innerHTML.length>13){
				messageFrom[i].innerHTML=messageFrom[i].innerHTML.substring(0,13)+"...";
			}
		}
		for(var i=0;i<messageTitle.length;i++){
			if(messageTitle[i].innerHTML.length>15){
				messageTitle[i].innerHTML=messageTitle[i].innerHTML.substring(0,15)+"...";
			}
		}
	}
</script>
</body>
</html>
