<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户信息管理界面</title>

  </head>
  
  <body>
  	<form action="<%=path %>/user/User_login.action" method="post">
  		<table>
  			<tr>
  				<td>用户账户</td>
  				<td><input type="text" name="userAccount"></td>
  			</tr>
  			<tr>
  				<td>用户密码</td>
  				<td><input type="password" name="userPwd"></td>
  			</tr>
  			<tr>
				<td colspan="2">
					<input type="submit" value="登陆">
				</td>  			
  			</tr>
  		</table><s:fielderror/>
  		<a href="<%=path %>/user/user_register.jsp">注册</a>
  	</form>
  </body>
</html>
