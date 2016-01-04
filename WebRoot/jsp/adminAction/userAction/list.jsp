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
                <td width="100">姓名</td>
                <td width="100">性别</td>
                <td width="100">出生日期</td>
                <td>是否禁用</td>
                <td>相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">
        
        <s:iterator value="page.recordList">
            <tr class="TableDetail1 template">
                <td>${userName}&nbsp;</td>
                <td>${realName}&nbsp;</td>
                <td>${sex}&nbsp;</td>
                <td>${birthday}&nbsp;</td>
                <td align="center">
               		 <s:if test="isUsable==1">否</s:if>
               		 <s:if test="isUsable==0"><span style="color:red;">是</span></s:if>
                </td>
                <td>
                <s:if test="isUsable==1">
                	<s:a action="user_delete?userId=%{id}" onclick="return delConfirm('确定禁用此用户？')">禁用</s:a>
                </s:if>
                <s:if test="isUsable==0">
                	<s:a action="user_returnBefore?userId=%{id}" onclick="return delConfirm('确定还原此用户？')"><span style="color:red;">还原</span></s:a>
                </s:if>
                    <s:a action="user_editUI?userId=%{id}">修改</s:a>
                </td>
            </tr>
        </s:iterator> 
            
        </tbody>
    </table>
    

</div>
<div>
	<form action="user_query.action" method="post">
	用户名：<s:textfield name="userName" cssClass="InputStyle"/>
	真实姓名：<s:textfield name="realName" cssClass="InputStyle"/>
	是否可用：<select name="isUsable">
				<option value=""></option>
				<option value="1">可用</option>
				<option value="0">不可用</option>
			</select>
	<input type="submit" value="查找"/>
	</form>
</div>
<!-- 分页信息 -->
<%@ include  file="/jsp/publicCode/adminPageView.jspf"%>
<s:form action="user_list" id="formId"></s:form>
<br/>
<br/>
<br/>
<br/>
1,前台用户禁用之后该用户将不能登录
<div class="Description">
	说明：<br />
	1,条件查询分页--点击页数会回到列表查询，不是条件查询的结果了<br/>
</div>

</body>
</html>
