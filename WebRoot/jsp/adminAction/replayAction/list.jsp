<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>回复列表</title>
    
    <%@ include file="/jsp/publicCode/adminCommons.jspf" %>
    <%@ include file="/jsp/publicCode/commons.jspf" %>
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
                <td width="100">回复者用户名</td>
                <td width="100">回复者真实姓名</td>
                <td width="100">楼主表白内容</td>
                <td width="200">回复标题</td>
                <td width="200">回复内容</td>
                <td>是否删除</td>
                <td>相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">
        
        <s:iterator value="page.recordList" var="ri">
            <tr class="TableDetail1 template">
                <td>${ri.TUser.userName}&nbsp;</td>
                <td>${ri.TUser.realName}&nbsp;</td>
                <td>
                <p style="width:100px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">
                <a href="javascript:Dialog('${ri.TReleasecontent.releaseContent}',0)" >${ri.TReleasecontent.releaseContent}
                </a></p>
                </td>
                <td>${ri.title}&nbsp;</td>
                <td>
                <a href="javascript:Dialog('${ri.content}',0)">
                <p style="width:100px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis">
               		 ${ri.content}
               	</p></a>
                </td>
                <td align="center">
               		 <s:if test="isDelete==1"><span style="color:red;">是</span></s:if>
               		 <s:else>否</s:else>
                </td>
                <td>
                <s:if test="isDelete==1">
                	<s:a action="adminReplay_returnBefore?replayId=%{id}" onclick="return delConfirm('确定还原此回复？')"><span style="color:red;">还原</span></s:a>

                </s:if>
                <s:else>
                	<s:a action="adminReplay_delete?replayId=%{id}" onclick="return delConfirm('确定推荐此用户的表白？')">删除</s:a>
                </s:else>
                
                </td>
            </tr>
        </s:iterator> 
            
        </tbody>
    </table>
    

</div>
<div>
	<form action="adminReplay_query.action" method="post">
	是否删除：<select name="isDelete">
				<option value=""></option>
				<option value="1">删除</option>
				<option value="0">没有删除</option>
			</select>
	<input type="submit" value="查找"/>
	</form>
</div>
<!-- 分页信息 -->
<%@ include  file="/jsp/publicCode/adminPageView.jspf"%>
<s:form action="adminReplay_list" id="formId"></s:form>

<!-- 弹出提示的模态框开始 -->
<!-- Modal -->
<div class="modal fade" id="noteModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">详细信息</h4>
      </div>
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
<!-- 弹出提示对话框结束 -->
<br/>
<br/>
<br/>
<br/>

<div class="Description">
	说明：<br />
	1,前台用户禁用之后该用户将不能登录
	2,删除回复是将数据库IsDelete字段置为1，不是真正的删除<br/>
</div>
</body>
</html>
