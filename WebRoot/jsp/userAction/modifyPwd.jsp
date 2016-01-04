<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改密码</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${pageContext.request.contextPath}/script/skin/style.css" type="text/css" rel="Stylesheet" />
  	<%@ include file="/jsp/publicCode/commons.jspf" %>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery.passwordStrength.js"></script>
	<style type="text/css">
		body{
			padding-top:100px;
		}
	</style>
	<!-- 密码强度提示 -->
  	<script type="text/javascript">
    $(function(){
        $('#newPassword').passwordStrength(); 
        }); 
    </script>
    <script type="text/javascript">
    $(document).ready(
			function(){
				$("#sub").click(function(){
					if ($("#newPassword").val() == ""
						|| $("#newPassword").val().length > 20||$("#newPassword").val().length < 6) {
					Dialog("密码长度在6-20位",0);
					$("#newPassword").focus();
					return;
				}
				if ($("#newPassword").val() != $("#confirmPassword").val()) {
					Dialog("两次密码输入不一致！", 0);
					$("#confirmPassword").focus();
					return;
				}
				$.ajax({
					url:"checkUserName!oldPasswordIsTrue.action",
					type:"post",
					dataType:"json",
					data:{
						oldPassword:$("#oldPassword").val()
					},
					success:function(data) {  
		            var json = eval("("+data+")");  
		            var str=json.name;
		            if(str=="true")
		            	$("#formId").submit();
		            else
		    			Dialog("旧密码输入错误！",0);
		            	//window.location.href = "/OrderManage/Index"; 
		    		},
					error: function(){
					    Dialog("服务器出现异常",0);					    
					}
				});
				});
				});
    </script>
  </head>
  
  <body>
  	<!-- 网页头部 -->
    <%@ include file="/jsp/publicCode/top.jspf"%>
    
    <div class="container">
    	<div class="row">
			<!-- 左侧列表 -->
  			<div class="col-sm-3">
  			<div class="list-group">
  				<a href="${pageContext.request.contextPath}/jsp/userAction/personalInfoIndex.jsp" class="list-group-item">
   				 &nbsp;<strong>个人信息</strong>
   				 </a>
  				<a href="releaseInfo!queryMyVindication.action" class="list-group-item">&nbsp;<strong>我的表白</strong></a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/vindicate.jsp" class="list-group-item">&nbsp;<strong>表白一下</strong></a>
  				<a href="releaseInfo!toMyMessageUI.action" class="list-group-item">&nbsp;<strong>我的消息</strong></a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/modifyPwd.jsp" class="list-group-item active">&nbsp;<strong>修改密码</strong></a>
			</div>
  			</div>
  			<!-- 右侧列表 -->
  			<div class="col-sm-9">
<!-- 修改密码开始 -->  
	&nbsp;&nbsp;<h3>修改密码</h3>
	<br/>
	<br/>
	<form class="form-horizontal" action="manageUserInfo!modifyPwd.action" method="post" id="formId">
  <div class="form-group">
    <label for="oldPassword" class="col-sm-2 control-label">旧密码</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="oldPassword" placeholder="旧密码">
    </div>
  </div>
  <div class="form-group">
    <label for="newPassword" class="col-sm-2 control-label">新密码</label>
    <div class="col-sm-10">
      <input type="password" name="personInfo.password" class="form-control" id="newPassword" placeholder="新密码">
    	<br/>
    	<span style="display:none;" id="spanValidatePassword"></span>
    	<div id="passwordStrengthDiv" class="is0"></div> 
    </div>
  </div>
    <div class="form-group">
    <label for="confirmPassword" class="col-sm-2 control-label">确认密码</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="confirmPassword" placeholder="确认密码">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-default btn-primary" data-toggle="modal" data-target="javascript:check()" id="sub">确认</button>
    </div>
  </div>
</form>
<!-- 修改密码结束 -->  			
</div>
		</div>
    </div>
    <!--网页尾部-->
    <br/>
    <br/>
        <br/>
    <br/>


    <%@ include file="/jsp/publicCode/bottom.jspf" %>
<!-- 弹出对话框开始 -->
<!-- Modal -->
<div class="modal fade" id="noteModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">密码修改提示消息</h4>
      </div>
      <div class="modal-body">
  		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
<!-- 弹出对话框结束 -->
  </body>
</html>
