<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册条款</title>
    
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
        <!--列表信息-->
        <div class="col-sm-3">
     		<div class="list-group">
     		<div class="list-group">
				<a href="${pageContext.request.contextPath}/jsp/userAction/about.jsp" class="list-group-item">关于我们</a>
        		<a href="${pageContext.request.contextPath}/jsp/userAction/contact.jsp" class="list-group-item">联系我们</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/disclaimer.jsp" class="list-group-item active">注册条款</a>
                <a href="${pageContext.request.contextPath}/jsp/userAction/privacy.jsp" class="list-group-item">用户隐私</a>
                <a href="${pageContext.request.contextPath}/jsp/userAction/express.jsp" class="list-group-item">表白说明</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/level.jsp" class="list-group-item">用户等级说明</a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/romantic.jsp" class="list-group-item">浪漫专区说明</a>
			</div>
			</div>
        </div>
        <div class="col-sm-9">
    		<div class="content_right">
    			<h3>注册条款</h3>
                1、服务条款的确认和接纳<br/>
			www.bravetolove.com(以下简称本网站)用户服务的所有权和运作权归本网站拥有。本网站所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“同意条款并注册”按钮，即表示用户与本网站达成协议并接受所有的服务条款。
		<br/>
		2、本网站服务简介<br/>
			本网站通过互联网为用户提供表白、文章浏览、网上留言、等服务。   
		<br/> 
		3、服务条款的修改<br/>
			根据国家法律法规变化及网站运营需要，本网站有权对本协议条款不时地进行修改，修改后的协议一旦被张贴在本站上即生效，并代替原来的协议。用户可随时登陆查阅最新协议；用户有义务不时关注并阅读最新版的协议。如用户不同意更新后的协议，可以且应立即停止接受本站依据本协议提供的服务；如用户继续使用本网站提供的服务的，即视为同意更新后的协议。如果本协议中任何一条被视为废止、无效或因任何理由不可执行，该条应视为可分的且并不影响任何其余条款的有效性和可执行性。  
        <br/>
        4、服务修订<br/>
			本网站保留随时修改或中断服务而不需知照用户的权利。本网站行使修改或中断服务的权利，不需对用户或第三方负责。<br/>
		5、用户的帐号，密码和安全性<br/>
			一旦注册成功成为本网站用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知本网站。
		6、免责条款<br/>
			用户明确同意网站服务的使用由用户个人承担风险。本网站不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过本网站服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。
     	<br/>
		7、进行商业广告行为的。<br/>
		用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，本网站将取消用户服务帐号。<br/>
		8、解释权<br/>
		本条款的解释权归本网站所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。
   			</div>
        </div>
         <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <!--底部--> 
     <%@ include file="/jsp/publicCode/bottom.jspf" %>
  </body>
</html>
