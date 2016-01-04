<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>系统消息列表</title>
    <%@ include file="/jsp/publicCode/adminCommons.jspf" %>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head"> 
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 系统消息管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align="center" valign="middle" id="TableTitle">
                <td width="100">消息内容</td>
                <td width="100">发布时间</td>
                <td>相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">
        
        <s:iterator value="systemInfo">
            <tr class="TableDetail1 template">
                <td>${msgContent}&nbsp;</td>
                <td>${postTime}&nbsp;</td>
                <td>
                	<s:a action="sysInfo_delete?id=%{id}">删除</s:a>
                    <s:a action="sysInfo_editUI?id=%{id}">修改</s:a>
                </td>
            </tr>
        </s:iterator> 
            
        </tbody>
    </table>
            <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
            <s:a action="sysInfo_addUI"><img src="${pageContext.request.contextPath}/style/images/createNew.png" /></s:a>
        </div>
    </div>

</div>

<br/>
<br/>
<br/>
<br/>
<div class="Description">
	说明：<br />
	1，系统消息不要随意操作！！！特别是删除操作
	2，系统消息没有分页，建议总数量不要超过10条<br/>
</div>

</body>
</html>
