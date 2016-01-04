<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.hhit.entity.TDailyvindicate"%>
<html>
<head>
	<title>每日表白设置</title>
    <%@ include file="/jsp/publicCode/adminCommons.jspf" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/bootstrap.min.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/common/My97DatePicker/WdatePicker.js"></script>
 
	<script language="javascript" src="${pageContext.request.contextPath}/fckeditor/fckeditor.js" charset="utf-8"></script>
	    <script type="text/javascript">
		$(function(){
			var fck = new FCKeditor("dailyVin.content");
			fck.Width = "100%";
			fck.Height = "80%";
			fck.ToolbarSet = "admin";
			fck.BasePath = "${pageContext.request.contextPath}/fckeditor/";
			fck.ReplaceTextarea();
		});
    </script>
</head>
<body> 

<!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 每日表白设置
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id="MainArea">

    <form action="adminDailyVin_${ dailyVin.id == null ? 'add' : 'edit'}" class="form-horizontal" method="post">
    	<input type="hidden" name="dailyVin.id" value="${dailyVin.id}"/>
        <div class="ItemBlock_Title1"><!-- 信息说明<DIV CLASS="ItemBlock_Title1">
        	<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 岗位信息 </DIV>  -->
        </div>
   <div class="form-group">
    <label for="releaseDate" class="col-sm-2 control-label">要显示的日期</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="dailyVin.releaseDate" value="${dailyVin.releaseDate}" onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',})" id="releaseDate" placeholder="要显示的日期    *必填">
    </div>
    </div>
        <div class="form-group">
    <label for="userName" class="col-sm-2 control-label">表白者</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="dailyVin.vindicator" value="${dailyVin.vindicator}" id="userName" placeholder="表白者姓名   *必填">
    </div>
  </div>
  <div class="form-group">
    <label for="realName" class="col-sm-2 control-label">男生姓名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="dailyVin.boyName" value="${dailyVin.boyName}"  id="realName" placeholder="男生姓名     （选填    男生女生填写表白的那位）">
    </div>
  </div>
  <div class="form-group">
    <label for="realNames" class="col-sm-2 control-label">女生姓名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="dailyVin.girlName"  value="${dailyVin.girlName}"  id="realNames" placeholder="女生姓名   （选填    男生女生填写表白的那位）">
    </div>
  </div>

  <div class="form-group">
    <label for="year" class="col-sm-2 control-label">年</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="dailyVin.year" value="${dailyVin.year}" id="year" placeholder="相恋年份      （选填）">
    </div>
        <label for="month" class="col-sm-2 control-label">月</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="dailyVin.month" value="${dailyVin.month}" id="month" placeholder="相恋月份     （选填）">
    </div>
        <label for="day" class="col-sm-2 control-label">日</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="dailyVin.day" value="${dailyVin.day}" id="day" placeholder="相恋日期   （选填）" >
    </div>
  </div>
  <div class="form-group">
    <label for="cpmmets" class="col-sm-2 control-label">注释</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="cpmmets" name="dailyVin.comments" value="${dailyVin.comments}" placeholder="显示的一行说明注释    （选填）" >
    </div>
  </div>
  <div class="form-group">
    <label for="qq" class="col-sm-2 control-label">表白内容</label>
    <div class="col-sm-10">
      <textarea name="dailyVin.content" class="TextareaStyle">${dailyVin.content}</textarea>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default btn-primary"  id="subdaily">提交</button>
    </div>
  </div>
    </form>
</div>
<br/><br/>
<div class="Description">
	说明：<br />
	1,根据提示填写信息<br/>
	2,注意内容的排版，还有可以查看一下源码，注意去掉无用的标记<br/><br/>
</div>
</body>
</html>

