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
  <form action="sysInfo_addInfo" method="post" id="formId0">
    	<div style="padding-left:120px;">系统消息内容：<br/>
    	<textarea rows="20" cols="40" name="sysInfo.msgContent"></textarea><br/>
    	<input type="submit" value="提交"/>
    	</div>
    </form>
  </body>
</html>
