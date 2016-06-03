<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>
            服务详情
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
                    <s:if test="#session.loginUser!=null">
                    	<li class="dropdown">
                            	<a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                              	 欢迎！${sessionScope.loginUser.userName}
                                	<span class="caret">
                                	</span>
                            	</a>
  								<ul class="dropdown-menu">
                                	<li>
                                    	<a href="<%=path%>/user/user_login_success.jsp">
                                        	个人中心
                                    	</a>
                                	</li>
                                	<li>
                                    	<a href="<%=path%>/user/User_logout.action">
                                        	退出登录
                                    	</a>
                                	</li>
                            	</ul>
                        	</li>
  						</s:if>
  						<s:elseif test="#session.loginCompany!=null">
  							<li class="dropdown">
                            	<a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                               			欢迎！${sessionScope.loginCompany.companyName}
                                	<span class="caret">
                                	</span>
                            	</a>
  								<ul class="dropdown-menu">
                                	<li>
                                    	<a href="<%=path%>/company/company_login_success.jsp">
                                        	管理中心
                                    	</a>
                                	</li>
                                	<li>
                                    	<a href="<%=path%>/company/Company_logout.action">
                                        	退出登录
                                    	</a>
                               	 	</li>
                            	</ul>
                       		</li>
  						</s:elseif>
  						<s:else>
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
  						</s:else>
                    
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
        <div class="sevice-details information container">
            <div class="row">
                <div class="col-xs-12 col-md-4">
                	<s:if test="#service.serviceImg==null">
						<img src="images/img.svg" width="100%"/>
					</s:if>
					<s:else>
						<img width="100%"alt="服务图片" src='<s:property value="#service.serviceImg"/>'>
					</s:else>
                    
                </div>
                
                <div class="col-xs-12 col-md-5">
                    <div class="page-header">
                        <h3>
                            <s:property value="#service.serviceName"/>
                        </h3>
                    </div>
                    <div class="alert alert-warning" role="alert">
                        价格：￥<s:property value="#service.serviceprice"/>
                        <span class="comment" style="float:right">
                          		 累计评论：<s:property value="#service.comment.size"/>&nbsp;&nbsp;
                          	服务评分:<s:if test="#service.serviceGrade==0">
                            	暂未评分 
                            </s:if>
                            <s:else>
                            	<s:property value="#service.serviceGrade"/>
                            </s:else>
                        </span>
                    </div>
                    <div>
                    	
                        <span>
                            数量
                        </span>
                        
                        <div class="btn-group">
                        
                        	<button onclick="numchanges('-')" id="but_reduce" style="float:left;border:1px solid #337ab7;background:#83a2cc;border-radius:5px" disabled="disabled">-</button>
   								<div id="NumOfOrder" style="float:left;font-size:18px">1</div>
   							<button onclick="numchanges('+')" style="float:left;border:1px solid #337ab7;background:#83a2cc;border-radius:5px">+</button>
                        
                        </div>
                        <b style="font-size: 16px;font-weight: normal;color: #aaa;margin-left:5px;margin-right:5px;">
                        	|
                        </b>
                        <b style="font-size: 14px;font-weight: normal;color: #aaa">
                        	单位:&nbsp;<s:property value="#service.service_priveunit.priveunitName"/>
                        </b>
                        <span class="time">
                            时间
                        </span>
                        
    						<select style="height:25px;width:100px;font-size:16px" id="startTime">
    							<option value="0">尽早开始</option>
    							<option value="1">一天后</option>
    							<option value="2">两天后</option>
    							<option value="3">三天后</option>
    						</select>
                        
                    </div>
                    <form  action="user/Order_addOrder" method="post" onsubmit="return addOrder('getStartTime','getaddress')">
                    	<input type="hidden" name="companyId" value="<s:property value='#service.service_company.companyId'/>"/>
    					<input type="hidden" name="serviceId" value="<s:property value='#service.serviceId'/>"/>
    					<input type="hidden" name="theNumOfOrder" value="1" id="theNumOfOrder"/>
    					<input type="hidden" name="starttime" value="1" id="getStartTime"/>
    					<input type="hidden" name="address" value="<s:property value='#session.loginUser.userAddress2'/>" id="getaddress"/>
                    	<div class="reserve">
                   			<s:if test="#session.loginUser!=null">
                    			<input class="btn btn-primary" type="submit" value="立即预定" style="margin-top:10px">
                   	 		</s:if>
  							<s:elseif test="#session.loginCompany!=null">
  								<td>公司不可预约服务，如要预约，请注册成为用户</td>
  							</s:elseif>
  							<s:else>
  								<td>要预约服务请先<a href="<%=path%>/web/login.jsp">登录</a></td>
  							</s:else> 
                    	</div>
                    </form>
                    <hr>
                    <p><strong>服务简介:</strong><br>
                        <s:if test="#service.serviceExplain==null">
                           	暂无简介
                        </s:if>
                        <s:else>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#service.serviceExplain"/>
                        </s:else>
                    </p>
                </div>
               
                <div class="col-xs-12 col-md-3">
                    <div class="page-header">
                        <h3>
                            服务公司
                        </h3>
                    </div>
                    <p>
                    	<s:if test="#service.service_company.companyImg!=null">
                    		<div class="thumbnail">
                    			<img alt="公司图片" src="<s:property value="#service.service_company.companyImg"/>">
                    		</div>
                       </s:if>
                       <s:else>
                       		<div class="thumbnail">
                       			<img alt="公司图片" src="images/userimg.png">
                       		</div>
                       </s:else>
                    </p>
                    <p style="color:#337ab7">
                        <s:property value="#service.service_company.companyName"/>
                    </p>
                    <p>
                      <strong> 公司简介:</strong><s:if test="#service.service_company.companySummary!=null">
                       		<s:property value="#service.service_company.companySummary"/>
                       </s:if>
                       <s:else>
                       		该公司尚未填写简介
                       </s:else>
                    </p>
                    <p>
                      <strong> 公司主类:</strong><s:if test="#service.service_company.company_facilitatorType==null">
                       		尚未选择类型
                       </s:if>
                       <s:else>
                       		<s:property value="#service.service_company.company_facilitatorType.facilitatorTypeName"/>
                       </s:else>
                    </p>
                    <p>
                      <strong> 公司评分:</strong><s:if test="#service.service_company.companyGrade==0">
                       		尚未获得评分
                       </s:if>
                       <s:else>
                       		<s:property value="#service.service_company.companyGrade"/>
                       </s:else>
                    </p>
                    <p>
                       <strong>公司电话:</strong><s:property value="#service.service_company.companyPhone"/>
                    </p>
                    <p>
                    	<a href="<%=path%>/user/Message_getMessageToPeople.action?companyId=<s:property value="#service.service_company.companyId"/>">
							联系服务商
						</a>
					</p>
                </div>
             	<div style="float:left;">
					<p style="margin-left:20px">
             	  	<a href="<%=path%>/user/Admin_getAllAdminName.action">
						举报该服务
					</a>
                </p>
                <p style="margin-left:20px">
             	  	<a href="<%=path%>/user/Service_getLikeServices?page=1">
						返回商品列表
					</a>|
					<a href="javascript:history.go(-1);">
						返回上一页
					</a>
                </p>
                </div>
                <div class="col-xs-12 col-md-12">
                    <div class="page-header comment-details">
                        <h3>
                            用户评价
                        </h3>
                    </div>
                    <s:if test="#service.comment.size>0">
                    	<s:iterator var="comment" value="#service.comment" status="num">
                    	<s:if test="#num.odd">
                    		<div class="media" style="background-color: #d9e4f6;padding: 5px;padding-right: 10px">
                    	</s:if>
                    	<s:else>
                    		<div class="media" style="background-color: #fcf8e3;padding: 5px;padding-right: 10px">
                    	</s:else>
                  	 	<!-- <div class="media" style="background-color: #d9e4f6"> -->
                        <div class="media-left media-middle">
                        	<s:if test="#comment.comment_user.userImg!=null">
								<img width="70" height="70" alt="用户头像" src="<s:property value="#comment.comment_user.userImg"/>">
							</s:if>
							<s:else>
								<img width="70" height="70" alt="用户头像" src="images/userimg.png">
							</s:else>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">
                                <s:property value="#comment.comment_user.userName"/>
                            </h4>
                            <p><s:property value="#comment.commentCont"/></p>
                            
                            <p style="float:left">用户评分:<s:property value="#comment.commentGrade"/></p>
                            <p style="float:right">评价时间:<s:property value="#comment.commentTime"/></p>
                        </div>
                    	</div>
                    	</s:iterator>
                    </s:if>
                    <s:else>
                    	<!-- 暂未获得评论 -->
                    	
                    	<div class="col-xs-2 col-md-offset-5">
            				<img width="150px" height="150px" src="images/comm.png">
            			</div>
    					<div class="col-xs-5 col-md-offset-4">
            				<h4>还没有用户评价，让亲成为第一个评价的人吧！</h4>
            			</div>
                    	
                    </s:else>
                    <s:if test="#nowpage>1">
    				<a href="web/Service_forwardto?page=<s:property value='#nowpage-1'/>&serviceid=<s:property value='#ServiceTypeId'/>">上一页</a>
    					</s:if>
    				<s:if test="#nowpage<#themaxpage">
    					<a href="web/Service_forwardto?page=<s:property value='#nowpage+1'/>&serviceid=<s:property value='#ServiceTypeId'/>">下一页</a>
    				</s:if>
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
        <script src="js/function.js">
        </script>
