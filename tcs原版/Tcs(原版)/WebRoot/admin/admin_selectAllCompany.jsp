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

<title>管理员管理界面</title>
<link href="<%=basePath%>css/admin_selectAllCompany.css" type="text/css" rel="stylesheet">
</head>

<body>
	<div id="admin_selectAllCompany">
		<form action="<%=path%>/admin/Company_selectAllCompany.action"
			method="get">
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="tage" value="<s:property value="#request.tage"/>">
			<input type="text" class="txt" name="key" value="${request.key }" placeholder="公司名称" />
			<input type="submit" value="搜索" class="search">
		</form>
		<p>
		<a
			href="<%=path%>/admin/Company_selectAllCompany.action?page=1&tage=1&key=<s:property value="#request.key"/>">按评分降序排序</a>&nbsp;
		<a
			href="<%=path%>/admin/Company_selectAllCompany.action?page=1&tage=2&key=<s:property value="#request.key"/>">按评分升序排序</a>&nbsp;
		<a
			href="<%=path%>/admin/Company_selectAllCompany.action?page=1&tage=3&key=<s:property value="#request.key"/>">未通过审核</a>&nbsp;
		<a
			href="<%=path%>/admin/Company_selectAllCompany.action?page=1&tage=4&key=<s:property value="#request.key"/>">评分低于2分</a>&nbsp;
		<a
			href="<%=path%>/admin/Company_selectAllCompany.action?page=1&tage=0&key=<s:property value="#request.key"/>">全部</a>&nbsp;
		</p>
		<s:if test="#request.allCompany!=null">

			<table class="dataTable">
				<tr>
					<th>图片</th>
					<th>公司名称</th>
					<th>评分</th>
				</tr>
				<s:iterator value="#request.allCompany" var="company">
					<tr>
						<s:if test="#company.companyImg!=null">
							<td><img width="50" height="50" alt="公司头像"
								src="<s:property value="#company.companyImg"/>">
							</td>
						</s:if>
						<s:else>
							<td><img width="50" height="50" alt="公司头像"
								src="./defaultImg/ic_launcher.png">
							</td>
						</s:else>
						<td><a
							href="<%=path%>/admin/Company_getCompany.action?companyId=<s:property value="#company.companyId"/>&page=<s:property value="#request.page"/>&tage=<s:property value="#request.tage"/>&key=<s:property value="#request.key"/>">
								<s:property value="#company.companyName" /> </a></td>
						<s:if test="#company.companyStage==0">
							<td>公司还未通过审核</td>
						</s:if>
						<s:elseif test="#company.companyGrade==0">
							<td>公司还未获得评分</td>
						</s:elseif>
						<s:else>
							<td><s:property value="#company.companyGrade" />
							</td>
						</s:else>
					</tr>
				</s:iterator>
			</table>
			<div id="page">
			<s:if test="#request.page==1">
				<s:if test="10>=#request.counts">
				首页&nbsp;上一页&nbsp;第<s:property value="#request.page" />页&nbsp;下一页&nbsp;尾页
			</s:if>
				<s:else>
				首页&nbsp;上一页&nbsp;第<s:property value="#request.page" />页&nbsp;
				<a
						href="<%=path%>/admin/Company_selectAllCompany.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>&tage=<s:property value="#request.tage"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
						<a
							href="<%=path%>/admin/Company_selectAllCompany.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>&tage=<s:property value="#request.tage"/>">尾页</a>
					</s:if>
					<s:else>
						<a
							href="<%=path%>/admin/Company_selectAllCompany.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>&tage=<s:property value="#request.tage"/>">尾页</a>
					</s:else>
				</s:else>
			</s:if>
			<s:else>
				<s:if test="#request.page*10>=#request.counts">
					<a
						href="<%=path%>/admin/Company_selectAllCompany.action?page=1&key=<s:property value="#request.key"/>&tage=<s:property value="#request.tage"/>">首页</a>&nbsp;
				<a
						href="<%=path%>/admin/Company_selectAllCompany.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>&tage=<s:property value="#request.tage"/>">上一页</a>&nbsp;
				第<s:property value="#request.page" />页&nbsp;下一页&nbsp;尾页
			</s:if>
				<s:else>
					<a
						href="<%=path%>/admin/Company_selectAllCompany.action?page=1&key=<s:property value="#request.key"/>&tage=<s:property value="#request.tage"/>">首页</a>&nbsp;
				<a
						href="<%=path%>/admin/Company_selectAllCompany.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>&tage=<s:property value="#request.tage"/>">上一页</a>&nbsp;
				第<s:property value="#request.page" />页&nbsp;
				<a
						href="<%=path%>/admin/Company_selectAllCompany.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>&tage=<s:property value="#request.tage"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
						<a
							href="<%=path%>/admin/Company_selectAllCompany.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>&tage=<s:property value="#request.tage"/>">尾页</a>
					</s:if>
					<s:else>
						<a
							href="<%=path%>/admin/Company_selectAllCompany.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>&tage=<s:property value="#request.tage"/>">尾页</a>
					</s:else>
				</s:else>
			</s:else>
			</div>
		</s:if>	
		<s:else>	
		<p>没有结果</p>
		</s:else>
		
	</div>
</body>
</html>
