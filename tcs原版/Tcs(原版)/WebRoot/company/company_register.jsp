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
            注册
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
                欢迎注册成为服务公司！
            </h3>
        </div>
        <div class="register container">
            <h3>
                注册
            </h3>
            <div class="content-body">
                <form action="<%=path%>/company/Company_register.action" method="post">
                <s:fielderror />
                  <p>
                        <label>
                            公司名:
                        </label>
				<input type="text" class="input-text" id="Name" name="companyName" value="${request.registermsg.companyName}">
				</p>
				<p>
                        <label>
                            公司账号:
                        </label>
				<input type="text" class="input-text" id="Acc" name="companyAccount">
			</p>
			<p>
                        <label>
                            公司密码:
                        </label>
				<input type="password" class="input-pw" id="Pwd" name="companyPwd">
				</p>
			<p>
                        <label>
                           确认密码:
                        </label>
                        <input type="password" class="input-pw" id="RP" name="rePwd">
				</p>
			<p>
                <label>
                           公司地址:
                </label><br>
                <select name="provinces" id="provinces" onchange="allcity()" style="height:50px;width:49%;margin-bottom:30px">
					<option>--选择省份--</option>
				</select>
				<select name="city" id="city" style="height:50px;width:49%;margin-bottom:30px">
					<option>--选择市区--</option>
				</select>
			</p>
			<p>
                <label>
                           详细地址:
                </label>
				<input type="text" name="companyAddress2" id="Ad" value="${request.registermsg.companyAddress2}">
				</p>
			<p>
                <label>
                           公司电话:
                </label>
				<input type="text" name="companyPhone" id="Ph" value="${request.registermsg.companyPhone}">
			</p>
			<p class="clearfix">
                 <input tabindex="7" type="submit" class="button register" id="ComRegBtn" name="register" value="注册"/>
             </p>
            </form>
            </div>
        </div>
        <div class="footer">
            Copyright &copy; 2016 DXSTUDIO. All Rights Reserved.
        </div>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/function.js"></script>
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
	cityList['四川省'] = [ '成都市' ];
	cityList['海南省'] = [ '海口市' ];
	cityList['福建省'] = [ '福州市', '厦门市', '泉州市', '漳州市' ];
	cityList['山东省'] = [ '济南市', '青岛市', '烟台市' ];
	cityList['江西省'] = [ '南昌市' ];
	cityList['广西省'] = [ '柳州市', '南宁市' ];
	cityList['安徽省'] = [ '合肥市' ];
	cityList['河北省'] = [ '邯郸市', '石家庄市' ];
	cityList['河南省'] = [ '郑州市', '洛阳市' ];
	cityList['湖北省'] = [ '武汉市', '宜昌市' ];
	cityList['湖南省'] = [ '长沙市' ];
	cityList['陕西省'] = [ '西安市' ];
	cityList['山西省'] = [ '山西省', '太原市' ];
	cityList['黑龙江省'] = [ '哈尔滨市' ];
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





	<%-- <form action="<%=path%>/company/Company_register.action" method="post">
		<table border="1">
			<tr>
				<td>公司名</td>
				<td><input type="text" name="companyName"
					value="${request.registermsg.companyName}">
				</td>
			</tr>
			<tr>
				<td>公司注册账号</td>
				<td><input type="text" name="companyAccount">
				</td>
			</tr>
			<tr>
				<td>公司密码</td>
				<td><input type="password" name="companyPwd">
				</td>
			</tr>
			<tr>
				<td>确认密码</td>
				<td><input type="password" name="rePwd">
				</td>
			</tr>
			<tr>
				<td>公司地址</td>
				<!-- <td><input type="text" name="companyAddress"></td> -->
				<td><select name="provinces" id="provinces" onchange="allcity()">
						<option>--选择省份--</option>
				</select>
				<select name="city" id="city">
						<option>--选择市区--</option>
				</select></td>
			</tr>
			<tr>
				<td>公司详细地址</td>
				<td><input type="text" name="companyAddress2"
					value="${request.registermsg.companyAddress2}">
				</td>
			</tr>
			<tr>
				<td>公司服务范围</td>
				<td>
					<!-- <input type="text" name="companyServiceScope"> -->
					<select name="city" id="city">
						<option>--选择市区--</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>公司电话</td>
				<td><input type="text" name="companyPhone"
					value="${request.registermsg.companyPhone}">
				</td>
			</tr>
		</table>
		<input type="submit" value="提交"><br>
		<s:fielderror />
		<a href="<%=path%>/web/login.jsp">返回登录界面</a>
	</form> --%>
</body>
</html>
