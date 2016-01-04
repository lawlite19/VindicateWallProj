<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  	<title>浪漫专区说明</title>
    
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
				<a href="${pageContext.request.contextPath}/jsp/userAction/about.jsp" class="list-group-item">关于我们</a>
        		<a href="${pageContext.request.contextPath}/jsp/userAction/contact.jsp" class="list-group-item">联系我们</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/disclaimer.jsp" class="list-group-item">注册条款</a>
                <a href="${pageContext.request.contextPath}/jsp/userAction/privacy.jsp" class="list-group-item">用户隐私</a>
                <a href="${pageContext.request.contextPath}/jsp/userAction/express.jsp" class="list-group-item">表白说明</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/level.jsp" class="list-group-item">用户等级说明</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/romantic.jsp" class="list-group-item active">浪漫专区说明</a>
			</div>
        </div>
         <div class="col-sm-9">
    		<div class="content_right">
    			<h3>浪漫专区说明</h3><br/>
    			&nbsp;&nbsp;&nbsp;&nbsp; 您若想在浪漫专区表白请将表白的内容发送到bravetoloveyou@qq.com邮箱，我们会对您的内容进行审核，通过后会在浪漫专区进行显示。<br/>
   			</div>
        </div>
      </div>
               <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
         <!--底部--> 
     <%@ include file="/jsp/publicCode/bottom.jspf" %>
  </body>
</html>
