<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>每日浪漫表白</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="表白墙" content="说出你的爱">
	<%@ include file="/jsp/publicCode/commons.jspf"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/default.css"/>
	<script src="${pageContext.request.contextPath}/script/garden.js"></script>
	<script src="${pageContext.request.contextPath}/script/functions.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/common/My97DatePicker/WdatePicker.js"></script>
  	<script type="text/javascript">
  			function check(){
  				if($("#releaseDate").val()==""){
  					Dialog("亲，请输入要查询的日期",0);
  					return;
  				}
  				var myDate=new Date();
  				if(!checkDateEarlier($("#releaseDate").val(),getMyDate(myDate))){
  					Dialog("亲，要查询的日期不能超过今天！",0);
  					return;
  				}
  				$("#formDaily").submit();
  			}
  			//将date类型的日期转换成字符串
  			function getMyDate(tmpDate)
  			{  
  			    var date1,date2;               
  			    date1 =tmpDate.getMonth()+1+"";  
  			    if(date1.length<2)            
  			        date1="0"+date1;          
  			    date2 =tmpDate.getDate()+"";    
  			     if(date2.length<2)           
  			         date2="0"+date2;         
  			   return tmpDate.getFullYear()+"-"+date1+"-"+date2;   
  			}
  			/**
  			*校验两个日期的先后
  			*返回值：
  			*如果其中有一个日期为空，校验不通过,        返回false
  			*如果起始日期早于等于终止日期，校验通过，返回true；如果起始日期晚于终止日期，返回false
  			*/
  			function checkDateEarlier(strStart,strEnd)
  			{
  			    //if(checkIsValidDate(strStart) == false || checkIsValidDate(strEnd) == false)
  			      //  return false;
  			    //如果有一个输入为空，则通过检验
  			    if (( strStart.trim() == "" ) || ( strEnd.trim() == "" ))
  			        return true;
  			    var arr1 = strStart.split("-");
  			    var arr2 = strEnd.split("-");
  			    var date1 = new Date(arr1[0],parseInt(arr1[1].replace(/^0/,""),10) - 1,arr1[2]);
  			    var date2 = new Date(arr2[0],parseInt(arr2[1].replace(/^0/,""),10) - 1,arr2[2]);
  			    if(arr1[1].length == 1)
  			        arr1[1] = "0" + arr1[1];
  			    if(arr1[2].length == 1)
  			        arr1[2] = "0" + arr1[2];
  			    if(arr2[1].length == 1)
  			        arr2[1] = "0" + arr2[1];
  			    if(arr2[2].length == 1)
  			        arr2[2]="0" + arr2[2];
  			    var d1 = arr1[0] + arr1[1] + arr1[2];
  			    var d2 = arr2[0] + arr2[1] + arr2[2];
  			    if(parseInt(d1,10) > parseInt(d2,10))
  			       return false;
  			    else
  			       return true;
  			}
  	</script>
  </head>
  
  <body>
  <nav class="navbar navbar-default navbarNew">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/userAction/releaseInfo.action">
           	返回首页
      </a>
      <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/userAction/romantic.jsp" target="_blank">
           	说明
      </a>
	<!-- JiaThis Button BEGIN -->
		<a href="http://www.jiathis.com/share" class="navbar-brand jiathis jiathis_txt jialike" target="_blank"><img src="http://v3.jiathis.com/code_mini/images/btn/v1/jt.gif" border="0" />	
		</a>
				<div class="navbar-brand">
		<a class="jiathis_like_tsinat" data="width=320"></a>
		</div>
		<div class="navbar-brand ">
		<a class="jiathis_like_qzone"></a>
		</div>
		<!-- JiaThis Button BEGIN -->
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

      <ul class="nav navbar-nav navbar-right">
      <!-- 查找 -->
         <form class="navbar-form navbar-left" action="dailyVin!findByDate.action" method="post" id="formDaily">
        	<div class="form-group">
          		<input type="text" readonly="readonly" id="releaseDate" name="releaseDate" value="${dailyVin.releaseDate}" class="form-control" placeholder="Search" onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',})">
        	</div>
        	<button type="button" class="btn btn-default" onclick="check()">查找</button>
      	</form>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<c:if test="${dailyVin!=null}">

    <div id="mainDiv">
	<div id="content">
		<div id="code">
			<span class="comments">/**</span><br />
			<span class="space"/><span class="comments">*Fall in love:${dailyVin.year}—${dailyVin.month}-${dailyVin.day} 00:00:00.0,</span><br />
			<span class="space"/><span class="comments">*Today:${dailyVin.releaseDate}.</span><br />
			<span class="space"/><span class="comments">*/</span><br />
			Boy name = <span class="keyword">Mr</span> ${dailyVin.boyName}<br />
			Girl name = <span class="keyword">Miss</span> ${dailyVin.girlName}<br />
			<span class="comments">//${dailyVin.comments}</span><br />
			${dailyVin.content}
		</div>
		<div id="loveHeart">
			<c:if test="${dailyVin.year==''}">
				<canvas id="c"></canvas>
				<audio  autoplay="autoplay" loop="true"> 
  					<source src="${pageContext.request.contextPath}/style/music/music00.mp3" type="audio/mp3"> 
				</audio>
				<script>
				$("#code").css("margin-top", 120);
				$("#code").css("margin-left", 130);
				$("#code").typewriter();
				var b = document.body;
				var c = document.getElementsByTagName('canvas')[0];
				var a = c.getContext('2d');
				document.body.clientWidth; 
				</script>
				<script>
				with(m=Math)C=cos,S=sin,P=pow,R=random;c.width=c.height=f=530;h=-250;function p(a,b,c){if(c>60)return[S(a*7)*(13+5/(.2+P(b*4,4)))-S(b)*50,b*f+50,625+C(a*7)*(13+5/(.2+P(b*4,4)))+b*400,a*1-b/2,a];A=a*2-1;B=b*2-1;if(A*A+B*B<1){if(c>37){n=(j=c&1)?6:4;o=.5/(a+.01)+C(b*125)*3-a*300;w=b*h;return[o*C(n)+w*S(n)+j*610-390,o*S(n)-w*C(n)+550-j*350,1180+C(B+A)*99-j*300,.4-a*.1+P(1-B*B,-h*6)*.15-a*b*.4+C(a+b)/5+P(C((o*(a+1)+(B>0?w:-w))/25),30)*.1*(1-B*B),o/1e3+.7-o*w*3e-6]}if(c>32){c=c*1.16-.15;o=a*45-20;w=b*b*h;z=o*S(c)+w*C(c)+620;return[o*C(c)-w*S(c),28+C(B*.5)*99-b*b*b*60-z/2-h,z,(b*b*.3+P((1-(A*A)),7)*.15+.3)*b,b*.7]}o=A*(2-b)*(80-c*2);w=99-C(A)*120-C(b)*(-h-c*4.9)+C(P(1-b,7))*50+c*2;z=o*S(c)+w*C(c)+700;return[o*C(c)-w*S(c),B*99-C(P(b, 7))*50-c/3-z/1.35+450,z,(1-b/1.2)*.9+a*.1, P((1-b),20)/4+.05]}}setInterval('for(i=0;i<1e4;i++)if(s=p(R(),R(),i%46/.74)){z=s[2];x=~~(s[0]*f/z-h);y=~~(s[1]*f/z-h);if(!m[q=y*f+x]|m[q]>z)m[q]=z,a.fillStyle="rgb("+~(s[3]*h)+","+~(s[4]*h)+","+~(s[3]*s[3]*-80)+")",a.fillRect(x,y,1,1)}',0)
				</script>
			</c:if>
			<c:if test="${dailyVin.year!=''}">
				<canvas id="garden"></canvas>
				<audio  autoplay="autoplay" loop="true"> 
  					<source src="${pageContext.request.contextPath}/style/music/music00.mp3" type="audio/mp3"> 
				</audio>
			<div id="words">
				<div id="messages">
					亲爱的，这是我们相爱在一起的时光。
					<div id="elapseClock"></div>
				</div>
				<div id="loveu">
					爱你直到永永远远。<br/>
					<div class="signature">-${dailyVin.vindicator}</div>
				</div>
			</div>
			<script type="text/javascript">
