<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
	<LINK href="${pageContext.request.contextPath}/style/blue/statusbar.css" type=text/css rel=stylesheet>
</head>

<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>

<div id="StatusBar">
    <div id="Online">
    	在线人员：共 <span class="OnlineUser" id="onlineUserNum"></span> 人<span class="OnlineView">
        <a href="javascript:void(0)">[查看在线名单]</a>
</span></div>

    <div id="Info">
    	<a href="http://www.itcast.cn" title = "表白墙管理首页" target=_blank >表白墙管理首页</a> |
    </div>

    <DIV id=DesktopText>
        <a href="javascript:void(0)"><img border="0" src="${pageContext.request.contextPath}/style/images/top/text.gif"/> 便笺</a>

        <span id=TryoutInfo>

        </span>
        <span id="Version">
            <a href="javascript:void(0)">
            	<img border="0" width="11" height="11" src="${pageContext.request.contextPath}/style/images/top/help.gif" />
            	<img border="0" width="40" height="11" src="${pageContext.request.contextPath}/style/blue/images/top/version.gif" />
            </a>
        </span>
    </DIV>
</div>

</body>
</html>
