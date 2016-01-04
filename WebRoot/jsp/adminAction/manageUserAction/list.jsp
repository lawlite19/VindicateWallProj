<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>用户列表</title>
    <%@ include file="/jsp/publicCode/adminCommons.jspf" %>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head"> 
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 用户管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align="center" valign="middle" id="TableTitle">
                <td width="100">登录名</td>
                <td width="100">用户类型</td>
                <td>相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">
        
        <s:iterator value="userList">
            <tr class="TableDetail1 template">
                <td>${userName}&nbsp;</td>
                <td>${userType}&nbsp;</td>
                <td>
                	<s:a action="manageUser_delete?id=%{id}" onclick="return delConfirm('确定禁用此用户？')">删除&nbsp;</s:a>
                    <s:a action="manageUser_editUI?id=%{id}">修改&nbsp;</s:a>
                    <s:a action="manageUser_initPassword?id=%{id}" onclick="return window.confirm('您确定要初始化密码为12345qwe吗？')">初始化密码&nbsp;</s:a>
                </td>
            </tr>
        </s:iterator> 
            
        </tbody>
    </table>
        <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
            <s:a action="manageUser_addUI"><img src="${pageContext.request.contextPath}/style/images/createNew.png" /></s:a>
        </div>
    </div>

</div>
<br/>
<br/>
<br/>
<br/>

<div class="Description">
	说明：<br />
	1,初始化密码为12345qwe<br/>
</div>

</body>
</html>
