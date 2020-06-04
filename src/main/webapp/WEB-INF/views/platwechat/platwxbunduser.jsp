<%@ page contentType="text/html;charset=UTF-8" %> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
  <head>
    <title>绑定客户</title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
	<link rel="stylesheet" href="${ctx}/static/wechat/css/mui.min.css"/>
    <script src="${ctx}/static/wechat/js/jquery-1.11.3.js"></script>
    <script src="${ctx}/static/wechat/js/mui.min.js"></script>
<link rel="stylesheet"	href="${ctx}/static/wechat/css/bootstrap.css" />

<style>
ul,li{
padding:0;
margin:0;
list-style-type: none;
}

</style>
  </head>
  <body >
  	 <input type="hidden" id="ctx" value="${ctx}"/>
   
    <form id="wxbunduserform"    class="form-horizontal" action="#"  method="POST">
		<input type="hidden" id="appId" name="appId" value="${wechatInfo.appId}">
		<input type="hidden" id="wechatuserid" name="wechatuserid" value="${wechatUser.id}"><!--${wechatUser.id}  -->
	<ul class="sy_seven">
	 	 <c:choose>
			<c:when test='${havebund=="yes"}'>
				<li style="width:100%;background:#ECDD11;font-size:12px;"><span><font color="#464343;">您已经和客户:${wechatUser.customeName}
					进行了绑定,再次绑定将会建立新的绑定。</font></span></li>
		 </c:when> 
		</c:choose> 
		<div class="contents" style="margin:0 auto;width:90%;">
		
		<input id="loginname" name="loginname" type="text"	class="mui-input-clear" placeholder="帐号"
					style="width:100%;padding:0 8px;font-family: '微软雅黑';color:#999;font-size:15px;height:45px;margin-top:10px;border-radius:6px;">
			<input id="loginpwd" name="loginpwd" type="password"
					class="mui-input-clear" placeholder="密码"
					style="width:100%;padding:0 8px;font-family: '微软雅黑';color:#999;font-size:15px;height:45px;border-radius:6px;">
	  		</div>
			</ul>
	 <div class="buttom">
				<button onclick="sendbunduser();" type="button" class="btn "
					style="position:absolute;bottom:0;left:0;width:100%;height:44px;background:#34495e; color:white; font-family: '微软雅黑';">立即绑定</button>
			</div>
	</form>
	<!--尾部 结束-->
     
    <script src="${ctx}/js/jweixin-1.0.0.js" type="text/javascript"></script>
  	<script src="${ctx}/js/wxjssdk.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	$(document).ready(function () {
		getWxConfig();
		 
	});

	function sendbunduser(){
		var ctx = $('#ctx').val();
		var bunduserurl=ctx+"/platwechat/sendbunduser";
		var loginname = $.trim($('#loginname').val());
		var loginpwd = $.trim($('#loginpwd').val());
		var appId = $('#appId').val();
		var wechatuserid = $('#wechatuserid').val();
		
		
		if(!loginname) {
			mui.alert('账号为空！');
			return;
		}
		
		if(!loginpwd) {
			mui.alert('密码为空！');
			return;
		}
		
		if(!appId) {
			mui.alert('访问页面出错(appId为空)，请尝试关闭页面重新进入！');
			return;
		}
		
		if(!wechatuserid) {
			mui.alert('访问页面出错(wechatuserid为空)，请尝试关闭页面重新进入！');
			return;
		}
		$.ajax({
	        type: "POST",
	        url:bunduserurl,
	        data:{"loginname":loginname,"loginpwd":loginpwd,"appId":appId,"wechatuserid":wechatuserid},
	        error: function(request) {
	            mui.alert("服务器内部错误！");
	        },
	        success: function(data) {
	        	console.log(data);
	        	var result = data.result;
	        	var msg = data.msg;
	        	if(data.result=="success"){
	        		mui.alert("恭喜您！绑定成功！");
	        		closeWin();
	        	}else{
	        		mui.alert(msg);
	        	}
	           
	        }
	    });
		 
	}
	
	</script>
	
	
	
 
  </body>
</html>

