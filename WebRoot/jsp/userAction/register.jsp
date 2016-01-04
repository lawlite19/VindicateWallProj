<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户注册</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${pageContext.request.contextPath}/script/skin/style.css" type="text/css" rel="Stylesheet" />
  	<%@ include file="/jsp/publicCode/commons.jspf" %>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery.passwordStrength.js"></script>
<style type="text/css">
body {
	padding-top: 80px;
}
</style>
<!-- 密码强度提示 -->
<script type="text/javascript">
	$(function() {
		$("#password").passwordStrength();
	});
</script>
<script type="text/javascript">
	function changeValidateCode(obj) {
		//获取当前的时间作为参数，无具体意义    
		var timenow = new Date().getTime();
		//每次请求需要一个不同的参数，否则可能会返回同样的验证码    
		//这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。    
		obj.src = "rand.action?d=" + timenow;
	}
</script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#userName").focus();
				$("#userName").blur(
						function() {
							//var url="checkUserName.action";
							//var param={userName:$("#userName").val()};
							//$.post(url,param,function(data){
							//	var json = eval("("+data+")"); 
							//	var str=json.name;
							//	$("#spanValidateUName").html(str).css("color", "red").css('display', '');
							//},
							//"json"
							//);
							//var params=$("#userName").serializeArray();
							$.ajax({
								url : "checkUserName.action",
								type : "post",
								dataType : "json",
								data : {
									userName : $("#userName").val()
								},
								success : function(data) {
									var json = eval("(" + data + ")");
									var str = json.name;
									if(str=="forbid"){
										$("#spanValidateUName").html("此用户名非法，请更换其他用户名！").css(
												"color", "red").css('display', '');
										$("#userName").focus();
									}
									if(str=="true"){
									$("#spanValidateUName").html("恭喜您，此用户名可以使用").css(
											"color", "green").css('display', '');
									}
									if(str=="false"){
										$("#spanValidateUName").html("此用户名已经被占用，请更换其他用户名！").css(
												"color", "red").css('display', '');
										$("#userName").focus();
									}
									if ($("#userName").val() == "" || $("#userName").val().length > 15
											|| $("#userName").val().length < 3) {
										$("#spanValidateUName").html("用户名不能为空，长度必须在3-15位之间").css(
												"color", "red").css('display', '');
										$("#userName").focus();
									}else if($("#userName").val().indexOf(' ') > 0) {
										$("#spanValidateUName").html("用户名不能包含空格").css("color", "red").css(
												'display', '');
										$("#userName").focus();
									}
									
								},
								error : function() {
									Dialog("服务器出现异常", 0);
								}
							});
							
						});
			});
</script>
<script type="text/javascript">
		function validateCode(){
			$.ajax({
				url : "checkUserName!validateCode.action",
				type : "post",
				dataType : "json",
				data : {
					randCode:$("#code").val()
				},
				success : function(data) {
					var json = eval("(" + data + ")");
					var str = json.name;
					if(str=="false"){
						Dialog("验证码错误！", 0);
						$("#code").focus();
						return;
					}
					$("#formId").submit();
				},
				error : function() {
					Dialog("服务器出现异常", 0);
				}
			});
		}
</script>
<script type="text/javascript">
	function validateInput() {
		//var isEmail = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
		if ($("#password").val() == ""
				|| $("#password").val().length > 20||$("#password").val().length < 6) {
			Dialog("密码长度在6-20位",0);
			$("#password").focus();
			return;
		}
		if ($("#password").val() != $("#confirmPassword").val()) {
			Dialog("两次密码输入不一致！", 0);
			$("#confirmPassword").focus();
			return;
		}
		var boolCheck=$('input:radio[name="user.sex"]').is(":checked");
		if(!boolCheck){
			Dialog("请选择您的性别！", 0);
			return;
		}
		if($("#safeAnswer").val()==""){
			Dialog("请输入安全问题答案！", 0);
			$("#safeAnswer").focus();
			return;
		}
		if($("#code").val()==""){
			Dialog("请输入验证码！", 0);
			$("#code").focus();
			return;
		}
		validateCode();
	}
</script>
<script type="text/javascript"> 
	function checkAgree(){
		var IsChecked=$('input:checkbox[name="agreeCheck"]').is(":checked");
		 if(IsChecked){
			 $("#sub").removeAttr("disabled","disabled");
			 return;
		 }
		 else{
			 $("#sub").attr("disabled","disabled");
			 return;
		 }
			 
	}
</script>


