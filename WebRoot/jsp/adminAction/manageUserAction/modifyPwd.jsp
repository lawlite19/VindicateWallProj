<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>密码修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="/jsp/publicCode/adminCommons.jspf" %>

  </head>
  
  <body>
<div>
	<form action="manageUser_modifyPwd.action" method="post" id="formId0">
	&nbsp;新密码：<input type="password" name="password" id="password" Class="InputStyle"/><br/><br/>
	确认密码：<input type="password" name="confirmPassword" id="confirmPassword" Class="InputStyle"/><br/><br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="修改" id="sub" onclick="check()"/>
	</form>
</div>
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
