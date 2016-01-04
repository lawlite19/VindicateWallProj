<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>找回密码</title>
    <meta http-equiv="表白墙" content="说出你的爱">
	<!-- Bootstrap -->
	<%@ include file="/jsp/publicCode/commons.jspf"%>
  		<style type="text/css">
    	body{
    	padding-top:150px;
    	}
    	</style>
  	<script type="text/javascript">
	$(document).ready(
			function(){
				$("#sub").click(function(){
					if ($("#inputUserName").val() == "") {
						Dialog("请输入用户名",0);
						$("#inputUserName").focus();
						return;
						}
						if ($("#inputSafeAnswer").val() == "") {
							Dialog("请输入安全问题答案",0);
							$("#inputSafeAnswer").focus();
							return;
						}
					//var params=$("#userName").serializeArray();
					$.ajax({
						url:"checkUserName!findPasswordTrue.action",
						type:"post",
						dataType:"json",
						data:{userName:$("#inputUserName").val(),
							safeQuestion:$("#safeQuestion").val(),
							safeAnswer:$("#inputSafeAnswer").val()},
						success:function(data) {  
			            var json = eval("("+data+")");  
			            var str=json.name;
			            if(str=="true")
			            	$("#formId").submit();
			            else
			    			Dialog(str,0);
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
  	<%@include file="/jsp/publicCode/top.jspf" %>
  	<div class="container">
  		<div class="row">
  			<div class="col-sm-2"></div>
  			
  			<div class="col-sm-8">
  				<form class="form-horizontal" action="mlogin!findPassword.action" method="post" id="formId">
  		<div class="form-group">
    		<label for="inputUserName" class="col-sm-2 control-label" >用户名</label>
    		<div class="col-sm-10">
      		<input type="text" class="form-control" id="inputUserName" name="user.userName" placeholder="用户名"/>
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="safeQuestion" class="col-sm-2 control-label">安全问题</label>
    		<div class="col-sm-10">
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
    		<label for="inputSafeAnswer" class="col-sm-2 control-label">问题答案</label>
    		<div class="col-sm-10">
      		<input type="text" class="form-control" name="user.safeAnswer" id="inputSafeAnswer" placeholder="问题答案"/>
    		</div>
 		</div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button"  class="btn btn-success" id="sub">下一步</button>
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
