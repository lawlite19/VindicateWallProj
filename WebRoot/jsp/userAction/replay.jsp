<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>回复列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="表白墙" content="说出你的爱">
	<%@ include file="/jsp/publicCode/commons.jspf" %>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/pageCommon.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/forum.css" />
	<script language="javascript" src="${pageContext.request.contextPath}/fckeditor/fckeditor.js" charset="utf-8"></script>
    <script type="text/javascript">
		$(function(){
			var fck = new FCKeditor("replayQuick.content");
			fck.Width = "90%";
			fck.ToolbarSet = "bbs";
			fck.BasePath = "${pageContext.request.contextPath}/fckeditor/";
			fck.ReplaceTextarea();
		});
    </script>
    <style type="text/css">
    body{
		padding-top:60px;
    }
    </style>
    <script>
    //回到顶部
	function goTop(){
		$('html,body').animate({'scrollTop':0},500);
	}
</script>
  </head>
  
  <body>
    <%@include file="/jsp/publicCode/top.jspf" %>
    <!-- 显示列表开始 -->
     <div class="container">
    	<div class="row">
  			<div class="col-sm-1"></div>
  			<div class="col-sm-10">
<!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 查看主题
        </div>
        <div id="Title_End"></div>
    </div>
</div>
<!--内容显示-->	
<div id="MainArea">
	<div id="PageHead"></div>
	<center>
		<div class="ItemBlock_Title1" style="width: 98%">
			<font class="MenuPoint"> &gt; </font>
			<s:a action="forum_list">论坛</s:a>
			<font class="MenuPoint"> &gt; </font>
			表白阅读
		</div>

		<div class="ForumPageTableBorder dataContainer" datakey="replyList">

			<!-- ~~~~~~~~~~~~~~~ 显示主帖（主帖只在第1页显示） ~~~~~~~~~~~~~~~ -->
			<c:if test="${page.currentPage==1}">
			<div class="ListArea">
				<table border="0" cellpadding="0" cellspacing="1" width="100%">
					<tr>
						<td rowspan="3" width="130" class="PhotoArea" align="center" valign="top">
							<!--作者头像-->
							<div class="AuthorPhoto">
								<img border="0" width="110" height="110" src="${pageContext.request.contextPath}/style/images/defaultAvatar.gif" 
									onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/style/images/defaultAvatar.gif';" />
							</div>
							<!--作者名称-->
							<div class="AuthorName">${releaseInfo.TUser.userName}</div>
						</td>
						<td align="center">
							<ul class="TopicFunc">
							<li class="TopicFuncLi">
							<!-- JiaThis Button BEGIN -->
								<div class="detail">
									<a class="jiathis_like_tsinat" data="width=320"></a>
								</div>

							<!-- JiaThis Button END --></li>
								<c:if test="${user.id==1}">
								<!--操作列表-->
								<li class="TopicFuncLi">
									<a class="detail" href="${pageContext.request.contextPath}/BBS_Topic/saveUI.html"><img border="0" src="${pageContext.request.contextPath}/style/images/edit.gif" />编辑</a>
									<a class="detail" href="replay!deleteReleaseInfo.action?releaseInfoId=${releaseInfoId}" onClick="return confirm('确定要删除本帖吗？')"><img border="0" src="${pageContext.request.contextPath}/style/images/delete.gif" />删除</a>
								</li>
								</c:if>
								<!-- 文章的标题 -->
								<li class="TopicSubject">
								</li>
							</ul>
						</td>
					</tr>
					<tr><!-- 文章内容 -->
						<td valign="top" align="center">
							<div class="Content">${releaseInfo.releaseContent}</div>
						</td>
					</tr>

					<tr><!--显示楼层等信息-->
						<td class="Footer" height="28" align="center" valign="bottom">
							<ul style="margin: 0px; width: 98%;">
								<li style="float: left; line-height:18px;"><font  size="5px" color=#C30000><strong>[楼主]</strong></font>
									${releaseInfo.releaseTime}					
								</li>
								<li>
									<span class="glyphicon glyphicon-eye-open" aria-hidden="true" style="color:#c30000">浏览次数：${releaseInfo.viewCount}</span>
								</li>
								<li style="float: right;">
										<!-- JiaThis Button BEGIN -->
								<div class="jiathis_style_24x24">
								<a class="jiathis_button_qzone"></a>
								<a class="jiathis_button_tsina"></a>
								<a class="jiathis_button_tqq"></a>
								<a class="jiathis_button_weixin"></a>
								<a class="jiathis_button_renren"></a>
							<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
						<a class="jiathis_counter_style"></a>
					</div>
				
					<!-- JiaThis Button END -->
								</li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
			</c:if>
			<!-- ~~~~~~~~~~~~~~~ 显示主帖结束 ~~~~~~~~~~~~~~~ -->
			
			<!-- ~~~~~~~~~~~~~~~ 显示回复列表 ~~~~~~~~~~~~~~~ -->
			<c:forEach items="${page.recordList}" var="replay" varStatus="st">
			<div class="ListArea template">
				<table border="0" cellpadding="0" cellspacing="1" width="100%">
					<tr>
						<td rowspan="3" width="130" class="PhotoArea" align="center" valign="top">
							<!--作者头像-->
							<div class="AuthorPhoto">
								<img border="0" width="110" height="110" src="${pageContext.request.contextPath}/style/images/defaultAvatar.gif" 
									onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/style/images/defaultAvatar.gif';" />
							</div>
							<!--作者名称-->
							<div class="AuthorName">${replay.TUser.userName}</div>
						</td>
						<td align="center">
							<ul class="TopicFunc">
							<c:if test="${user.id==1}">
								<!--操作列表-->
								<li class="TopicFuncLi">
									<a class="detail" href="${pageContext.request.contextPath}/BBS_Topic/saveUI.html"><img border="0" src="${pageContext.request.contextPath}/style/images/edit.gif" />编辑</a>
									<a class="detail" href="replay!deleteReplay.action?replayId=${replay.id}&releaseInfoId=${releaseInfoId}" onClick="return confirm('确定要删除本帖吗？')"><img border="0" src="${pageContext.request.contextPath}/style/images/delete.gif" />删除</a>
								</li>
							</c:if>	
								
								
								<!-- 文章表情与标题 -->
								<li class="TopicSubject">
								<img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face${replay.faceIcon}.gif"/>
									<c:if test="${replay.isDelete!=1}">${replay.title}</c:if> 
								</li>
							</ul>
						</td>
					</tr>
					<tr><!-- 文章内容 -->
						<td valign="top" align="center">
							<div class="Content">
								<c:if test="${replay.isDelete!=1}">
									${replay.content}
								</c:if> 
								<c:if test="${replay.isDelete==1}">
									<img src="${pageContext.request.contextPath}/style/images/wrong.png"/>
								</c:if> 
							</div>
						</td>
					</tr>
					<tr><!--显示楼层等信息-->
						<td class="Footer" height="28" align="center" valign="bottom">
							<ul style="margin: 0px; width: 98%;">
								<li style="float: left; line-height:18px;"><font color=#C30000>[${(page.currentPage - 1) * page.pageSize + st.count}楼]</font>
									${replay.postTime}
								</li>
								<li style="float: right;"><a href="javascript:scroll(0,0)">
									<img border="0" src="${pageContext.request.contextPath}/style/images/top.gif" /></a>
								</li>
							</ul>
						</td>
					</tr>
					
					
					
				</table>
			</div>
			</c:forEach>
			<!-- ~~~~~~~~~~~~~~~ 显示回复列表结束 ~~~~~~~~~~~~~~~ -->
		</div>
		<!-- 分页开始 -->
		<form action="replay!toReplayUIPage.action" method="post" id="formId">
			<input type="hidden" name="releaseInfoId" value="${releaseInfoId}"/>
		</form>
		

