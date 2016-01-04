<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>设置表白的背景图</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@include file="/jsp/publicCode/commons.jspf" %>
  </head>
  		
  <body>
  
  	<div class="container">
    	<div class="row">
    	<form action="vindicate_setBackground" method="post">
    	<input type="hidden" name="vindicateId" value="${vindicateId}"/>
    	<c:forEach begin="0" end="10" var="i">
  			<div class="col-md-4">
  				<c:if test="${background==i}">
  					<input checked="checked" type="radio"  name="background" id="background" value="${i}"/>选择<br/>
  				</c:if>
  				<c:if test="${background!=i}">
  					<input type="radio"  name="background" id="background" value="${i}"/>选择<br/>
  				</c:if>
  				<img alt="" src="${pageContext.request.contextPath}/style/images/center/${i}.gif" style="margin:5px 5px 5px 20px;min-height:200px;max-height:200px;width:200px;border-radius: 5px;">
  				<hr/>
  			</div>
  		</c:forEach>
  		<button type="submit" class="btn btn-default btn-success btn-block">设置</button>
  		<br/>
  		<br/>
  		<br/>
  		</form>
		</div>
    </div>
  </body>
</html>
