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
    
    <title>�û���Ϣ�������</title>

  </head>
  
  <body>
  	<form action="<%=path %>/user/User_login.action" method="post">
  		<table>
  			<tr>
  				<td>�û��˻�</td>
  				<td><input type="text" name="userAccount"></td>
  			</tr>
  			<tr>
  				<td>�û�����</td>
  				<td><input type="password" name="userPwd"></td>
  			</tr>
  			<tr>
				<td colspan="2">
					<input type="submit" value="��½">
				</td>  			
  			</tr>
  		</table><s:fielderror/>
  		<a href="<%=path %>/user/user_register.jsp">ע��</a>
  	</form>
  </body>
</html>
