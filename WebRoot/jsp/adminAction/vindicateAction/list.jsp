<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>表白列表</title>
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
            <tr align=center valign=middle id=TableTitle>
                <td width="100">用户名</td>
                <td width="100">真实姓名</td>
                <td width="100">表白对象</td>
                <td width="100">内容</td>
                <td width="100">浏览次数</td>
                <td width="100">回复次数</td>
                <td>是否推荐</td>
                <td width="200">相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">
        
        <s:iterator value="page.recordList" var="ri">
            <tr class="TableDetail1 template">
                <td>${ri.TUser.userName}&nbsp;</td>
                <td>${ri.TUser.realName}&nbsp;</td>
                <td>${ri.realName}&nbsp;</td>
                <td>
                ${ri.releaseContent}&nbsp;</td>
                <td>${ri.viewCount}&nbsp;</td>
                <td>${ri.commentCount}&nbsp;</td>
                <td align="center">
               		 <s:if test="isRecommand==1"><span style="color:red;">是</span></s:if>
               		 <s:else>否</s:else>
                </td>
                <td>
                <s:if test="isRecommand==1">
                	<s:a action="vindicate_returnBefore?vindicateId=%{id}" onclick="return delConfirm('确定还原此用户的表白？')"><span style="color:red;">还原</span></s:a>

                </s:if>
                <s:else>
                	<s:a action="vindicate_recommand?vindicateId=%{id}" onclick="return delConfirm('确定推荐此用户的表白？')">推荐</s:a>
                </s:else>
                <s:a action="vindicate_delete?vindicateId=%{id}" onclick="return delConfirm('确定删除此条表白？')">删除</s:a>
                <s:a action="vindicate_setBackgroundUI?vindicateId=%{id}&&background=%{background}">设置背景图片</s:a>
                </td>
            </tr>
        </s:iterator> 
            
        </tbody>
    </table>
    

</div>
<div>
	<form action="vindicate_query.action" method="post">
	用户名：<s:textfield name="userName" cssClass="InputStyle"/>
	是否可用：<select name="isRecommand">
				<option value=""></option>
				<option value="1">推荐</option>
				<option value="0">不推荐</option>
			</select>
	<input type="submit" value="查找"/>
	</form>
</div>
<!-- 分页信息 -->
<%@ include  file="/jsp/publicCode/adminPageView.jspf"%>
<s:form action="vindicate_list" id="formId"></s:form>
<br/>
<br/>
<br/>
<br/>
<div class="Description">
	说明：<br />
	1,条件查询分页--点击页数会回到列表查询，不是条件查询的结果了<br/>
	2,推荐表白将在前台主界面最上面轮播显示<br/>
	3,删除表白即将从数据库中删除掉，对应回复也将删除<br/>
</div>
</body>
</html>
