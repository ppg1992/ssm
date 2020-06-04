<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>案件查询</title>
    <link rel="stylesheet" href="${ctx}/static/wechat/css/mui.min.css"/>
    <script src="${ctx}/static/wechat/js/jquery-1.11.3.js"></script>
    <script src="${ctx}/static/wechat/js/mui.min.js"></script>
    <script type="text/javascript" charset="utf-8">
      	mui.init();
    </script>
    <style>
    	body{
    		background:white;
    		font-family: "微软雅黑";
    	}
    	ul,li{
    		text-decoration: none;
    		list-style-type: none;
    		padding:0 15px;
    	}
    	.content{
    		width:90%;
    		height:auto;
    		margin:40px auto;
    	}
    	.blocksearch{
    		width:100%;
    		height:auto;
    		border:2px solid #e0e0e0;
    		border-radius: 10px;
    		margin-bottom:10px;
    	}
    </style>
</head>
<body>
	<input type="hidden" id="ctx" value="${ctx}">
	<form method="POST">
	<input type="hidden" id="appId" name="appId" value="${appId}">
	<div class="" style="margin-top:20px;margin-bottom:50px;">	
		<div class="content">
			<div class="blocksearch">
			 	<ul>
					<li style="padding:5px;">
						<label>案件查询号:</label>
						<input id="caseQueryNo"	required="required"  name="caseQueryNo"	value="${caseQueryNo}" style="width:62%;" type="text" class="mui-input-clear"	placeholder="请输入查询案件号">
					</li>
					<button type="submit" id="copyBtn" style="background:#33B294;border:none;color:white;width:49%;height:35px;">复制</button>
					<button type="button" class="" style="background:#33B294;border:none;color:white;width:49%;height:35px;" onclick="refresh()">重置</button>
				</ul>
			 </div>
	 	</div>
	</div>
	</form>
</body>
<script type="text/javascript">
function refresh(){ 
	var state = $('#caseQueryNo').val('');
}
$("#copyBtn").on("tap",function() {
	alert("test")
})

</script>
</html>