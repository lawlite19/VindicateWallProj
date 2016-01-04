<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>我的消息</title>
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
  				<a href="releaseInfo!queryMyVindication.action" class="list-group-item">&nbsp;<strong>我的表白</strong></a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/vindicate.jsp" class="list-group-item">&nbsp;<strong>表白一下</strong></a>
  				<a href="releaseInfo!toMyMessageUI.action" class="list-group-item active">&nbsp;<strong>我的消息</strong></a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/modifyPwd.jsp" class="list-group-item">&nbsp;<strong>修改密码</strong></a>
			</div>
  			</div>
  			<!-- 右侧列表 -->
  			<div class="col-sm-9">
<!-- 我的消息列表开始 -->
		<section class="panel"> 
				<table class="table table-striped table-advance table-hover">
					<tbody>
						<tr>
							<th><i class="glyphicon glyphicon-th-list"></i> 序号</th>
							<th><i class="glyphicon glyphicon-book"></i> 消息类型</th>
							<th><i class="glyphicon glyphicon-pencil"></i> 消息内容</th>
						</tr>
	<c:forEach items="${page.recordList}" var="message" varStatus="st">
	<tr>
		<td>${st.count}</td>
		<td>
			<span style="color:red">[${message.msgType}]</span>
		</td>
		<td>
			<c:if test="${message.TReleasecontent.id!=null}">
			<a href="replay!toReplayUI.action?releaseInfoId=${message.TReleasecontent.id}">${message.msgContent}</a>
			</c:if>
			<c:if test="${message.TReleasecontent.id==null}">
				${message.msgContent}
			</c:if>
		</td>

	</tr>
	</c:forEach>
					</tbody>
				</table>
				</section>
<!-- 我的消息列表结束 -->			
</div>
		</div>
    </div>
    <form action="releaseInfo!toMyMessageUI.action" method="post" id="formId">
    </form>
    <%@ include file="/jsp/publicCode/pageView.jspf" %>
     <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <%@ include file="/jsp/publicCode/bottom.jspf" %>
  </body>
</html>
