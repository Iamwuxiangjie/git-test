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
    
    <title>用户信息管理界面</title>

  </head>
  
  <body>
    <form action="<%=path%>/user/Comment_commentOK.action?orderid=<s:property value="#request.orderid"/>&page=<s:property value="#request.page"/>" method="post">
		星级:<input type="text" name="commentGrade"><br>
		评价:<input type="text" name="commentCont">
		<input type="submit" value="提交">
    </form>
    <s:fielderror/>
    <a href="<%=path%>/user/User_refresh.action">返回</a>
  </body>
</html>
