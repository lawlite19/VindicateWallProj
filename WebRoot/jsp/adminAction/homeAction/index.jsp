<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>表白墙管理系统</title>
	<%@ include file="/jsp/publicCode/adminCommons.jspf"%>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery_treeview/jquery.treeview.js"></script>
</head>

	<frameset rows="100,*,25" framespacing="0" border="0" frameborder="0">
		<frame noresize name="TopMenu" scrolling="no" src="${pageContext.request.contextPath}/home_top.action">
		<frameset cols="180,*" id="resize">
			<frame noresize name="menu" scrolling="yes" src="${pageContext.request.contextPath}/home_left.action">
			<frame noresize name="right" scrolling="yes" src="${pageContext.request.contextPath}/home_right.action">
		</frameset>
		<frame noresize name="status_bar" scrolling="no" src="${pageContext.request.contextPath}/home_bottom.action">
	</frameset>
	<noframes><body>
</body>
</noframes></html>
