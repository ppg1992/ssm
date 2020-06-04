<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>回访信息</title>
    <link rel="stylesheet" href="${ctx}/static/wechat/css/mui.min.css"/>
     <link rel="stylesheet" href="${ctx}/font/iconfont.css" />
     <link rel="stylesheet" href="${ctx}/static/wechat/css/weui.css" />
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
<div id="loadingToast" class="weui_loading_toast" style="display:none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toast">
        <div class="weui_loading">
            <!-- :) -->
            <div class="weui_loading_leaf weui_loading_leaf_0"></div>
            <div class="weui_loading_leaf weui_loading_leaf_1"></div>
            <div class="weui_loading_leaf weui_loading_leaf_2"></div>
            <div class="weui_loading_leaf weui_loading_leaf_3"></div>
            <div class="weui_loading_leaf weui_loading_leaf_4"></div>
            <div class="weui_loading_leaf weui_loading_leaf_5"></div>
            <div class="weui_loading_leaf weui_loading_leaf_6"></div>
            <div class="weui_loading_leaf weui_loading_leaf_7"></div>
            <div class="weui_loading_leaf weui_loading_leaf_8"></div>
            <div class="weui_loading_leaf weui_loading_leaf_9"></div>
            <div class="weui_loading_leaf weui_loading_leaf_10"></div>
            <div class="weui_loading_leaf weui_loading_leaf_11"></div>
        </div>
        <p class="weui_toast_content">评价中，请稍后</p>
    </div>
</div>
	<input type="hidden" id="ctx" value="${ctx}" />
	<div class="mui-input-group" style="margin-bottom:15px;">	
		<div class="content">
		   <div class="mui-input-row">
            <label style="font-weight:700;">救援信息</label>
          </div>
          <div class="mui-input-row" style="position:relative">
            <label>接收时间:</label>
            <label style="width:auto;" id="entryTime">
	            <c:if test="${not empty sfcasedata.entryTime}">
		            <jsp:useBean id="entryTimee" class="java.util.Date"/>
					<jsp:setProperty name="entryTimee" property="time" value="${sfcasedata.entryTime}"/>
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${entryTimee}"/> 
				</c:if>
            </label>
          </div>
          <div class="mui-input-row">
            <label>派出时间:</label>
            <label style="width:auto;" id="beginTime">
				<c:if test="${not empty sftaskdata.trscStm}">
		            <jsp:useBean id="trscStm" class="java.util.Date"/>
					<jsp:setProperty name="trscStm" property="time" value="${sftaskdata.trscStm}"/>
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${trscStm}"/> 
				</c:if>
			</label>
          </div>
          <div class="mui-input-row" style="border:none ! important;">
            <label >技师姓名:</label>
            <label style="width:auto;" id="driverName">${sftaskdata.trscDriverName}</label>
          </div>
          <div class="mui-input-row" style="border:none ! important;">
            <label>技师车牌号:</label>
            <label style="width:auto;" id="driverCarNo">${sftaskdata.trscCarNumber}</label>
          </div>
          <div class="mui-input-row" style="border:none ! important;">
            <label >技师电话:</label>
            <label style="width:auto;" id="driverPhone">${sftaskdata.trscDriverPhone}</label>
          </div>
        </div>
	 	</div>
	 	<form id="platevaluationForm" action="#" method="post">
	 		<input type="hidden" id="caseId" name="caseId" value="${sfcasedata.id }" />
	 		<input type="hidden" id="serviceScore" name="serviceScore" value="" />
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
		 	 	<textarea  rows="5" cols="20" class="text-area text-area-input" name="remark" id="remark" style="font-size:12px;line-height:20px;color:#848080;" placeholder="请您对技师的服务进行评价，您可以提出您对我司的建议或意见。"></textarea>
		 	 </div>
		 	</div>
	 	</form>
		<nav class="mui-bar mui-bar-tab" >  
		    <button type="button" class="" id="submitBtn" style="border:none;background:#33B294;width:100%;color:#fff;font-size:18px;border-radius:0;">提&nbsp;&nbsp;交</button>
		</nav>
		
		<script>
		/* getWxConfig(); */
		
		$("#submitBtn").on("tap",function() {
			var degree = $('.text-area-star label.red').length;
			$("#serviceScore").val(degree);
			$('#loadingToast').show();
			var ctx = $('#ctx').val();
			$.ajax({
				url:"${ctx}/speed/addPlatevaluation",
				type:"post",
				data:$('#platevaluationForm').serialize(),
				success:function(res) {
					$('#loadingToast').hide();
					var result = res.result;
					var msg = res.msg;
					if(result == "success") {
						alert("评价成功，感谢您的支持！");
						/* //window.location.href = ctx +"/speed/getSFCaseDetail?id="+$("#caseId").val(); */
						closeWin();
					} else {
						alert("错误："+msg);
					}
				},
				error:function(request) {
					alert("服务器内部错误，请重试！");
				}
				
			});
			
			
		})
		</script>
		
</body>
</html>