<!-- 页码开始 -->
    <div class="container">
    	<div class="row">
  			<div class="col-sm-3">

			</div>
  			<div class="col-sm-2"></div>
  			<div class="col-sm-7">
<nav>
  <ul class="pagination pagination-lg">
    <li>
      <a href="javascript: gotoPage(1)" title="首页" style="cursor: hand;" aria-label="Previous">
        <span aria-hidden="true">首页</span>
      </a>
    </li>
    
    	<c:forEach begin="${page.beginPageIndex}" end="${page.endPageIndex}" var="num">
			
			<c:if test="${num == page.currentPage}"><%-- 当前页 --%>
				<li class="active">
					<span class="as">${num}</span>
				</li>
			</c:if>
			<c:if test="${num != page.currentPage}"><%-- 非当前页 --%>
			<li>
				<a href="javascript:gotoPage(${num});" style="cursor: hand;">${num}</a>	
			</li>	
			</c:if>
			
		</c:forEach>
    	
    
    <li>
      <a href="javascript: gotoPage(${page.pageCount})" title="尾页" style="cursor: hand;" aria-label="Next">
        <span aria-hidden="true">尾页</span>
      </a>
    </li>

  </ul>
</nav>
<div class="divSpans" style="margin-left:150px;">
     	<span class="spanPageInfo"><!--  当前页：<span class="spanRed">${page.currentPage}</span>-->
  				共<span class="spanRed">${page.pageCount}</span>页，
				<!-- 每页显示：${pageSize}条  -->   
				<span class="spanRed">${page.recordCount}</span>条信息
    	，转到：
		<select onchange="gotoPage(this.value)" id="_pn" onscroll="true">
			<c:forEach begin="1" end="${page.pageCount}" var="num">
				<option value="${num}">${num}</option>
			</c:forEach>	
		</select>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
		<script type="text/javascript">
			$("#_pn").val("${currentPage}");
		</script>
