<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hhit.entity.TReleasecontent" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>我的表白</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="/jsp/publicCode/commons.jspf" %>
		<style type="text/css">
		body{
			padding-top:100px;
		}
	</style>
  </head>
  
  <body>
    <%@ include file="/jsp/publicCode/top.jspf" %>
    <div class="container">
    	<div class="row">
			<!-- 左侧列表 -->
  			<div class="col-sm-3">
  			<div class="list-group">
  				<a href="${pageContext.request.contextPath}/jsp/userAction/personalInfoIndex.jsp" class="list-group-item">
   				 &nbsp;<strong>个人信息</strong>
   				 </a>
  				<a href="releaseInfo!queryMyVindication.action" class="list-group-item active">&nbsp;<strong>我的表白</strong></a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/vindicate.jsp" class="list-group-item">&nbsp;<strong>表白一下</strong></a>
  				<a href="releaseInfo!toMyMessageUI.action" class="list-group-item">&nbsp;<strong>我的消息</strong></a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/modifyPwd.jsp" class="list-group-item">&nbsp;<strong>修改密码</strong></a>
			</div>
  			</div>
  			<!-- 右侧列表 -->
  			<div class="col-sm-9">
<!-- 我的表白信息开始 -->
<section class="panel"> 
				<table class="table table-striped table-advance table-hover">
					<tbody>
						<tr>
							<th><i class="glyphicon glyphicon-th-list"></i> 序号</th>
							<th><i class="glyphicon glyphicon-pencil"></i> 内容</th>
							<th><i class="glyphicon glyphicon-user"></i> 对象</th>
							<th><i class="glyphicon glyphicon-calendar"></i> 时间</th>
							<th><i class="glyphicon glyphicon-eye-open"></i> 浏览次数</th>
							<th><i class="glyphicon glyphicon-heart"></i> 评论次数</th>
							<th><i class="glyphicon glyphicon-wrench"></i>操作</th>
						</tr>
<c:forEach items="${page.recordList}" var="ri" varStatus="st">
	<tr>
		<td align="center">${st.count}</td>
		<td>
			<a href="replay!toReplayUI.action?releaseInfoId=${ri.id}">
				<p style="width:100px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">${ri.releaseContent}</p>
			</a>
		</td>
		<td align="center">${ri.realName}</td>
		<td align="center">${ri.releaseTime}</td>
		<td align="center">${ri.viewCount}</td>
		<td align="center">${ri.commentCount}</td>
		<td align="center">
			<div class="btn-group">
				<a class="btn btn-primary" href="replay!toReplayUI.action?releaseInfoId=${ri.id}"> 
					<i class="glyphicon glyphicon-ok-sign"></i></a> 
				<a class="btn btn-danger" href="releaseInfo!deleteMyVin.action?releaseInfoId=${ri.id}"
						onclick="return confirm('确定要删除此表白內容吗？')">
					<i class="glyphicon glyphicon-trash"></i>
				</a>
			</div>
		</td>
	</tr>
</c:forEach>
						

					</tbody>
				</table>
				</section>

	
<!-- 我的表白信息结束 -->

				
			</div>
		</div>
    </div>
    <!-- 分页开始 -->
	<form action="releaseInfo!queryMyVindication.action" method="post" id="formId">
	</form>
	<%@ include file="/jsp/publicCode/pageView.jspf" %>
<!-- 分页结束 -->
    <br/><br/><br/><br/>
    <%@ include file="/jsp/publicCode/bottom.jspf" %>
  </body>
</html>
