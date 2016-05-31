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

<title>智慧社区家政服务</title>
<link href="<%=basePath%>images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="<%=basePath%>css/swiper-3.3.1.min.css" type="text/css" rel="stylesheet">
<link href="<%=basePath%>css/animate.min.css" type="text/css" rel="stylesheet">
<link href="<%=basePath%>css/index.css" type="text/css" rel="stylesheet">
<script src="<%=basePath%>js/swiper-3.3.1.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/swiper.animate1.0.2.min.js" type="text/javascript"></script>

</head>
<body>
	<div id="head">
		<div class="top">
			<div class="logo">
				<a href="<%=basePath%>web/index.jsp" >
					<img alt="塔塔家政" src="./images/logo_index.png">
					<span>智慧社区家政服务</span>
				</a>
			</div>
			<div class="headTag">
				<ul>
					<s:if test="#session.loginUser!=null">
						<li><span>${session.loginUser.userName} 你好！</span></li>
						<li><a href="<%=path%>/user/user_login_success.jsp">个人中心</a>
						</li>
					</s:if>
					<s:elseif test="#session.loginCompany!=null">
						<li><span>${session.loginCompany.companyName} 你好！</span></li>
						<li><a href="<%=path%>/company/company_login_success.jsp">管理中心</a>
						</li>
					</s:elseif>
					<s:else>
						<li><a href="<%=path%>/web/login.jsp">登录</a></li>
					</s:else>
					<li><a href="<%=path%>/user/Service_getLikeServices?page=1">服务列表</a>
					</li>
				</ul>

			</div>
		</div>
	</div>
	<!-- Swiper -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide floorone">
				<div class="ani" swiper-animate-effect="ZoomIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.1s">
					<h2>
						享受生活
					</h2>
					<p class="topP">爱心汇聚，贤惠帮家</p>
					<p class="topP">关心你就象关心我自己</p>
					<p class="topP">一样的家政服务，不一样的品质体验</p>
				</div>
			</div>
			<div class="swiper-slide floortwo">
				<ul class="index_ul">
					<li class="ani" swiper-animate-effect="lightSpeedIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.1s">
						<span class="icon-title1"></span>
						<dl class="dl-txt">
							<dt>提交您的需求</dt>
							<dd>告诉我们您想要的服务，以及希望的时间。</dd>
						</dl>
					</li>
					<li class="ani" swiper-animate-effect="lightSpeedIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.5s">
						<span class="icon-title2"></span>
						<dl class="dl-txt">
							<dt>选择一位服务员</dt>
							<dd>从我们帮您筛选出的服务员里，挑出一位或几位您满意的吧。</dd>
						</dl>
					</li>
					<li class="ani" swiper-animate-effect="lightSpeedIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.9s">
						<span class="icon-title3"></span>
						<dl class="dl-txt">
							<dt>坐等上门</dt>
							<dd>选好完毕后，在约定的时间里等待服务员的到来。</dd>
						</dl>
					</li>
				</ul>
			</div>
			<div class="swiper-slide floorthree">
				<div class="contxt-title ani" swiper-animate-effect="ZoomIn" swiper-animate-duration="0.7s" swiper-animate-delay="0s">
					<h2>服务从“心”开始</h2>
				</div>
				<div class="contxt-con ani" swiper-animate-effect="flipInY" swiper-animate-duration="0.8s" swiper-animate-delay="0.8s">	
					<p>得人心者得天下，聚人心者稳天下。<br/>真心地对待家政人员是对他们最好的激励！<br/>家政人员进入客户家庭之后，我们会定期进行回访，反馈表由客户亲自填写，我们会认真采取客户的意见，综合评价每一位服务员，并且帮助她们改正自身的缺点，不断的满足客户的需求。<br/>公司定期对他们进行培训，以提高服务员的技能，增加他们的收入，这样也能避免家政服务员的突然离职。<br/>但有些服务员离职可能是因为突发事件，任何事情我们都无法预测，服务员的人身自由我们无法控制，相信雇主也能够理解.当雇主与家政人员发生冲突时，我们会帮助家政服务员与雇主进行协商沟通，最大程度的化解矛盾</p>
				</div>
			</div>
			<div class="swiper-slide floorfour">
				<div class="center">
					<div class="ani" swiper-animate-effect="fadeInDown" swiper-animate-duration="0.5s" swiper-animate-delay="0.1s">
						<h5 class="titleH">关于我们</h5>
						<p class="text">
							社区作为一座城市最重要也是最基本的管理和生活运作单元，承担着成千上万普通市民的衣食住行的需求，随着创建“智慧城市”的进程在全国各地不断推进，“智慧社区”作为“智慧城市”的重要组成部分，也受到越来越多的关注。“智慧社区”涵盖的范围非常广泛，包括了社区所管理的各项工作，其中家政服务是与广大居民关系最为密切的一个功能，它的智能化和网络化将成为“智慧社区”乃至“智慧城市”最重要的实现标志......
							<a class="amore">更多</a>
						</p>
					</div>
					<div class="ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="0.5s" swiper-animate-delay="0.1s">
						<p class="cp-text">版权所有 ©<a href="<%=basePath%>web/index.jsp">智慧社区家政服务</a></p>
					</div>
				</div>
			</div>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
	</div>
	<script src="<%=basePath%>js/index.js" type="text/javascript"></script>
</body>
</html>

