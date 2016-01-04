<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hhit.entity.TUser" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="/jsp/publicCode/commons.jspf" %>
	<script type="text/javascript" src="${pageContext.request.contextPath}/common/My97DatePicker/WdatePicker.js"></script>
	<style type="text/css">
		body{
			padding-top:100px;
		}
	</style>
	<script type="text/javascript">
    $(function(){
	$("#subPersonInfo").click(function(){
    		var $btn=$(this).button('loading');
			//var isEmail = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
			var isQQ=/^[0-9]*$/;
			var isPhoneNum=/^1[3|5|7|8|][0-9]{9}$/;
			var qq=$("#qq").val();
			var telphone=$("#userTelphone").val();
			if(qq!=""){
				if(!(isQQ.test(qq))){
					Dialog("您输入的QQ号码格式不正确！");
					$("#qq").focus();
					$btn.button('reset');
					return;
				}
			}
			if(telphone!=""){
				if(!(isPhoneNum.test(telphone))){
					Dialog("您输入的手机号码格式不正确！");
					$("#telphone").focus();
					$btn.button('reset');
					return;
				}
			}

			$("#formId10").submit();
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
  				<a href="${pageContext.request.contextPath}/jsp/userAction/personalInfoIndex.jsp" class="list-group-item active">
   				 &nbsp;<strong>个人信息</strong>
   				 </a>
  				<a href="releaseInfo!queryMyVindication.action" class="list-group-item">&nbsp;<strong>我的表白</strong></a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/vindicate.jsp" class="list-group-item">&nbsp;<strong>表白一下</strong></a>
  				<a href="releaseInfo!toMyMessageUI.action" class="list-group-item">&nbsp;<strong>我的消息</strong></a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/modifyPwd.jsp" class="list-group-item">&nbsp;<strong>修改密码</strong></a>
			</div>
  			</div>
  			<!-- 右侧列表 -->
  			<div class="col-sm-9">
<!-- 个人信息开始 -->
<form class="form-horizontal" action="manageUserInfo!savaUserInfo.action" method="post" id="formId10">
  <div class="form-group">
    <label for="userName" class="col-sm-2 control-label">用户名</label>
    <div class="col-sm-10">
      <input type="text" readonly="readonly" class="form-control" name="personInfo.userName" value="${user.userName}" id="userName" placeholder="用户名">
    </div>
  </div>
  <div class="form-group">
    <label for="realName" class="col-sm-2 control-label">真实姓名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="personInfo.realName" value="${user.realName}"  id="realName" placeholder="真实姓名">
    </div>
  </div>
  <div class="form-group">
    <label for="" class="col-sm-2 control-label">性别</label>
    <div class="col-sm-10">
      <c:if test="${user.sex=='男'}">
    	<input type="radio" value="男" name="personInfo.sex" checked= "checked"/>男
    	 &nbsp;&nbsp;&nbsp;<input type="radio" value='女' name="personInfo.sex"/>女
    	</c:if>
    	<c:if test="${user.sex=='女'}">
    	<input type="radio" value="男" name="personInfo.sex" />男&nbsp;&nbsp;&nbsp;
    	 <input type="radio" value='女' name="personInfo.sex"checked= "checked"/>女
    	</c:if><br/>
    </div>
  </div>
  <div class="form-group">
    <label for="email" class="col-sm-2 control-label">邮箱</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" name="personInfo.email" value="${user.email}" id="email" placeholder="邮箱">
    </div>
  </div>
  <div class="form-group">
    <label for=""birthday"" class="col-sm-2 control-label">生日</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="birthday" name="personInfo.birthday" value="${user.birthday}" placeholder="生日" onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',startDate:'1993-01-01'})">
    </div>
  </div>
  <div class="form-group">
    <label for="qq" class="col-sm-2 control-label">QQ</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="qq" name="personInfo.qq" value="${user.qq}" placeholder="QQ号码">
    </div>
  </div>
  <div class="form-group">
    <label for="userTelphone" class="col-sm-2 control-label">手机号码</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="userTelphone" name="personInfo.telphone" value="${user.telphone}" placeholder="手机号码">
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-default btn-primary" data-loading-text="处理中..." id="subPersonInfo" autocomplete="off">确认</button>
    </div>
  </div>
</form>
<!-- 个人信息结束 -->			
</div>
		</div>
    </div>
    <!--网页尾部-->
    <br/>

    <%@ include file="/jsp/publicCode/bottom.jspf" %>
    
    <!-- 弹出提示的模态框开始 -->
<!-- Modal -->
<div class="modal fade" id="noteModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">个人信息维护提示</h4>
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
