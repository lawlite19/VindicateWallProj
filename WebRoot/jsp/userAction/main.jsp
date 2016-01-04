<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ page import="com.hhit.entity.TUser" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>   
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit" /><!--让360默认以极速方式渲染-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/><!--使用最新的文档模式，所以默认在IE9下是quirks模式，太难看-->
    <meta name="viewport" content="width=device-width, initial-scale=1"  />
    <meta name="keywords" content="表白 " />
    <meta name="description" content="表白墙  说出你的爱" />
    <title>表白墙</title>
	<!-- Bootstrap -->
	  <%@ include file="/jsp/publicCode/commons.jspf"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/loading3.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/animate.min.css"/>
	<script src="${pageContext.request.contextPath}/script/wow.min.js"></script>

	
	<script>
	if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
		new WOW().init();
	};
	</script>
    <style type="text/css">
        body{
		padding-top:50px;
    	background-image:url("${pageContext.request.contextPath}/style/images/bg.jpg");
    	}
    	.carousel-inner .item img{
    		width:100%;
    		height:350px;
    	}	
    </style>
	<script type="text/javascript">
		$(function(){
			var userInfo=$("div[name='${user.userName}']");
			if(userInfo.val!=null)
				userInfo.show();
		});
	</script>
<script type="text/javascript">
$(document).ready(function(){
	//加载完之后隐藏加载区域
	$("#preLoading").hide();
	$(".side ul li").hover(function(){
		$(this).find(".sidebox").stop().animate({"width":"124px"},200).css({"opacity":"1","filter":"Alpha(opacity=100)","background":"#ae1c1c"});	
	},function(){
		$(this).find(".sidebox").stop().animate({"width":"54px"},200).css({"opacity":"0.8","filter":"Alpha(opacity=80)","background":"#000"});
	});
	
});

