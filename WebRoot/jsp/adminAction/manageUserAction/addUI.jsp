<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'saveUI.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@include file="/jsp/publicCode/adminCommons.jspf" %>
  </head>
  
  <body>
  <form action="manageUser_addUser" method="post" id="formId0">
    	用户名：<input name="manageUser.userName" id="userName"/><br/>
   		 密码：<input type="password" name="manageUser.password" id="password"/><br/>
   		 确认密码：<input type="password" name="confirmPassword" id="confirmPassword"/><br/>
   		 <input type="button" value="添加用户" id="sub" onclick="check()"/>
    </form>
  </body>
    <script type="text/javascript">
  		function check(){
  			if($("#password").val()!=$("#confirmPassword").val()){
  				alert("两次密码输入不一致！");
  				return;
  			}
  				
  			$("#formId0").submit();
  		}
  </script>
</html>