<script type="text/javascript">
  	function numchanges(a){
  		var but_reduce=document.getElementById("but_reduce");
  		var numvalue=document.getElementById("NumOfOrder");
  		var num=parseInt(numvalue.innerHTML);
  		if(a=="-"){
				numvalue.innerHTML=num-1;
				if(parseInt(numvalue.innerHTML)==1){
 					but_reduce.disabled=true;
				}	
  		}else if(a=="+"){
  			but_reduce.disabled=false;
  			numvalue.innerHTML=num+1;	
  		}
  		
  	}
  	function addOrder(stime,add){
  		var numvalue=document.getElementById("NumOfOrder");
  		var num=parseInt(numvalue.innerHTML);
  		var startTime = document.getElementById("startTime").value;
  		document.getElementById('getStartTime').value=startTime;
  		document.getElementById('theNumOfOrder').value=num;
  			
  		var temp = document.getElementById(stime).value;
  		var startTime;
  		if(temp==0){
  			startTime = "尽早开始";
  		}else if(temp==1){
  			startTime = "一天后开始";
  		}else if(temp==2){
  			startTime = "两天后开始";
  		}else if(temp==3){
  			startTime = "三天后开始";
  			}else{
  		alert("时间选择错误！");
  			return false;
  		}
  		var address = document.getElementById(add).value;
  		var result=confirm("开始时间："+startTime+"\n服务地址："+address+"\n确认购买信息准确无误？");
  		if(result){
  			return true;
  		}else{
  			return false;
  		}
  	}
  </script>
  </body>
</html>
