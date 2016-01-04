<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
   <meta http-equiv="Refresh" content="5;url=${pageContext.request.contextPath}/index.jsp">
  	<title>注册成功</title>
  	<%@ include file="/jsp/publicCode/commons.jspf" %>
	<style type="text/css">
		body{
		padding-top:150px;
		}
		a{
		color:blue;
		}
	</style>
  </head>
  	
  <body>
  	<%@ include file="/jsp/publicCode/top.jspf" %>
  	<div class="container">
    	<div class="row">
  			<div class="col-sm-2"></div>
  			<div class="col-sm-8">
  				<h3>感谢您的注册，现在即将跳转到登录界面<a href="http://www.bravetolove.com/jsp/userAction/mlogin!enterPersonalInfo.action">现在去完善资料</a>，<a href="${pageContext.request.contextPath}/index.jsp">先去逛逛</a>
  				<br/>
				<br/>
  				如果您的浏览器没有自动跳转，请点击此链接<a href="${pageContext.request.contextPath}/index.jsp">请点击跳转</a>
  				</h3>
  			</div>
  			<div class="col-sm-2"></div>
		</div>
    </div>
  </body>
</html>
