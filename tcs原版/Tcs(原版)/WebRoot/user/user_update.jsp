<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='/struts-tags' prefix='s' %>
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
                我的账户
            </h3>
            <ul class="account-nav">
                <li class="active">
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
                <li>
                    <s:if test='#session.unreadmessage==0'>
						<a href="<%=path%>/user/Message_selectUserAllMessage.action?page=1">消息中心</a>
					</s:if>
					<s:else>
						<a href="<%=path%>/user/Message_selectUserAllMessage.action?page=1">消息中心 <span class="badge">${sessionScope.unreadmessage}</span></a>
					</s:else>
                </li>
            </ul>
            <div class="personal-information">
                <h3>
                    个人信息
                </h3>
                <ul class="pi-nav">
                    <li>
                        <a href="<%=path%>/user/user_update.jsp">
                            <span class="glyphicon glyphicon-pencil">
                            </span>
                            编辑信息
                        </a>
                    </li>
                    <li>
                        <a href="<%=path%>/user/user_repwd.jsp" class="change-password">
                            <span class="glyphicon glyphicon-lock">
                            </span>
                            修改密码
                        </a>
                    </li>
                </ul>
                <form action="<%=path %>/user/User_update.action" method="post">
                <div class="row">
                    <div class="avatar col-xs-12 col-sm-12 col-md-4" style="margin-top:50px">
                        <s:if test="#session.loginUser.userImg!=null">
							<a href="<%=path%>/user/user_upload.jsp">
								<img width="200" height="200" alt="点击修改" src="${sessionScope.loginUser.userImg }">
							</a>
						</s:if>
						<s:else>
							<a href="<%=path%>/user/user_upload.jsp">
								<img alt="点击修改" src="images/userimg.png">
							</a>
						</s:else>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            用户昵称:
                        </small>
                        <p>
                            <input type="text" name="userName" class="edit-pi" value="${sessionScope.loginUser.userName}"/>
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                           需要的服务:
                        </small>
                         
                        <p>
                        <select name="serviceTypeName" style="height:50px;width:100%;border:1px solid #ddd;border-radius:4px">
                        	<s:iterator value="#session.serviceTypeName" var="name">
                        		<option value='<s:property value="#name"/>'><s:property value="#name"/></option>
                        	</s:iterator>
                        </select>
                        
                        
                       <%-- <s:select name="serviceTypeName" list="#session.serviceTypeName" /> --%>
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            实名认证:
                        </small>
                        <p style="margin-top:10px">
                        <s:if test='#session.loginUser.userRealName==null||#session.loginUser.userRealName==""'>
								还未认证&nbsp;<a href="<%=path%>/user/user_realName.jsp" class="verification">去认证</a>
						</s:if>
						<s:else>已认证</s:else>
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            电话:
                        </small>
                        <p>
                           <input type="text" class="edit-pi" name="userPhone" value="${sessionScope.loginUser.userPhone}">
                        </p>
                    </div>
                      <div class="col-xs-12 col-sm-12 col-md-4">
                        <input type="submit" class="button" name="save-address" value="保存"/>
                        <a href="<%=path%>/user/User_refresh.action" class="cancel">
                            取消编辑
                        </a>
                    </div>
                     
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            地址:
                        </small>
                        <p>
                        <select name="provinces" id="provinces" onchange="allcity()" style="height:50px;width:48%;border:1px solid #ddd;border-radius:4px">
						<option>--选择省份--</option>
						</select>
						<select name="city" id="city" style="height:50px;width:48%;border:1px solid #ddd;border-radius:4px">
						<option>--选择市区--</option>
						</select>
						</p>
                    </div>
                    
                     <div class="col-xs-12 col-sm-12 col-md-4">
                        <small>
                            详细地址:
                        </small>
                        <p>
                            <input type="text" name="userAddress2" class="edit-pi" value="${sessionScope.loginUser.userAddress2}"/>
                        </p>
                    </div>
                </div>
                </form>
                <s:fielderror/>
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
	var cityList = new Array();
	cityList['北京市'] = [ '朝阳区', '东城区', '西城区', '海淀区', '宣武区', '丰台区', '怀柔', '延庆',
			'房山' ];
	cityList['上海市'] = [ '宝山区', '长宁区', '丰贤区', '虹口区', '黄浦区', '青浦区', '南汇区', '徐汇区',
			'卢湾区' ];
	cityList['广州省'] = [ '广州市', '惠州市', '汕头市', '珠海市', '佛山市', '中山市', '东莞市' ];
	cityList['深圳市'] = [ '福田区', '罗湖区', '盐田区', '宝安区', '龙岗区', '南山区', '深圳周边' ];
	cityList['重庆市'] = [ '俞中区', '南岸区', '江北区', '沙坪坝区', '九龙坡区', '渝北区', '大渡口区',
			'北碚区' ];
	cityList['天津市'] = [ '和平区', '河西区', '南开区', '河北区', '河东区', '红桥区', '塘古区', '开发区' ];
	cityList['江苏省'] = [ '南京市', '苏州市', '无锡市' ];
	cityList['浙江省'] = [ '杭州市', '宁波市', '温州市' ];
	cityList['四川省'] = [ '四川省', '成都市' ];
	cityList['海南省'] = [ '海口市' ];
	cityList['福建省'] = [ '福州市', '厦门市', '泉州市', '漳州市' ];
	cityList['山东省'] = [ '济南市', '青岛市', '烟台市' ];
	cityList['江西省'] = [ '江西省', '南昌市' ];
	cityList['广西省'] = [ '柳州市', '南宁市' ];
	cityList['安徽省'] = [ '安徽省', '合肥市' ];
	cityList['河北省'] = [ '邯郸市', '石家庄市' ];
	cityList['河南省'] = [ '郑州市', '洛阳市' ];
	cityList['湖北省'] = [ '武汉市', '宜昌市' ];
	cityList['湖南省'] = [ '湖南省', '长沙市' ];
	cityList['陕西省'] = [ '陕西省', '西安市' ];
	cityList['山西省'] = [ '山西省', '太原市' ];
	cityList['黑龙江省'] = [ '黑龙江省', '哈尔滨市' ];
	cityList['其他'] = [ '其他' ];
	function allshengfen() {
		var pro = document.getElementById("provinces");
		for ( var i in cityList) {
			pro.add(new Option(i, i));
		}
	}
	function allcity() {
		var pro = document.getElementById("provinces").value;
		var city = document.getElementById("city");
		city.options.length = 0;
		for ( var i in cityList) {
			if (i == pro) {
				for ( var j in cityList[i]) {
					city.add(new Option(cityList[i][j], cityList[i][j]));
				}
			}
		}
	}
	window.onload = allshengfen;
</script>
		<%-- <form action="<%=path %>/user/User_update.action" method="post">
			<table>
				<tr>
					<td>
						用户昵称*
					</td>
					<td>
						<input type="text" name="userName" value="${sessionScope.loginUser.userName}">
					</td>
				</tr>
				<tr>
					<td>
						用户电话
					</td>
					<td>
						<input type="text" name="userPhone" value="${sessionScope.loginUser.userPhone}">
					</td>
				</tr>
				<tr>
					<td>
						用户地址*
					</td>
					<td>
						<select name="provinces" id="provinces" onchange="allcity()">
						<option>--选择省份--</option>
						</select>
						<select name="city" id="city">
						<option>--选择市区--</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						用户详细地址*
					</td>
					<td>
						<input type="text" name="userAddress2" value="${sessionScope.loginUser.userAddress2}">
					</td>
				</tr>
				<tr>
					<s:select label="喜好" name="serviceTypeName" list="#session.serviceTypeName" >
			</s:select>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="更新">
					</td>
				</tr>
			</table>
		</form>
		<s:fielderror/>
		<a href="<%=path%>/user/User_refresh.action">返回</a> --%>
	</body>
</html>
