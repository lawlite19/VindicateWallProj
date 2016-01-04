<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>智能墙</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="表白墙" content="express your love">
	<%@include file="/jsp/publicCode/commons.jspf" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/intelligence.css"/>
	<style type="text/css">
	body{
		padding-top:80px;
		background-image: url("${pageContext.request.contextPath}/style/images/bg.jpg");
	}
	</style>
	<script type="text/javascript">
	$(document).ready(
			function() {
				$(document).keydown(function(event){ 
					if(event.keyCode==13){ 
						$("#submitQuestion").click(); 
					} 
					}); 
				$("#chatContent").focus();
				$("#submitQuestion").click(
						function() {
							var $btn=$(this).button('loading');
							var chatContent=$("#chatContent").val();
							$("#chatReplay").prepend("<li class='even'><a class='user' href='#'><img class='img-responsive avatar_' src='${pageContext.request.contextPath}/style/images/avatar.png' alt=''/><span class='user-name'>用户</span></a><div class='reply-content-box'><div class='reply-content pr'><span class='arrowa'>&nbsp;</span>"+chatContent+"</div></div></li>");
							$.ajax({
								url : "intelligent!tuLing.action",
								type : "post",
								dataType : "json",
								data : {
									chatContent : $("#chatContent").val()
								},
								success : function(data) {
									var json = eval("(" + data + ")");
									if(json.code==100000){
										$("#chatReplay").prepend("<li class='odd'><a class='user' href='#'><img class='img-responsive avatar_' src='${pageContext.request.contextPath}/style/images/avatar-1.png' alt=''/><span class='user-name'>小美</span></a><div class='reply-content-box'><div class='reply-content pr'><span class='arrowa'>&nbsp;</span>"+json.text+"</div></div></li>");
									}
									else if(json.code==200000){
										$("#chatReplay").prepend("<li class='odd'><a class='user' href='#'><img class='img-responsive avatar_' src='${pageContext.request.contextPath}/style/images/avatar-1.png' alt=''/><span class='user-name'>小美</span></a><div class='reply-content-box'><div class='reply-content pr'><span class='arrowa'>&nbsp;</span>"+json.text+"&nbsp<a target='_blank' href="+json.url+"><h5>&nbsp;&nbsp;请点击这里访问</h5></a></div></div></li>");
									}
									else if(json.code==305000){
										//var j=json.list[0].start;
										$("#chatReplay").prepend('<li class="odd"><a class="user" href="#"><img class="img-responsive avatar_" src="${pageContext.request.contextPath}/style/images/avatar-1.png" alt=""/><span class="user-name">小美</span></a><div><div class="robot_news"><a href="'+json.list[0].detailurl+'" style="text-decoration:none;" target="_blank"><div class="news_pic" style="margin-bottom:0px;"><img src="${pageContext.request.contextPath}/style/images/weixin-lieche.png" class="pic_img" style="margin-top:0px;"></div><div class="first_content">'+json.text+'</div></a><div class="news_others"><a href="http://touch.qunar.com/h5/train/" style="text-decoration:none;" target="_blank"><div class="news_other_pic"><img src="http://unidust.cn/images/api-train.jpg" class="other_pic_img" style="float:right;width:38px;height:38px;"></div><div class="news_desc" style="font-size: 14px; max-height: 45px; margin: 0px 50px 5px 0px; color: grey;">'+json.list[0].start+'-->'+json.list[0].terminal+'<br>'+json.list[0].starttime+'->'+json.list[0].endtime+'</div></a></div><div class="news_others"><a href="'+json.list[1].detailurl+'" style="text-decoration:none;" target="_blank"><div class="news_other_pic"><img src="http://unidust.cn/images/api-train.jpg" class="other_pic_img" style="float:right;width:38px;height:38px;"></div><div class="news_desc" style="font-size: 14px; max-height: 45px; margin: 0px 50px 5px 0px; color: grey;">'+json.list[0].start+'-->'+json.list[1].terminal+'<br>'+json.list[1].starttime+'->'+json.list[1].endtime+'</div></a></div></div></div>'+"</div></li>");
									}
									else if(json.code==306000){
										$("#chatReplay").prepend("<li class='odd'><a class='user' href='#'><img class='img-responsive avatar_' src='${pageContext.request.contextPath}/style/images/avatar-1.png' alt=''/><span class='user-name'>小美</span></a><div class='reply-content-box'><div class='reply-content pr'><span class='arrowa'>&nbsp;</span>本网站不提供航班查找</div></div></li>");
									}
									$btn.button('reset');
									$("#chatContent").val("");
									$("#chatContent").focus();
								},
								error : function() {
									Dialog("服务器出现异常", 0);
									$btn.button('reset');
								}
							});
							
						});
			});
</script>
  </head>
  
  <body>
  	<%@include file="/jsp/publicCode/top.jspf" %>
    <div class="container">
    	<div class="row">
			<!-- 左侧列表 -->
  			<div class="col-sm-1">
  			</div>
  			<!-- 右侧列表 -->
  			<div class="col-sm-11">
			<!-- 发布表白信息开始 -->
			<form class="form-horizontal" action="releaseInfo!vindicate.action" method="post" id="formId">
			<div class="form-group">
				<div class="col-sm-2"></div>
				<div class="col-sm-6" id="vindicateContent">
      			<textarea id="chatContent" name="vindicateInfo.releaseContent" style="font-size:16px;width:600px;height:80px;" class="form-control" placeholder="请在这里输入内容，回车即可发送"></textarea>
      			</div>
      			<div class="col-sm-4">
      			<button type="button" class="btn btn-default btn-primary btnSub" data-loading-text="请稍等..." id="submitQuestion" autocomplete="true">发送</button>
      			</div>
  			</div>	
			</form>
			<!-- 发布表白信息结束 -->	
</div>
		</div>
    </div>
	<div class="container">
	  <div class="row">
			<!-- 左侧列表 -->
  			<div class="col-sm-1">
  			</div>
  			<div class="col-sm-9">
  			
    <!-- 聊天区域 -->
    <div data-role="page" class="content">
    <div data-role="content" class="container" role="main" style="width:980px;">
        <ul class="content-reply-box mg10" id="chatReplay">
        	   <li class="odd">
                <a class="user" href="#"><img class="img-responsive avatar_" src="${pageContext.request.contextPath}/style/images/avatar-1.png" alt=""><span class="user-name">小美</span></a>
                <div class="reply-content-box">
                    <div class="reply-content pr">
                    	<span class="arrow">&nbsp;</span>
                    	欢迎来到智能墙，在这里可以随便进行询问，小美将竭诚为你服务，么么哒！
                    </div>
                </div>
            </li>
        </ul>
    </div>
	</div>
	</div>
	</div>
	</div>
    <!--网页尾部-->
    <br/>

	 <br/> <br/> <br/><br/> <br/> <br/><br/> <br/> <br/><br/> <br/> <br/>
    <%@ include file="/jsp/publicCode/bottom.jspf" %>
  </body>
</html>