var offsetX = $("#loveHeart").width() / 2;
var offsetY = $("#loveHeart").height() / 2 - 55;
var together = new Date();
together.setFullYear(${dailyVin.year}, ${dailyVin.month}, ${dailyVin.day});
together.setHours(0);
together.setMinutes(0);
together.setSeconds(0);
together.setMilliseconds(0);

if (!document.createElement('canvas').getContext) {
	var msg = document.createElement("div");
	msg.id = "errorMsg";
	msg.innerHTML = "Your browser doesn't support HTML5!<br/>Recommend use Chrome 14+/IE 9+/Firefox 7+/Safari 4+"; 
	document.body.appendChild(msg);
	$("#code").css("display", "none");
	document.execCommand("stop");
} else {
	setTimeout(function () {
		startHeartAnimation();
	}, 5000);

	timeElapse(together);
	setInterval(function () {
		timeElapse(together);
	}, 1000);

	adjustCodePosition();
	$("#code").typewriter();
}
</script>
			</c:if>
		</div>
	</div>
</div>

</c:if>
<c:if test="${dailyVin==null}">
<div style="width:1024px;margin:20px auto 0 auto;">
<div style="margin-left:330px;">
	<h4><img alt="木有" src="${pageContext.request.contextPath}/style/images/cry.jpg" width="70px" height="70px;"/>今天木有表白哦=-=</h4>
</div>
	<object width="1024" height="768"  classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553544800">
		<param value="flash3213.swf" name="movie">
		<param value="high" name="quality">
		<param value="transparent" name="wmode">
		<embed width="1024" height="768" wmode="transparent" type="application/x-shockwave-flash"  quality="high" src="${pageContext.request.contextPath}/style/flash/flash3213.swf">
	</object>
</div>
<script>
$("body").css("background", "#D6D6D6");
</script>
</c:if>
    <!-- 弹出提示的模态框开始 -->
<!-- Modal -->
<div class="modal fade" id="noteModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">提示</h4>
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
<script type="text/javascript" src="http://v3.jiathis.com/code_mini/jia.js?uid=1409926043745444" charset="utf-8"></script>
  </body>
</html>
