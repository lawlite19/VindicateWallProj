<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户隐私</title>
    
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
                <a href="${pageContext.request.contextPath}/jsp/userAction/privacy.jsp" class="list-group-item active">用户隐私</a>
                <a href="${pageContext.request.contextPath}/jsp/userAction/express.jsp" class="list-group-item">表白说明</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/level.jsp" class="list-group-item">用户等级说明</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/romantic.jsp" class="list-group-item">浪漫专区说明</a>
			</div>
			</div>
        </div>
        <div class="col-sm-9">
    		<div class="content_right">
    			<h3>用户隐私制度与责任</h3>
    			1、用户隐私制度<br/>
			    尊重用户个人隐私是本网站的基本政策。本网站不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的：
                <br/>1)遵守有关法律规定，遵从合法服务程序。
			    <br/>2)保持维护本网站的商标所有权。
			    <br/>3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。
			    <br/>4)符合其他相关的要求。<br/>
                2、用户责任<br/>
		        用户单独承担传输内容的责任。用户必须遵循：<br/>
		        1)从中国境内向外传输技术性资料时必须符合中国有关法规。<br/>
		        2)使用网站服务不作非法用途。<br/>
		        3)不干扰或混乱网络服务。<br/>
		        4)不在论坛BBS或留言簿发表任何与政治相关的信息。<br/>
		        5)遵守所有使用网站服务的网络协议、规定、程序和惯例。<br/>
		        6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。<br/>
		        7)不得利用本站制作、复制和传播下列信息：<br/>
		        1、煽动抗拒、破坏宪法和法律、行政法规实施的；<br/>
		        2、煽动颠覆国家政权，推翻社会主义制度的；<br/>
				3、煽动分裂国家、破坏国家统一的；<br/>
				4、煽动民族仇恨、民族歧视，破坏民族团结的；<br/>
				5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；<br/>
				6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；<br/>
				7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；<br/>
				8、损害国家机关信誉的；<br/>
				9、其他违反宪法和法律行政法规的；<br/>
   			</div>
        </div>
      </div>
        <br/><br/><br/><br/><br/> <br/><br/> <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <!--底部--> 
     <%@ include file="/jsp/publicCode/bottom.jspf" %>
  </body>
</html>
