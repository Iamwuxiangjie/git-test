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
<link href="<%=basePath%>css/admin_company.css" type="text/css" rel="stylesheet">
</head>

<s:if test="#session.loginAdmin== null">
	<body onload="pageIndexHref('<%=basePath%>');">
</s:if>
<s:else>
	<body>
</s:else>
	<div id="admin_company">
	<table class="dataTable">
		<tr>
			<td>公司名称</td>
			<td><s:property value="#request.company.companyName" /></td>
		</tr>
		<tr>
			<td>公司地址</td>
			<td><s:property value="#request.company.companyAddress" /></td>
		</tr>
		<tr>
			<td>公司详细地址</td>
			<td><s:property value="#request.company.companyAddress2" /></td>
		</tr>
		<tr>
			<td>公司服务范围</td>
			<td><s:property value="#request.company.companyServiceScope" />
			</td>
		</tr>
		<tr>
			<td>公司服务类型</td>
			<s:if test="#request.company.company_facilitatorType==null">
				<td>
					公司尚未选择服务类型
				</td>
			</s:if>
			<s:else>
				<td>
					<s:property value="#request.company.company_facilitatorType.facilitatorTypeName" />
				</td>
			</s:else>
		</tr>
		<tr>
			<td>公司简介</td>
			<td><s:if test="#request.company.companySummary!=null">
					<s:property value="#request.company.companySummary" />
				</s:if> <s:else>
    				公司还未填写简介
    			</s:else></td>
		</tr>
		<tr>
			<td>公司执照</td>
			<s:if test="#request.company.companyLicenseImg!=null">
				<td><img alt="公司执照" width="50" height="50"
					src="<s:property value="#request.company.companyLicenseImg"/>"></td>
			</s:if>
			<s:else>
				<td>司尚未上传执照</td>
			</s:else>
		</tr>
		<s:if test="#request.company.companyStage==0">
			<tr>
				<td>操作</td>
				<td><a
					href="<%=path%>/admin/Company_companyApproved.action?page=<s:property value="#request.page"/>&tage=<s:property value="#request.tage"/>&key=<s:property value="#request.key"/>&companyId=<s:property value="#request.company.companyId"/>" onclick="javascript: return confirm('确认通过？');">
						审核通过 </a></td>
			</tr>
		</s:if>
		<s:elseif test="#request.company.companyGrade==0">
			<tr>
				<td>评分</td>
				<td>公司还未获得评分</td>
			</tr>
		</s:elseif>
		<s:else>
			<tr>
				<td>评分</td>
				<td><s:property value="#request.company.companyGrade" /></td>
			</tr>
		</s:else>
		<tr>
			<td colspan="2"><a href="<%=path%>/admin/Message_getMessageToPeople?companyId=<s:property value="#request.company.companyId" />" class="send">发送消息</a></td>
		</tr>
	</table>
	<br>

	<s:if test="#request.company.companyStage!=0">
		<h2>该公司所有服务</h2>
		<form action="<%=path%>/admin/Service_selectComAllService.action" method="get">
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="tage" value="<s:property value="#request.tage" />">
			<input type="hidden" name="companyId" value="<s:property value="#request.company.companyId" />">
			<input type="text" name="key" value="${request.key }" class="txt" placeholder="服务名称关键字" />
			<input type="submit" value="搜索" class="search" />
		</form>
		<s:if test="#request.allservice.size()<1">
    	没有服务
    	</s:if>
		<s:else>
			<table class="dataTable">
				<tr>
					<td>服务名称</td>
					<td>描述</td>
					<td>图片</td>
					<td>服务价格</td>
					<td>单位</td>
					<td>服务类型</td>
					<td>评分</td>
					<td>状态</td>
					<td>操作</td>
				</tr>
				<s:iterator value="#request.allservice" var="ser">
					<tr>
						<td><s:property value="#ser.serviceName" /></td>

						<s:if test="#ser.serviceExplain==null">
							<td>暂无简介</td>
						</s:if>
						<s:else>
							<td><s:property value="#ser.serviceExplain" /></td>
						</s:else>

						<s:if test="#ser.serviceImg==null">
							<td>暂无图片</td>
						</s:if>
						<s:else>
							<td><img width="50" height="50" alt="服务图片"
								src='<s:property value="#ser.serviceImg"/>'>
							</td>
						</s:else>

						<td><s:property value="#ser.serviceprice" /></td>
						<td><s:property value="#ser.service_priveunit.priveunitName" />
						</td>
						<td><s:property
								value="#ser.service_serviceType.serviceTypeName" /></td>

						<s:if test="#ser.serviceGrade==0">
							<td>暂未获得评分</td>
						</s:if>
						<s:else>
							<td><s:property value="#ser.serviceGrade" />
							</td>
						</s:else>
						
						<s:if test="#ser.serviceStage==1">
							<td>
								已上架
							</td>
						</s:if>
						<s:elseif test="#ser.serviceStage==0">
							<td>
								未上架
							</td>
						</s:elseif>
						<s:elseif test="#ser.serviceStage==2">
							<td>
								已冻结
							</td>
						</s:elseif>

						<s:if test="#ser.serviceStage==1||#ser.serviceStage==0">
							<td><a
								href="<%=path%>/admin/Service_updownService.action?serviceid=<s:property value="#ser.serviceId"/>&operand=2&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>"
								onclick="javascript: return confirm('真的要冻结吗？');" class="dong">冻结</a>
							</td>
						</s:if>
						<s:elseif test="#ser.serviceStage==2">
							<td><a
								href="<%=path%>/admin/Service_updownService.action?serviceid=<s:property value="#ser.serviceId"/>&operand=0&page=<s:property value="#request.page"/>&key=<s:property value="#request.key"/>">解冻</a>
							</td>
						</s:elseif>
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
						href="<%=path%>/admin/Service_selectComAllService.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>&companyId=<s:property value="#request.company.companyId" />&tage=<s:property value="#request.tage"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
						<a
							href="<%=path%>/admin/Service_selectComAllService.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>&companyId=<s:property value="#request.company.companyId" />&tage=<s:property value="#request.tage"/>">尾页</a>
					</s:if>
					<s:else>
						<a
							href="<%=path%>/admin/Service_selectComAllService.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>&companyId=<s:property value="#request.company.companyId" />&tage=<s:property value="#request.tage"/>">尾页</a>
					</s:else>
				</s:else>
			</s:if>
			<s:else>
				<s:if test="#request.page*10>=#request.counts">
					<a
						href="<%=path%>/admin/Service_selectComAllService.action?page=1&key=<s:property value="#request.key"/>&companyId=<s:property value="#request.company.companyId" />&tage=<s:property value="#request.tage"/>">首页</a>&nbsp;
				<a
						href="<%=path%>/admin/Service_selectComAllService.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>&companyId=<s:property value="#request.company.companyId" />&tage=<s:property value="#request.tage"/>">上一页</a>&nbsp;
				第<s:property value="#request.page" />页&nbsp;下一页&nbsp;尾页
			</s:if>
				<s:else>
					<a
						href="<%=path%>/admin/Service_selectComAllService.action?page=1&key=<s:property value="#request.key"/>&companyId=<s:property value="#request.company.companyId" />&tage=<s:property value="#request.tage"/>">首页</a>&nbsp;
				<a
						href="<%=path%>/admin/Service_selectComAllService.action?page=<s:property value="#request.page-1"/>&key=<s:property value="#request.key"/>&companyId=<s:property value="#request.company.companyId" />&tage=<s:property value="#request.tage"/>">上一页</a>&nbsp;
				第<s:property value="#request.page" />页&nbsp;
				<a
						href="<%=path%>/admin/Service_selectComAllService.action?page=<s:property value="#request.page+1"/>&key=<s:property value="#request.key"/>&companyId=<s:property value="#request.company.companyId" />&tage=<s:property value="#request.tage"/>">下一页</a>&nbsp;
				<s:if test="#request.counts%10==0">
						<a
							href="<%=path%>/admin/Service_selectComAllService.action?page=<s:property value="#request.counts/10"/>&key=<s:property value="#request.key"/>&companyId=<s:property value="#request.company.companyId" />&tage=<s:property value="#request.tage"/>">尾页</a>
					</s:if>
					<s:else>
						<a
							href="<%=path%>/admin/Service_selectComAllService.action?page=<s:property value="#request.counts/10+1"/>&key=<s:property value="#request.key"/>&companyId=<s:property value="#request.company.companyId" />&tage=<s:property value="#request.tage"/>">尾页</a>
					</s:else>
				</s:else>
			</s:else>
			</div>
		</s:else>
	</s:if>
	<s:else>
			该公司未通过审核
	</s:else>

	<a href="<%=path%>/admin/Company_getCompany.action?companyId=<s:property value="#request.company.companyId"/>&page=<s:property value="#request.page"/>&tage=<s:property value="#request.tage"/>&key=<s:property value="#request.key"/>" class="flash">刷新</a>
	<a
		href="<%=path%>/admin/Company_selectAllCompany.action?tage=<s:property value="#request.tage"/>" class="back">返回</a>
	</div>
	<script type="text/javascript">
	function pageIndexHref(h) {
		parent.location.href = h + "/admin/admin_login.jsp";
	}
	</script>
</body>
</html>
