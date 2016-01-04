<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>关于我们</title>
    
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
				<a href="${pageContext.request.contextPath}/jsp/userAction/about.jsp" class="list-group-item active">关于我们</a>
        		<a href="${pageContext.request.contextPath}/jsp/userAction/contact.jsp" class="list-group-item">联系我们</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/disclaimer.jsp" class="list-group-item">注册条款</a>
                <a href="${pageContext.request.contextPath}/jsp/userAction/privacy.jsp" class="list-group-item">用户隐私</a>
                <a href="${pageContext.request.contextPath}/jsp/userAction/express.jsp" class="list-group-item">表白说明</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/level.jsp" class="list-group-item">用户等级说明</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/romantic.jsp" class="list-group-item">浪漫专区说明</a>
			</div>
			</div>
        </div>
        
        <div class="col-sm-9">
    		<div class="content_right">
    			<h3>关于我们</h3>
    			  本网站通过互联网为用户提供表白17素材网站是致力于网页前端开发用户的一个下载资源交流平台网站。在这里您可以找到时下最流行、最新进的网页前端脚本代码和网
          页设计图片素材。且融入了目前最流行微博客社交功能，您可以在这找到与您一
          起的同行工作者。您可以在这里发布您自己的代码和图片等素材，与别人分享。同时您也可以查阅别人采集发布的内容，或看看热门推荐采集等。
   			</div>
        </div>
      </div>
      <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <!--底部--> 
     <%@ include file="/jsp/publicCode/bottom.jspf" %>
  </body>
</html>
