<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
   <title>表白说明</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="表白墙" content="说出你的爱">
	<%@ include file="/jsp/publicCode/commons.jspf" %>
	<style type="text/css">
	body{
	padding-top:100px;
	</style>

  </head>
  
  <body>
  <!-- 网页头部 -->
    <%@ include file="/jsp/publicCode/top.jspf"%>
    <div class="content">
        <!--列表信息-->
        <div class="col-sm-3">
     		<div class="list-group">
     		<div class="list-group">
				<a href="${pageContext.request.contextPath}/jsp/userAction/about.jsp" class="list-group-item">关于我们</a>
        		<a href="${pageContext.request.contextPath}/jsp/userAction/contact.jsp" class="list-group-item">联系我们</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/disclaimer.jsp" class="list-group-item">注册条款</a>
                <a href="${pageContext.request.contextPath}/jsp/userAction/privacy.jsp" class="list-group-item">用户隐私</a>
                <a href="${pageContext.request.contextPath}/jsp/userAction/express.jsp" class="list-group-item active">表白说明</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/level.jsp" class="list-group-item">用户等级说明</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/romantic.jsp" class="list-group-item">浪漫专区说明</a>
			</div>
			</div>
        </div>
        </div>
<div class="col-sm-9">
    		<div class="content_right">
    			<h3>表白说明</h3><br/>
    			<h5>&nbsp;&nbsp;&nbsp;&nbsp;1.表白内容限制在100字以内，若是发表与表白无关的内容会被管理员删除。<br/><br/>
                &nbsp;&nbsp;&nbsp;&nbsp;2.表白浏览的次数或是评论的次数超过一定值后可能会显示在主页的轮播位置显示，更好的被别人注意到。<br/><br/>
                &nbsp;&nbsp;&nbsp;&nbsp;3.表白的回复消息若有违规会被管理员删除。<br/><br/>
                &nbsp;&nbsp;&nbsp;&nbsp;4.填写真实姓名后若有可能关于您的表白的消息会对您进行提示。或看看热门推荐采集等。<br/><br/></h5>
   			</div>
        </div>
          <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <!--底部--> 
     <%@ include file="/jsp/publicCode/bottom.jspf" %>
  </body>
</html>