</div>
  			</div>
		</div>
    </div>
    <script type="text/javascript">
		function gotoPage( pageNum ){
			// window.location.href = "forum_show.action?id=${id}&pageNum=" + pageNum;
			
			$("#formId").append("<input type='hidden' id='CurrentPageNumInfo' name='pageNum' value='" + pageNum +"'>");
			$("#formId").submit();
		}
</script>
<!-- 页码结束 -->
		<!-- 分页结束 -->
		<div class="ForumPageTableBorder" style="margin-top: 25px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr valign="bottom">
					<td width="3" class="ForumPageTableTitleLeft">&nbsp;</td>
					<td class="ForumPageTableTitle"><b>快速回复</b></td>
					<td width="3" class="ForumPageTableTitleRight">&nbsp;</td>
				</tr>
				<tr height="1" class="ForumPageTableTitleLine">
					<td colspan="3"></td>
				</tr>
			</table>
		</div>
	</center>
			
	<!--快速回复-->
	<div class="QuictReply">
	<form action="replay!replayUser.action" method="post">
	<input type="hidden" name="releaseInfoId" value="${releaseInfoId}"/>
		<div style="padding-left: 3px;">
			<table border="0" cellspacing="1" width="98%" cellpadding="5" class="TableStyle">
				<tr height="30" class="Tint">
					<td width="50px" class="Deep"><b>标题</b></td>
					<td class="no_color_bg">
					<input type="text" class="form-control" name="replayQuick.title" id="realName" placeholder="回复标题" style="width:90%">
					</td>
				</tr>
				<tr height="30" class="Tint">
					<td width="50px" class="Deep"><b>表情</b></td>
					<td class="no_color_bg"><div class="InputContent">
						<!-- 显示表情符号 -->
						<!--现在在设计单选框(radio)和复选框(checkbox)时都会给选择文字加上label增大选择范围，以提高用户体验。
							但在给单独的图片加label时无法成功。
							解决方法是：给图片img标签加上disabled即可。-->
						<table cellpadding="0" border="0" cellspacing="0">
							<tr>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="1" checked="checked" id="r_1"/>
									<label for="r_1"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face1.gif" disabled="true" align="absmiddle"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="2" id="r_2"/>
									<label for="r_2"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face2.gif" disabled="true" align="absmiddle"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="3" id="r_3"/>
									<label for="r_3"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face3.gif" disabled="true" align="absmiddle"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="4" id="r_4"/>
									<label for="r_4"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face4.gif" disabled="true" align="absmiddle"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="5" id="r_5"/>
									<label for="r_5"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face5.gif" disabled="true" align="absmiddle"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="6" id="r_6"/>
									<label for="r_6"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face6.gif" disabled="true" align="absmiddle"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="7" id="r_7"/>
									<label for="r_7"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face7.gif" disabled="true" align="absmiddle"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="8" id="r_8"/>
									<label for="r_8"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face8.gif" align="absmiddle" disabled="true"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="9" id="r_9"/>
									<label for="r_9"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face9.gif" align="absmiddle" disabled="true"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="10" id="r_10"/>
									<label for="r_10"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face10.gif" align="absmiddle" disabled="true"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="11" id="r_11"/>
									<label for="r_11"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face11.gif" align="absmiddle" disabled="true"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="12" id="r_12"/>
									<label for="r_12"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face12.gif" align="absmiddle" disabled="true"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="13" id="r_13"/>
									<label for="r_13"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face13.gif" align="absmiddle" disabled="true"/></label>
								</td>
								<td width="50" style="border-bottom:0 solid #ffffff">
									<input type="radio" name="replayQuick.faceIcon" value="14" id="r_14"/>
									<label for="r_14"><img width="19" height="19" src="${pageContext.request.contextPath}/style/images/face/face14.gif" align="absmiddle" disabled="true"/></label>
								</td>
							</tr>
						</table></div>
					</td>
				</tr>
				
				<tr class="Tint" height="200">
					<td valign="top" rowspan="2" class="Deep"><b>内容</b></td>
					<td valign="top" class="no_color_bg">
						<textarea name="replayQuick.content"  style="width: 95%; height: 300px"></textarea>
					</td>
				</tr>
				<tr height="30" class="Tint">
					<td class="no_color_bg" colspan="2" align="left">
						<c:if test="${user==null}">
							<button type="button" class="btn btn-default btn-primary" data-toggle="modal" data-target="#myModal">提交</button>
						</c:if>
						<c:if test="${user!=null}">
						<button type="submit" class="btn btn-default btn-primary" id="sub">提交</button>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</form>
	</div>
</div>



  			</div>
  			<div class="col-sm-1"></div>
		</div>
    </div>

    <!-- 显示列表结束 -->
    
        <br/>
            <br/>
                <br/>
                <a href="javascript:goTop();" class="scrollup"><i class="glyphicon glyphicon-chevron-up"> </i></a>
  <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1409926043745444" charset="utf-8"></script>
  </body>
</html>
