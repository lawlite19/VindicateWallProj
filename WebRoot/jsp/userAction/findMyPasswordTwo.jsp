<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hhit.entity.TUser" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>重置密码</title>
    <meta http-equiv="表白墙" content="说出你的爱">
    <link href="${pageContext.request.contextPath}/script/skin/style.css" type="text/css" rel="Stylesheet" />
      	<link href="${pageContext.request.contextPath}/script/skin/layer.css" type="text/css" rel="Stylesheet" />
  	<%@ include file="/jsp/publicCode/commons.jspf" %>
  	<script src="${pageContext.request.contextPath}/script/layer.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery.passwordStrength.js"></script>
  	<style type="text/css">
    	body{
    	padding-top:150px;
    	}
   </style>
    <!-- 密码强度提示 -->
  	<script type="text/javascript">
    $(function(){
        $('#password').passwordStrength(); 
        }); 
    </script>
    <script type="text/javascript">
    $(document).ready(
			function(){
				$("#sub").click(function(){
					if ($("#password").val() == ""
						|| $("#password").val().length > 20||$("#password").val().length < 6) {
						Dialog("密码长度在6-20位",0);
						$("#password").focus();
						return;
					}
    			if ($("#password").val() != $("#confirmPassword").val()) {
                    Dialog("两次密码输入不一致！",0) ;
                    $("#confirmPassword").focus();
    			}
    			else
    				$("#formId").submit();
				});
				});
    </script>
  </head>
  <body>
  		<!-- 网页头部 -->
    	<%@include file="/jsp/publicCode/top.jspf" %>
  	<div class="container">
  		<div class="row">
  			<div class="col-sm-2"></div>
  			
  			<div class="col-sm-8">
  				<form class="form-horizontal" action="mlogin!updatePassword.action" method="post" id="formId">
  		<input type="hidden" name="user.id" value="${user.id}"/>
  		
  		<div class="form-group">
    		<label for="password" class="col-sm-2 control-label" >新密码</label>
    		<div class="col-sm-10">
      		<input type="password" class="form-control" id="password" name="user.password" placeholder="密码"/>
    		<br/>
    		<span style="display:none;" id="spanValidatePassword"></span>
    		<div id="passwordStrengthDiv" class="is0"></div> 
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="confirmPassword" class="col-sm-2 control-label">确认密码</label>
    		<div class="col-sm-10">
      		<input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="确认密码"/>
    		</div>
 		</div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-default btn-success" id="sub">重置密码</button>
    </div>
  </div>
</form>
  			</div>
  			
  			<div class="col-sm-2"></div>
		</div>
  	</div>
  	
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<!-- 网页尾部 -->
<%@include file="/jsp/publicCode/bottom.jspf" %>
<!-- 弹出提示的模态框开始 -->
<!-- Modal -->
<div class="modal fade" id="noteModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">找回密码提示</h4>
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
  </body>
</html>
