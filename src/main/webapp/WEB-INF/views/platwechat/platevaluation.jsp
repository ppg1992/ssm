<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>回访信息</title>
    <link rel="stylesheet" href="${ctx}/static/wechat/css/mui.min.css"/>
     <link rel="stylesheet" href="${ctx}/font/iconfont.css" />
     <script src="${ctx}/static/wechat/js/mui.min.js"></script>
     <script src="${ctx}/static/wechat/js/jquery-1.11.3.js"></script>
     <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"> </script>
	 <script src="${ctx}/js/wxjssdk.js" type="text/javascript"></script>
     <script src="${ctx}/js/casenew.js"></script>
    <script type="text/javascript" charset="utf-8">
      	mui.init();
    </script>
    <style>
    	body{
    		background:white;
    	}
    .text-area-star {
        overflow: hidden;
        text-align: center;
    }

    .text-area-star label {
       float: left;
    width: 50px;
    height: 50px;
    font-size: 12px;
    text-align: center;
    line-height: 40px;
    margin: 0px 5px 14px 0px;
    cursor: pointer;
    color: #95A5A6;
    border-radius: 50%;
    }
    .text-area-star label input {
        filter: alpha(opacity=0);
        -moz-opacity: 0;
        opacity: 0;
        position: absolute;
    }
    .text-area-star label span {
        padding: 10px 10px 10px 10px;
        position: relative;
    }
    .red{
    	 color:red !important;
    }
    </style>
</head>
<body>
	<input type="hidden" id="ctx" value="${ctx}" />
	<input type="hidden" id="caseQueryNo" value="${caseQueryNo}"/>
	<input type="hidden" id="appId" value="${appId}"/>
	<div class="mui-input-group" style="margin-bottom:15px;">	
		<div class="content">
		   <div class="mui-input-row">
            <label style="font-weight:700;">救援信息</label>
          </div>
          <div class="mui-input-row" style="position:relative">
            <label>接收时间:</label>
            <label style="width:auto;" id="entryTime"></label>
          </div>
          <div class="mui-input-row">
            <label>派出时间:</label>
            <label style="width:auto;" id="beginTime"></label>
          </div>
          <div class="mui-input-row" style="border:none ! important;">
            <label >技师姓名:</label>
            <label style="width:auto;" id="driverName"></label>
          </div>
          <div class="mui-input-row" style="border:none ! important;">
            <label>技师车牌号:</label>
            <label style="width:auto;" id="driverCarNo"></label>
          </div>
          <div class="mui-input-row" style="border:none ! important;">
            <label >技师电话:</label>
            <label style="width:auto;" id="driverPhone"></label>
          </div>
        </div>
	 	</div>
	 	<div class="comment"  >
	 	<div style="width:58%;height:20px;margin:0 auto;">
	 		<span style="float:left;">【请对本次服务进行评价】</span>
	 	</div>
        <div class="text-area-star" style="width:80%;height:50px;margin:0 auto;">
	      <label class="red"><i class="iconfont icon-xingxing "></i></label>
	      <label class="red"><i class="iconfont icon-xingxing "></i></label>
	      <label class="red"><i class="iconfont icon-xingxing "></i></label>
	      <label class="red"><i class="iconfont icon-xingxing "></i></label>
	      <label class="red"><i class="iconfont icon-xingxing "></i></label>
	    </div>
        <div style="width:50%;height:20px;margin:0 auto;">
	 		<span style="float:left;">【请对技师进行评价】</span>
	 	</div>
	 	 <div style="width:90%;height:100px;margin:10px auto;">
	 	 	<textarea  rows="5" cols="20" class="text-area text-area-input" name="content" id="content" style="font-size:12px;line-height:20px;color:#848080;" placeholder="请您对技师的服务进行评价，您可以提出您对我司的建议或意见。"></textarea>
	 	 </div>
	 	</div>
		<nav class="mui-bar mui-bar-tab" >  
		    <button type="button" class="" id="submitBtn" style="border:none;background:#33B294;width:100%;color:#fff;font-size:18px;border-radius:0;">提&nbsp;&nbsp;交</button>
		</nav>
		
		<script>
		getWxConfig();
		
		$("#submitBtn").on("tap",function() {
			var degree = $('.text-area-star label.red').length;
			var content = $("#content").val();
			var caseQueryNo = $("#caseQueryNo").val();
			var appId = $("#appId").val();
			
			$.ajax({
				url:"${ctx}/platwechat/sendWechatEvaluation",
				type:"post",
				data:{"caseQueryNo":caseQueryNo,"appId":appId,"degree":degree,"remark":content},
				success:function(res) {
					console.log(res);
					var result = res.result;
					var msg = res.msg;
					if(result == "success") {
						mui.confirm('<p>感谢您的支持，再见！</p>',"提示",['确定'],function(e){
							if(e.index==0){
								//调用jssdk关闭微信页面
								colseWin();
							}
						});
					} else {
						mui.confirm('<p>'+msg+'</p>',"错误",['确定'],function(e){
							if(e.index==0){
								
							}
						});
					}
					
				},
				error:function(request) {
					mui.confirm('<p>服务器内部错误，请重试！</p>',"错误",['确定'],function(e){
						if(e.index==0){
							
						}
					});
				}
				
			});
			
			
		})
		
		$(function() {
			var caseQueryNo = $("#caseQueryNo").val();
			var appId = $("#appId").val();
			
			$.ajax({
				url:"${ctx}/platwechat/wxcaseinfoData",
				type:"post",
				dataType:"json",
				data:{"appId":appId,"caseQueryNo":caseQueryNo},
				success:function(res) {
					console.log(res);
					var caseInfo = res.caseInfo;
					var platCaseInfo = res.platCaseInfo;
					if($.trim(platCaseInfo)) {
						var entryTime = platCaseInfo.entryTime;
						if($.trim(entryTime)) {
							$("#entryTime").text(formatDate(entryTime));
						}
					}
					if($.trim(caseInfo)) {//案件信息不为空
						var beginTime = caseInfo.beginTimetrs;//派遣至驾驶员时间
						if($.trim(beginTime)) {
							$("#beginTime").text(beginTime);
						}
						
						var driverName = caseInfo.driverName;//驾驶员姓名
						if($.trim(driverName)) {
							$("#driverName").text(driverName);
						}
						
						var driverCarNo = caseInfo.rescueCarNo;
						if($.trim(driverCarNo)) {
							$("#driverCarNo").text(driverCarNo);
						}
						
						var driverPhone = caseInfo.driverPhone;
						if($.trim(driverPhone)) {
							$("#driverPhone").text(driverPhone);
						}
					}
				}
			});
		});
		
		
		function formatDate(now) {
			var time = new Date(now);
			var year=time.getFullYear(); 
			var month=time.getMonth()+1; 
			var date=time.getDate(); 
			var hour=time.getHours(); 
			var minute=time.getMinutes(); 
			var second=time.getSeconds(); 
			var result = year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
			//var result = month+"月"+date+"日"+hour+":"+minute+":"+second;
			return result; 
		}
		
		</script>
		
</body>
</html>