</head>
<body>
	<%@ include file="/jsp/publicCode/top.jspf"%>
	<!--主体-->
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>

			<div class="col-sm-8">
				<form class="form-horizontal" action="mlogin!register.action" method="post" id="formId">
					<div class="form-group">
						<label for="userName" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-9" id="uname">
							<input type="text" class="form-control" name="user.userName" id="userName" aria-describedby="userName" placeholder="输入您的用户名" required="required"/>
							<span id="spanValidateUName"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="realName" class="col-sm-2 control-label">真实姓名</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="user.realName" id="realName" placeholder="输入您的真实姓名，有助于接收消息哦！    (选填)"/>
						</div>

					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" name="user.password" id="password" placeholder="密码设置要强一些哦，密码长度小于20位，字母区分大小写"/>
							<br/>
							<span style="display:none;" id="spanValidatePassword"></span>
							<div id="passwordStrengthDiv" class="is0"></div>
						</div>
					</div>
					<div class="form-group">
						<label for="confirmPassword" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="请完整重复上面的密码，注意区分大小写"/>
						</div>
					</div>
					<div class="form-group">
						<label for="inlineRadio1" class="col-sm-2 control-label">性别</label>
						<div class="radio col-sm-3">
							<label class="radio-inline"> <input type="radio" name="user.sex" id="sexMan" value="男">
								男
							</label>&nbsp;&nbsp; <label class="radio-inline"> <input type="radio" name="user.sex" id="sexWoman" value="女">女
							</label>
						</div>
					</div>
					<!--  <div class="form-group">
						<label for="email" class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" name="user.email" id="email" placeholder="输入您的邮箱">
						</div>
					</div>-->
					<div class="form-group">
						<label for="safeQuestion" class="col-sm-2 control-label">安全问题</label>
						<div class="col-sm-9">
      		<select name="user.safeQuestion" id="safeQuestion" class="form-control">
						<option value="父亲姓名">父亲姓名</option>
						<option value="母亲姓名">母亲姓名</option>
						<option value="高中班主任">高中班主任</option>
						<option value="最擅长做的菜">最擅长做的菜</option>
						<option value="对你影响最大的人的姓名">对你影响最大的人的姓名</option>
						<option value="初恋的姓名">初恋的姓名</option>
			</select>
						</div>
					</div>
					<div class="form-group">
						<label for="safeAnswer" class="col-sm-2 control-label">问题答案</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="user.safeAnswer" id="safeAnswer" placeholder="输入您的答案">
						</div>
					</div>
					<div class="form-group">
						<label for="code" class="col-sm-2 control-label">验证码</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="user.code" id="code" placeholder="请输入验证码">
						</div>
						<div class="col-sm-1">
							<img src="rand.action" onclick="changeValidateCode(this)" title="点击图片刷新验证码" style={width:30px;height:40px}/>
						</div>
						<br/>
						<label class="col-sm-offset-2 control-label"> 
						  &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="" id="agreeCheck" name="agreeCheck" onclick="checkAgree()"> 我确认我同意<a data-toggle="modal" href="#registModel">《表白墙条款和声明》</a>
						</label>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-success btn-lg" id="sub" onclick="validateInput()" disabled="disabled">立即注册</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<hr/>
	<%@ include file="/jsp/publicCode/bottom.jspf"%>
	
	<!-- 弹出提示的模态框开始 -->
<!-- Modal -->
<div class="modal fade" id="noteModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modalRegister" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">注册提示</h4>
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

<!-- 弹出提示的模态框开始 -->
<!-- Modal -->
<div class="modal fade" id="registModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">注册条款</h4>
      </div>
      <div class="modal-bodys" style="padding:15px;">
		1、服务条款的确认和接纳<br/>
			www.bravetolove.com(以下简称本网站)用户服务的所有权和运作权归本网站拥有。本网站所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“同意条款并注册”按钮，即表示用户与本网站达成协议并接受所有的服务条款。
		<br/>
		2、本网站服务简介<br/>
			本网站通过互联网为用户提供表白、文章浏览、网上留言、等服务。   
		<br/> 
		3、服务条款的修改<br/>
			根据国家法律法规变化及网站运营需要，本网站有权对本协议条款不时地进行修改，修改后的协议一旦被张贴在本站上即生效，并代替原来的协议。用户可随时登陆查阅最新协议；用户有义务不时关注并阅读最新版的协议。如用户不同意更新后的协议，可以且应立即停止接受本站依据本协议提供的服务；如用户继续使用本网站提供的服务的，即视为同意更新后的协议。如果本协议中任何一条被视为废止、无效或因任何理由不可执行，该条应视为可分的且并不影响任何其余条款的有效性和可执行性。  
        <br/>
        4、服务修订<br/>
			本网站保留随时修改或中断服务而不需知照用户的权利。本网站行使修改或中断服务的权利，不需对用户或第三方负责。
       	<br/>
       	5、用户隐私制度<br/>
			尊重用户个人隐私是本网站的基本政策。本网站不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的：
			<br/>1)遵守有关法律规定，遵从合法服务程序。
			<br/>2)保持维护本网站的商标所有权。
			<br/>3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。
			<br/>4)符合其他相关的要求。
		<br/>
		6、用户的帐号，密码和安全性<br/>
			一旦注册成功成为本网站用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知本网站。
		7、免责条款<br/>
			用户明确同意网站服务的使用由用户个人承担风险。本网站不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过本网站服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。
     	<br/>
     	9、用户责任<br/>
		用户单独承担传输内容的责任。用户必须遵循：<br/>
		1)从中国境内向外传输技术性资料时必须符合中国有关法规。<br/>
		2)使用网站服务不作非法用途。<br/>
		3)不干扰或混乱网络服务。<br/>
		4)不在论坛BBS或留言簿发表任何与政治相关的信息。<br/>
		5)遵守所有使用网站服务的网络协议、规定、程序和惯例。<br/>
		6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。<br/>
		7)不得利用本站制作、复制和传播下列信息：<br/>
		1、煽动抗拒、破坏宪法和法律、行政法规实施的；<br/>
		2、煽动颠覆国家政权，推翻社会主义制度的；<br/>
		3、煽动分裂国家、破坏国家统一的；<br/>
		4、煽动民族仇恨、民族歧视，破坏民族团结的；<br/>
		5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；<br/>
		6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；<br/>
		7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；<br/>
		8、损害国家机关信誉的；<br/>
		9、其他违反宪法和法律行政法规的；<br/>
		10、进行商业广告行为的。<br/>
		用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，本网站将取消用户服务帐号。
		10、解释权<br/>
		本条款的解释权归本网站所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
<!-- 弹出提示对话框结束 -->
</body>
</html>
