<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>联系我们</title>
    
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
        		<a href="${pageContext.request.contextPath}/jsp/userAction/contact.jsp" class="list-group-item active">联系我们</a>
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
    			<h3>联系我们</h3>
    			&nbsp;&nbsp;&nbsp;&nbsp;1.qq:<a target="_blank" href="http://sighttp.qq.com/authd?IDKEY=62c08a4b18d21683cd1cd2a91af2c780699403486bfe37fa"><img border="0" src="http://wpa.qq.com/imgd?IDKEY=62c08a4b18d21683cd1cd2a91af2c780699403486bfe37fa&pic=51" alt="点击这里给我发消息" title="点击这里给我发消息"></a><br/><br/>
    			&nbsp;&nbsp;&nbsp;&nbsp;2.新浪微博:<a href="http://weibo.com/5551832260/profile">http://weibo.com/5551832260/profile</a><br/><br/>
    			&nbsp;&nbsp;&nbsp;&nbsp;3.邮箱:bravetoloveyou@qq.com<br/><br/>
    			&nbsp;&nbsp;&nbsp;&nbsp;4.若遇到问题可以在网站首页发送您的问题。<br/>
   			</div>
        </div>
      </div>
            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <!--底部--> 
     <%@ include file="/jsp/publicCode/bottom.jspf" %>

  </body>
</html>
