<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>案件列表</title>
    <link rel="stylesheet" href="${ctx}/static/wechat/css/mui.min.css"/>
    <script src="${ctx}/static/wechat/js/jquery-1.11.3.js"></script>
    <script src="${ctx}/static/wechat/js/mui.min.js"></script>
    <script src="${ctx}/js/jquery.more.js"></script>
    <script src="${ctx}/js/wxcaselist.js"></script>
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
    		margin:10px auto 66px auto
    		;
    	}
    	.blocksearch{
    		width:100%;
    		height:auto;
    		border:2px solid #e0e0e0;
    		border-radius: 10px;
    		margin-bottom:10px;
    	}
    	.active{
    		color:#33B294;
    	}
    	.block{
    		width:100%;
    		height:200px;
    		border:2px solid #e0e0e0;
    		border-radius: 10px;
    		margin-bottom:10px;
    	}
    </style>
</head>
<body>
	<form action="${ctx}/platwechat/wxcaselist" method="post">
	<input type="hidden" id="state" name="state" value="${appId}"/>
	<input type="hidden" id="ctx" value="${ctx}"/>
	<input type="hidden" id="userid" name="userid" value="${wechatUser.id}"/>
	<input type="hidden" id="pid" name="pid" value="${pid}"/>
	<input type="hidden" id="servicetype" name="servicetype" value="${servicetype}"/>
	<div class="" style="margin-top:44px;margin-bottom:50px;">	
		<div class="content">
			<div class="blocksearch">
			 	<ul>
					<li style="padding:5px;">
						<label>开始日期：</label>
						<input type="date" id="sbeginTime" name="sbeginTime" class="mui-input-clear"  placeholder="" style="width:62%;" value="${sbeginTime}">
					</li>
					<li style="padding:5px;">
						<label>截止日期：</label>
						<input type="date" id="sendTiem" name="sendTiem" class="mui-input-clear"  placeholder="" style="width:62%;" value="${sendTiem}">
					</li>
					<li style="padding:5px;">
						<label>开始地址：</label>
						<input type="text" id="address" name="address" class="mui-input-clear"  placeholder="" style="width:62%;" value="${address}">
					</li>
					<li style="padding:5px;">
						<label style="float:left;">服务类型：</label>
						<label id="cofor">
							<span  class="mui-table-view-cell" style="display:inline-block;padding:0px 2px 10px 4px;cursor:pointer;">请选择服务项目</span>
					    </label>
					</li>
					<li style="padding:5px;">
						<label>案件编号：</label>
						<input type="text" id="caseno" name="caseno" class="mui-input-clear"  placeholder="" style="width:62%;" value="${caseno}">
					</li>
					<button type="submit" class="" style="background:#33B294;border:none;color:white;width:49%;height:35px;">查询</button>
					<button type="button" class="" style="background:#33B294;border:none;color:white;width:49%;height:35px;" onclick="refresh()">重置</button>
				</ul>
			 </div>
				<div id="more" >
        			<div class="single_item" style="width:100%;margin:auto;">
             			 <div class="content" style="width:100%;margin:0;">
             			 </div>
       				</div>
      				<a href="javascript:;" class="get_more footer">点击加载更多内容</a>   
  				</div> 
	 	</div>
	 	<div id="severs" class="severs" style="position:absolute;top:85px;left:0; width:100%;height:auto;z-index:10; display: none;">
				<div class="contents" style=" width:90%;margin:0 auto;">
					<div id="" style="background:#33B294;width:100%;height:44px;color:#fff;border-radius:5px 5px 0 0;text-align: center;line-height: 44px;">服&nbsp;&nbsp;务&nbsp;&nbsp;类&nbsp;&nbsp;型</div>
					<div class="mui-content"  style="background:#fff;width:100%;color:#000;border:2px solid #33B294;text-align: center;cursor:pointer;">
					    <div class="mui-row">
					        <!-- <div class="mui-col-sm-6 mui-col-xs-12 function active">
					            <span class="mui-table-view-cell " style="display:inline-block;padding:0 2px 10px 4px;background:none;">
					                	拖车-故障         
					            </span>
					        </div> -->
					        <c:forEach items="${serviceTypemap}" var="map">
									<div class="mui-col-sm-6 mui-col-xs-12 function" id="${map.key}">
						            <span class="mui-table-view-cell " style="display:inline-block;padding:0 2px 10px 4px;background:none;">     
						                  	 <input type="hidden" class="serviceType" value="${map.key}">
						                  	 ${map.value}
						            </span>
						        	</div>
					        </c:forEach>
					    </div>
					</div>
				</div>		
			</div>
	</div>
	</form>
	<nav class="mui-bar mui-bar-tab" >  
	    <button type="button" class="" onclick="history.back(); " style="border:none;background:#33B294;width:100%;color:#fff;font-size:18px;border-radius:0;">返&nbsp;&nbsp;回</button>
	</nav>
</body>
<script type="text/javascript">
/*刷新页面  */
function refresh(){ 
	var ctx = $('#ctx').val();
	var state = $('#state').val();
	var userid = $('#userid').val();
	var url = ctx+"/wechat/wxcaselist?state="+state+"&userid="+userid;
	location.href=url;
}


/* $("#submitBtn").on("tap",function(){
	var sbeginTime = $("#sbeginTime").val();
	var sendTiem = $("#sendTiem").val();
	var address = $("#address").val();
	
}); */


</script>
</html>