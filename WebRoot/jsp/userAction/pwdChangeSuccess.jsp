<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta http-equiv="Refresh" content="5;url=${pageContext.request.contextPath}/index.jsp">
	<title>密码修改成功</title>
	<%@ include file="/jsp/publicCode/commons.jspf" %>
	<style type="text/css">
		body{
		padding-top:150px;
		}
	</style>
  </head>
  <body>
  	<%@ include file="/jsp/publicCode/top.jspf" %>
    <div class="container">
    	<div class="row">
  			<div class="col-sm-2"></div>
  			<div class="col-sm-8">
  				<h3>密码修改成功！
  				<br/>
  				5秒后界面将自动跳转，若您的浏览器不自动跳转，<a href="${pageContext.request.contextPath}/index.jsp" style="color:blue;">请点击跳转</a>
  				</h3>
  			</div>
  			<div class="col-sm-2"></div>
		</div>
    </div>
  </body>
</html>
