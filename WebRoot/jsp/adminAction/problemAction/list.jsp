<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>网站问题列表</title>
    <%@ include file="/jsp/publicCode/adminCommons.jspf" %>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head"> 
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 问题管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
                <td width="100">用户邮箱</td>
                <td width="100">问题内容</td>
                <td width="100">提交时间</td>
                <td width="100">是否解决</td>
                <td width="100">是否有用</td>
                <td width="200">相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">
        
        <s:iterator value="page.recordList">
            <tr class="TableDetail1 template">
                <td>${email}&nbsp;</td>
                <td>${description}&nbsp;</td>
                <td>
                ${subTime}&nbsp;</td>
                <td>
                <s:if test='isSolve=="是"'><span style="color:red;">是</span></s:if>
				<s:else>否</s:else>
                </td>
                <td>
                 <s:if test='isUsable=="是"'><span style="color:red;">有用</span></s:if>
                 <s:else>木有用</s:else>
                </td>
                <td>
                <s:if test='isSolve=="是"'>
                	<s:a action="adminProblem_isUnsolved?id=%{id}" onclick="return delConfirm('确定将问题置为未解决？')"><span style="color:red;">置为未解决</span></s:a>

                </s:if>
                <s:else>
                	<s:a action="adminProblem_isSolved?id=%{id}" onclick="return delConfirm('确定将问题置为已解决？')">置为解决</s:a>
                </s:else>
                <s:a action="adminProblem_delete?id=%{id}" onclick="return delConfirm('确定删除此条问题？')">删除</s:a>
                
               <s:if test='isUsable=="是"'>
                	<s:a action="adminProblem_isUseLess?id=%{id}" onclick="return delConfirm('确定将问题置为无用？')"><span style="color:red;">置为无用</span></s:a>

                </s:if>
                <s:else>
                	<s:a action="adminProblem_isUseful?id=%{id}" onclick="return delConfirm('确定将问题置为有用？')">置为有用</s:a>
                </s:else>
                </td>
            </tr>
        </s:iterator> 
            
        </tbody>
    </table>
    

</div>
<div>
	<form action="adminProblem_query.action" method="post">
	时间段：<s:textfield name="userName" cssClass="InputStyle"/>
	是否解决：<select name="isSolve">
				<option value=""></option>
				<option value="是">已解决</option>
				<option value="否">未解决</option>
			</select>
	是否有用：<select name="isUsable">
				<option value=""></option>
				<option value="是">有用</option>
				<option value="否">无用</option>
			</select>
	<input type="submit" value="查找"/>
	</form>
</div>
<!-- 分页信息 -->
<%@ include  file="/jsp/publicCode/adminPageView.jspf"%>
<s:form action="adminProblem_list" id="formId"></s:form>
<br/>
<br/>
<br/>
<br/>
<div class="Description">
	说明：<br />
	1,条件查询分页--点击页数会回到列表查询，不是条件查询的结果了<br/>
	2,管理员可以将网站为题置为有用和无用，方便观看<br/>
</div>
</body>
</html>
