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
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>
        服务列表
    </title>
    <link rel="shortcut icon" href="images/favicon.ico" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
	<style type="text/css">
	a{
		color: #6495ED;
	}
	.afteraction{
		color: #00BFFF;
	}
  	</style>
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
        <div class="sevice-list information container">
            <h2>
                智慧社区家政服务
            </h2>
            <h4>
                我们倾听每一位顾客的心声，竭诚为您服务。
            </h4>
            
            <div class="shop-menu clearfix">
            <b>服务分类:</b>
            <ul>
            	<li><a <s:if test="#ServiceTypeId==0">class="afteraction"</s:if>
  			href="user/Service_getLikeServices?page=1&ServiceTypeId=0">全部</a></li>
  				<s:iterator var="type" status="num" value="#request.servicetype">
					<s:if test="#num.index<9">
						<li>
							<a <s:if test="#ServiceTypeId==#type.serviceTypeId">class="afteraction"</s:if>
					 		href="user/Service_getLikeServices?page=1&ServiceTypeId=<s:property value='#type.serviceTypeId'/>"><s:property value="#type.serviceTypeName"/>
				 			</a>
						</li>	
					</s:if>
  				</s:iterator>
                <s:if test="#request.servicetype.size>9">
                	<li class="check-more"><button id="check-more">查看更多</button></li>
                </s:if>
            </ul>
            <ul id="service-more" style="display: none;">
            	<s:iterator var="type" status="num" value="#request.servicetype" begin="9">
					<li>
						<a <s:if test="#ServiceTypeId==#type.serviceTypeId">class="afteraction"</s:if>
				 		href="user/Service_getLikeServices?page=1&ServiceTypeId=<s:property value='#type.serviceTypeId'/>"><s:property value="#type.serviceTypeName"/>
				 		</a>
					</li>	
  				</s:iterator>
            </ul>
        </div>
            
            <div class="row" id="masonry">
            
            <s:if test="#serviceslist.size<1">
            	<h4>我们还没有准备好，请等待第一位服务的上架</h4>
            </s:if>
            <s:else>
            <s:iterator var="service" status="num" value="#serviceslist">
                <div class="box col-sm-6 col-md-3">
                    <div class="thumbnail">
                    	<s:if test="#service.serviceImg!=null">
    						<img alt="服务图片" src="<s:property value="#service.serviceImg"/>">
    					</s:if>
    					<s:else>
    						<img src="images/img.svg" />
    					</s:else>
                        <div class="caption">
                            <h3>
                                <s:property value="#service.serviceName"/>
                            </h3>
                            <p>
                                <s:if test="#service.serviceExplain!=null">
    								<s:property value="#service.serviceExplain"/>
    							</s:if>
    							<s:else>
    								服务公司太懒了，还未填写简介
    							</s:else>
                            </p>
                            <form method="get" action="web/Service_forwardto">
                            <p>
                            	评分:
                            <s:if test="#service.serviceGrade==0">
    							暂无评分
    						</s:if>
    						<s:else>
    							<s:property value="#service.serviceGrade"/>&nbsp;分
    						</s:else>
    							<input type="hidden" value="<s:property value="#service.serviceId"/>" name="serviceid"/>
    							<input type="hidden" value="1" name="page"/>
    							<input class="btn btn-primary" type="submit" value="查看详情" style="margin-left:130px"/>
                            </p>
                            </form>
                        </div>
                    </div>
                </div>
            </s:iterator>
             </s:else>
             	
            </div>
             		<s:if test="#nowpage>1">
    					<a href="user/Service_getLikeServices?page=<s:property value='#nowpage-1'/>&ServiceTypeId=<s:property value='#ServiceTypeId'/>&likename=<s:property value='likename'/>" 
    					style="font-size:18px">上一页</a>
    				</s:if>
    				<s:if test="#nowpage<#themaxpage">
    					<a href="user/Service_getLikeServices?page=<s:property value='#nowpage+1'/>&ServiceTypeId=<s:property value='#ServiceTypeId'/>&likename=<s:property value='likename'/>"
    					style="font-size:18px">下一页</a>
    				</s:if>
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
  </body>
</html>
