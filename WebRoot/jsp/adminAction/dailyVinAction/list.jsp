<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>每日表白列表</title>
    <%@ include file="/jsp/publicCode/adminCommons.jspf" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/My97DatePicker/WdatePicker.js"></script>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head"> 
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 每日表白管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
                <td width="100">表白者</td>
                <td width="100">男生</td>
                <td width="100">女生</td>
                <td width="100">内容</td>
                <td width="100">注释</td>
                <td>日期</td>
                <td width="200">相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">
        
        <s:iterator value="page.recordList" var="ri">
            <tr class="TableDetail1 template">
                <td>${ri.vindicator}&nbsp;</td>
                <td>${ri.boyName}&nbsp;</td>
                <td>
                ${ri.girlName}&nbsp;</td>
                <td>${ri.content}&nbsp;</td>
                <td>${ri.comments}&nbsp;</td>
                 <td>${ri.releaseDate}&nbsp;</td>
                <td>
                <s:a action="adminDailyVin_delete?dailyVinId=%{id}" onclick="return delConfirm('删除时请注意！！！确定删除此条每日表白？')">删除</s:a>
                <s:a action="adminDailyVin_editUI?dailyVinId=%{id}">修改</s:a>
                </td>
            </tr>
        </s:iterator> 
            
        </tbody>
    </table>
    <!-- 其他功能超链接 -->
    <div id="TableTail">
		<div id="TableTail_inside">
			<s:a action="adminDailyVin_addUI"><img src="${pageContext.request.contextPath}/style/images/createNew.png" /></s:a>
        </div>
    </div>
    

</div>
<div>
	<form action="adminDailyVin_query.action" method="post">
	表白者：<s:textfield name="vindicator" cssClass="InputStyle"/>
	日期：<s:textfield name="relaseDate" cssClass="InputStyle" onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',})" id="releaseDate"/>
	<input type="submit" value="查找"/>
	</form>
</div>
<!-- 分页信息 -->
<%@ include  file="/jsp/publicCode/adminPageView.jspf"%>
<s:form action="adminDailyVin_list" id="formId"></s:form>
<br/>
<br/>
<br/>
<br/>
<div class="Description">
	说明：<br />
	1,条件查询分页--点击页数会回到列表查询，不是条件查询的结果了<br/>
	2,可以进行修改和删除，注意：不要轻易的删除！！！！！<br/><br/>
</div>
</body>
</html>
