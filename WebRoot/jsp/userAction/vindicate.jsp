<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="表白墙" content="说出你的爱">
	<%@ include file="/jsp/publicCode/commons.jspf" %>
<script type="text/javascript">
    $(function(){

        //先选出 textarea 和 统计字数 dom 节点
        var wordCount = $("#vindicateContent"),
            textArea = wordCount.find("textarea"),
            word = wordCount.find(".word");
        //调用
        statInputNum(textArea,word);

    });
    /*
    * 剩余字数统计
    * 注意 最大字数只需要在放数字的节点哪里直接写好即可 如：<var class="word">200</var>
    */
    function statInputNum(textArea,numItem) {
        var max = numItem.text(),
            curLength;
        textArea[0].setAttribute("maxlength", max);
        curLength = textArea.val().length;
        numItem.text(max - curLength);
        textArea.on('input propertychange', function () {
            numItem.text(max - $(this).val().length);
        });
    }
</script>
<script type="text/javascript">
    $(function(){
    	$("#sub").on('click',function(){
        	var $btn=$(this).button('loading');
            var textContext=/[%<>==&'\\]/;
        	var textArea=$("#content").val().trim();
        	var contentLength=textArea.length;
            if(textContext.test(textArea)) {   
               Dialog("您输入的表白内容包含特殊内容，请检查");
               $btn.button('reset');
               return;
        	}
           if(contentLength<=0){
        	   Dialog("亲，您还没有输入表白内容哦！");
        	   $btn.button('reset');
        	   return;
           }
			
           
           $("#formId").submit();
        });
    });

    </script>
   
	<style type="text/css">
		body{
			background-color：#F3F9FD;
			padding-top:100px;
		}
	</style>
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
  				<a href="${pageContext.request.contextPath}/jsp/userAction/vindicate.jsp" class="list-group-item active">&nbsp;<strong>表白一下</strong></a>
  				<a href="releaseInfo!toMyMessageUI.action" class="list-group-item">&nbsp;<strong>我的消息</strong></a>
  				<a href="${pageContext.request.contextPath}/jsp/userAction/modifyPwd.jsp" class="list-group-item">&nbsp;<strong>修改密码</strong></a>
			</div>
  			</div>
  			<!-- 右侧列表 -->
  			<div class="col-sm-9">
			<!-- 发布表白信息开始 -->
			<form class="form-horizontal" action="releaseInfo!vindicate.action" method="post" id="formId">
			<input type="hidden" name="vindicateInfo.id" value="${vindicateInfo.id}"/>
			<div class="form-group">
				<div class="col-sm-1"></div>
				<div class="col-sm-2"><label for="realName" class="control-label">表白对象真实姓名</label></div>				
				<div class="col-sm-5">
      			<input type="text" class="form-control" name="vindicateInfo.realName" value="${vindicateInfo.realName}" id="realName" placeholder="表白对象的真实姓名      (可不填写)"/>	
      			</div>
      			<div class="col-sm-2"></div>
  			</div>	
			<div class="form-group">
				<div class="col-sm-1"></div>
				<div class="col-sm-11" id="vindicateContent">
      			<textarea id="content" name="vindicateInfo.releaseContent" style="font-size:20px;width:650px;height:290px;" class="form-control" placeholder="温馨提示：请输入您的表白内容，字数限制在100字以内，与表白无关的内容会被管理员删除哦！"></textarea>
      			<span class="wordwrap" style="position:absolute; right: 180px; bottom: 6px;"><var class="word">100</var>/100</span>
      			</div>
  			</div>	
  				<div class="col-sm-1"></div>
				<div class="col-sm-11">
      			<button type="button" class="btn btn-default btn-primary" data-loading-text="处理中" id="sub" autocomplete="true">表白一下</button>
      			</div>
			</form>
			<!-- 发布表白信息结束 -->	
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
        <h4 class="modal-title" id="myModalLabel">发表表白提示</h4>
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
