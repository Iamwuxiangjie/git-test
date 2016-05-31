<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="s" uri="/struts-tags"%> --%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Company Login</title>
  </head>
  
  <body>
   <form action="<%=path%>/company/Company_login.action" method="post">
   	公司账号：<input type="text" name="CompanyAccount">密码：<input type="password" name="companyPwd">
    <input type="submit" value="登录"><br>
    </form>
    <s:fielderror/>
    <a href="<%=path%>/company/company_register.jsp">注册</a>
  </body>
</html>