//回到顶部
function goTop(){
	$('html,body').animate({'scrollTop':0},600);
}
//验证输入的问题是否包含特殊符号
$(function(){
	$("#subProblem").on('click',function(){
    	var $btn=$(this).button('loading');
        var textContext=/[%<>==&'\\]/;
    	var textArea=$("#problemContent").val().trim();
        if(textContext.test(textArea)) {   
           $("#spanValidateProblem").html("您输入的问题内容包含特殊字符，请检查！").css(
					"color", "red").css('display', '');
           $btn.button('reset');
           return;
    	}	
       $("#subProblem").attr("type","submit");
       	   $btn.button('reset');
       //$("#probleForm").submit();
    });
});
</script>

<!--  <script type="text/javascript">
var sogou_ad_id=414667;
var sogou_ad_height=60;
var sogou_ad_width=960;
</script>
<script type='text/javascript' src='http://images.sohu.com/cs/jsfile/js/c.js'></script>
-->
</head>
<body>

  <!-- 导航条开始 -->
  <%@ include file="/jsp/publicCode/top.jspf"%>
 <!-- 导航条结束 --> 
<!-- 3D轮播开始 -->
        <div class="containers">
            <div style="position: relative;" class="slideshow grid_12">
                <div class="holder" style="">
                    <!-- 主体部分 -->
                    <div id="wowslider-container">
                        <div class="ws_images">
                            <ul>
                            <c:forEach items="${recommandVins}" var="rv" varStatus="st">
                                <li>
                                    <a>
                                        <img src="${pageContext.request.contextPath}/style/images/${st.count}.jpg" alt="${rv.releaseContent}" title="对<${rv.realName}>的表白" />
                                    </a>
                             <a href="replay!toReplayUI.action?releaseInfoId=${rv.id}" style="color:#FFF;">     ${rv.releaseContent}</a>
                                </li>
                            </c:forEach>
                            </ul>
                        </div>
                         <!--<div class="ws_bullets">
                            <div>
                                <a href="#">
                                    <img src="images/data/tooltips/slide1.png" alt="CSS3 Slider" />
                                </a>
                                <a href="#">
                                    <img src="images/data/tooltips/slide2.png" alt="CSS Slideshow" />
                                </a>
                                <a href="#">
                                    <img src="images/data/tooltips/slide3.png" alt="CSS Gallery" />
                                </a>
                                <a href="#">
                                    <img src="images/data/tooltips/slide5new.jpg" alt="Video Support" />
                                </a>
                            </div>
                        </div>-->
                    </div>
	                 <script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery_engine/wowslider.js">
                    </script>
                    <script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery_engine/script.js">
                    </script>
                    <!-- 主体部分. -->
                </div>
            </div>
            </div>
<!-- 3D轮播结束 -->

<hr/>
<!-- 下面显示表白信息的div区域开始 -->

<div style="width:590px;margin:20px auto 0 auto;" id="preLoading">
		<div class="loading3">
			<div>loading..</div>
			<div></div>
			<div></div>
		</div>
	<object width="590" height="300"  classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553530000">
		<param value="${pageContext.request.contextPath}/style/flash/flash3133.swf" name="movie"/>
		<param value="high" name="quality"/>
		<param value="transparent" name="wmode"/>
		<embed width="590" height="300" wmode="transparent" type="application/x-shockwave-flash"  quality="high" src="${pageContext.request.contextPath}/style/flash/flash3133.swf"/>
	</object>
	<br/><br/><br/><br/><br/>
</div>
	  <!--分享区域开始  -->
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js?uid=1409926043745444&type=left&amp;move=0&amp;btn=l1.gif" charset="utf-8"></script>
  <!--分享区域结束  -->
<div class="container">
<div class="row">
<form action="releaseInfo.action" method="post" id="formId">
	<c:forEach items="${page.recordList}" var="ri" varStatus="st">
		<a href="replay!toReplayUI.action?releaseInfoId=${ri.id}">
		<c:if test="${st.count%3==1}">
		<div class="col-md-3 wow rollIn" data-wow-delay="1.5s" style="background-image: url(${pageContext.request.contextPath}/style/images/center/${ri.background}.gif);">
			<!-- ${st.count}-->

			<br/>
			<div class="divContent wow flipInX">
  				<span class="spanContent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ri.releaseContent}</span><br/>
  			</div>
  			<div class="divspan1">
  			    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>浏览次数：${ri.viewCount}
  			</div>
  			<div class="divSpan">
  				<span class="spanDate">${ri.releaseTime}</span>
  			</div>
		</div>
		</c:if>     
				<c:if test="${st.count%3==2}">
		<div class="col-md-3 wow bounceInUp" data-wow-delay="1s" style="background-image: url(${pageContext.request.contextPath}/style/images/center/${ri.background}.gif);">
			<!-- ${st.count}-->
			<br/>
			<div class="divContent wow flipInX">
  				<span class="spanContent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ri.releaseContent}</span><br/>
  			</div>
  			<div class="divspan1">
  			    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>浏览次数：${ri.viewCount}
  			</div>
  			<div class="divSpan">
  				<span class="spanDate">${ri.releaseTime}</span>
  			</div>
		</div>
		</c:if> 
				<c:if test="${st.count%3==0}">
		<div class="col-md-3 wow bounceInRight" data-wow-delay="1.5s" style="background-image: url(${pageContext.request.contextPath}/style/images/center/${ri.background}.gif);">
			<!-- ${st.count}-->
			<br/>
			<div class="divContent wow flipInX">
  				<span class="spanContent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ri.releaseContent}</span><br/>
  			</div>
  			<div class="divspan1">
  			    <span class="glyphicon glyphicon-eye-open" aria-hidden="true">浏览次数：${ri.viewCount}</span>
  			</div>  
  			<div class="divSpan">
  				<span class="spanDate">${ri.releaseTime}</span>
  			</div>
		</div>
		</c:if>             
		</a>
	</c:forEach>
</form>
</div>
</div>

<!-- 页码开始 -->
    <%@ include file="/jsp/publicCode/pageView.jspf"%>
<!-- 页码结束 -->
<!-- 右侧栏开始 -->
<div class="side">
	<ul>
		<li>
			<a target="_blank" href="http://sighttp.qq.com/authd?IDKEY=e1c51526f74f0c15a55cca61b8782a625f1ade6ccad020d8">
			<!--  <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2815986024&site=qq&menu=yes">-->
			<div class="sidebox"><img src="${pageContext.request.contextPath}/style/images/side/side_icon04.png"/>QQ咨询</div></a>
		</li>
		<li>
			<a target="_blank" href="http://weibo.com/bravetolove"><div class="sidebox"><img src="${pageContext.request.contextPath}/style/images/side/side_icon03.png"/>新浪微博</div>
			</a>
		</li>
		<li><a data-toggle="modal" href="#problemModel"><div class="sidebox"><img src="${pageContext.request.contextPath}/style/images/side/side_icon01.png"/>反馈</div></a></li>
		<!--  <li><a href="#"><div class="sidebox"><img src="${pageContext.request.contextPath}/style/images/side/side_icon02.png"/>客户案例</div></a></li>
		
		<li><a href="#"><div class="sidebox"><img src="${pageContext.request.contextPath}/style/images/side/side_icon06.png"/>扫一扫</div></a></li>-->
		<li style="border:none;"><a href="javascript:goTop();" class="sidetop"><img src="${pageContext.request.contextPath}/style/images/side/side_icon05.png"/></a></li>
	</ul>
</div>
<!-- 右侧栏结束 -->

<!-- 页尾，版权信息开始 -->
<%@ include file="/jsp/publicCode/bottom.jspf"%>
<!-- 页尾，版权信息结束 -->
<!-- 下面显示表白信息的div区域结束 -->

<!-- 首次进入显示主页面信息界面结束 -->


<!-- 弹出提示对话框结束 -->
<!-- 弹出问题的模态框开始 -->
<!-- Modal -->
<div class="modal fade" id="problemModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">您遇到的问题</h4>
      </div>
      <div class="modal-bodys" style="padding-left:90px;padding-right:90px;">
      <div>
		<form class="form-horizontal" action="problem!submitQuestion.action" method="post" id="probleForm">
  		<div class="form-group">
   		 <label for="email">您的邮箱：</label>

      <input type="email" class="form-control" name="problem.email" id="email" placeholder="输入您的邮箱地址" required="required"/>
   
  </div>
  <div class="form-group">
    <label for="problemContent">您遇到的问题：<span id="spanValidateProblem"></span></label>
    	<textarea class="form-control" name="problem.description" id="problemContent" placeholder="输入您遇到的问题描述" style="margin-top: 0px; margin-bottom: 0px; height: 140px;" required="required"></textarea>
  </div>

  <div class="form-group">
      <button type="button" class="btn btn-default btn-success btn-block" data-loading-text="提交问题中..." autocomplete="on" id="subProblem">提交问题</button>
  </div>
</form>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
    </div>
  </div>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>

<!-- 弹出问题对话框结束 -->

</body>

</html>


