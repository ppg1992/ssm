<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link href="${ctx}/static/wechat/css/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wechat/css/ace.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/wechat/css/bootstrap.css"/>
    <script src="${ctx}/static/wechat/js/mui.min.js"></script>
    <script src="${ctx}/static/wechat/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" charset="utf-8">
      	mui.init();
    </script>
    <style>
    	body{
    		background:white;
    		font-size:15px;
    		font-family:微软雅黑;
    	}
    	label{
    		font-size:15px;
    		color:#6B6A6A;
    	}
    	ul,li,a{
    		text-decoration: none;
    		list-style-type: none;
    	}
    	a:hover{
			text-decoration:none;
			}
    	input{
    		font-size:15px;
    	}
    	.active{
    		color:#33B294;
    	}
    </style>
</head>
<body>
		<input type="hidden" value="${appId}" id="appId"/>
		<input type="hidden" value="${caseQueryNo}" id="caseQueryNo"/>
		<input type="hidden" id="pid"/>
		<div class="mui-off-canvas-wrap mui-draggable mui-slide-in "  id="actionfon">
		  <aside class="mui-off-canvas-left mui-transitioning" id="offCanvasSide" style="background:#fff;cursor:pointer;">
		    <div class="mui-scroll-wrapper">
		      <div class="mui-scroll">
		        <ul class="mui-table-view">
		                <li class="mui-table-view-cell" id="anjianmessage">
		                    <a class="mui-navigate-right" >
		                        	派遣信息
		                    </a>
		                </li>
		                <li class="mui-table-view-cell" id="dynamicinformation">
		                    <a class="mui-navigate-right">
		                        	 案件信息
		                    </a>
		                </li>
		                <li class="mui-table-view-cell" id="Jobphoto">
		                    <a class="mui-navigate-right">
		                        	时间轴
		                    </a>
		                </li>
		                <li class="mui-table-view-cell" id="routeDetail">
		                    <a class="mui-navigate-right">
		                        	路程详情
		                    </a>
		                </li>
		            </ul>
		      </div>
		    </div>
		  </aside>
		  <div class="mui-inner-wrap">
			    <header id="header" class="mui-bar mui-bar-nav" style="background:#33B294;color:#fff;">
		   			<a class="mui-icon mui-action-menu mui-icon-bars mui-pull-left" href="#offCanvasSide" style="color:white;"></a>
		   		 	<h1 class="mui-title" style="color:#fff;font-size:20px;">派遣信息</h1>
		   		 	
		   		 	<!-- http://eip.yuantongjy.mycjj.com/eipots/searchGps.html?caseQueryNo=$("#caseQueryNo").val() -->
		   		 	
				</header>
<<<<<<< .mine
				<h1 class="mui-title mui-title1" style="top:40px;right:0;margin:0;height:100%;z-index:3"><iframe src="http://www.baidu.com" width="100%" height="100%" ></iframe></h1>
=======
				<h1 class="mui-title mui-title1" style="top:40px;right:0;margin:0;height:100%;z-index:3"><iframe src="about:blank" width="100%" height="100%" ></iframe></h1>
>>>>>>> .r475
			    <!-- <nav class="mui-bar mui-bar-tab" >  
		   		 <button type="button" class="" style="border:none;background:#33B294;width:100%;color:#fff;font-size:18px;border-radius:0;">返&nbsp;&nbsp;回</button>
				</nav> -->
			    <div class="mui-content mui-scroll-wrapper">
			      <div class="mui-scroll" >
			        <div class="mui-input-group messagetoase" > 
			            <div class="mui-input-row">
			                <label>接收时间</label>
			                <div>
						    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="entryTime">
								          <%-- ${caseInfo.entryTime} --%>
								</li>
						    </div>
			            </div>
			            <div class="mui-input-row">
			                <label>派出时间</label>
			                <div>
						    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="beginTime">
								           <%-- ${taskInfo.beginTime} --%>
								</li>
						    </div>
			            </div>
			            <div class="mui-input-row">
					        <label>预计到达</label>
					        <div>
						    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="expectedRescueTime">
								         <%-- ${taskInfo.expectTime}分钟  <span>/</span> ${taskInfo.expectCommunicateTime} --%>
								</li>
						    </div>
					    </div>
					     <div class="mui-input-row" style="display:none;" id="driverAddress">
				       	 	<label>技师位置</label>
				        	<div>
						    	<li class="mui-table-view-cell" style="padding:11px 2px; color:#0088FF;">
								          点击进入查看驾驶员信息
								</li>
						    </div>
				    	</div>
					    <div class="mui-input-row">
					        <label>技师姓名</label>
					        <div>
						    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="driverName">
									<%-- ${taskInfo.driverName} --%>
								 </li>
						    </div>
					    </div>
					    <div class="mui-input-row">
					        <label class="" >技师车牌号</label>
					        <div>
						    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="driverCarNo">
									<%-- ${taskInfo.carPlate} --%>
								</li>
						    </div>
					    </div>
					    <div class="mui-input-row" style="position:relative">
						    <label>联系电话</label>
						    <div>
						    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="driverPhone">
									<%-- ${taskInfo.driverPhone} --%>
								</li>
						    </div>
						 </div>
						 
						 <div class="mui-input-row" style="position:relative;display:none;" id="wechatEvaluation">
							    <label>回访</label>
							    <div>
							    	<li class="mui-table-view-cell" style="padding:11px 2px; color:#0088FF;" id="wechatEvaluationLi">
								        	点击进入回访
									</li>
							    </div>
							 </div>
			        </div>
			        <div class="dongtaimessage"  style="display:none;">
			        	<div class="mui-input-group" > 
				            <div class="mui-input-row" >
				                <label>案件查询号</label>
				                <div>
							    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="caseQueryNoShow">
										<%-- ${caseInfo.caseNumber} --%>
									</li>
							    </div>
				            </div>
				            <div class="mui-input-row">
				                <label>现场联系人</label>
				                <div>
							    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="rescueLinkman">
									 	<%-- ${caseInfo.rescueLinkman} --%>
									</li>
							    </div>
				            </div>
				            <div class="mui-input-row">
						        <label>联系电话</label>
						        <div>
							    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="rescuePhone">
										<%-- ${caseInfo.rescuePhone} --%>
									</li>
							    </div>
						    </div>
						     <div class="mui-input-row">
					       	 	<label>被救援车牌号</label>
					        	<div>
							    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="carPlate">
										<%-- ${caseInfo.carPlate} --%>
									</li>
							    </div>
					    	</div>
						    <div class="mui-input-row">
						        <label>救援地点</label>
						        <div>
							    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="rescueAddress">
										<%-- ${caseInfo.rescueAddress} --%>
									</li>
							    </div>
						    </div>
						    <div class="mui-input-row">
						        <label>目的地</label>
						        <div>
							    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="desAddress">
									   	<%-- ${caseInfo.desAddress} --%>
									 </li>
							    </div>
						    </div>
						    <div class="mui-input-row" style="position:relative">
							    <label>服务类型</label>
							    <div>
							    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="serviceName">
									 	<%-- ${caseInfo.serviceName} --%>
									</li>
							    </div>
							 </div>
							 <%-- <div class="mui-input-row">
						        <label>服务费-现金</label>
						       	<div>
							    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="serviceFeesCash">
									 	${caseInfo.serviceFeesCash}
									</li>
							    </div>
						    </div>
						    <div class="mui-input-row">
						        <label>服务费-月结</label>
						       	<div>
							    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="serviceFeesCredit">
										${caseInfo.serviceFeesCredit}
									</li>
							    </div>
						    </div>
						    <div class="mui-input-row">
						        <label>发票抬头</label>
						        <div>
							    	<li class="mui-table-view-cell" style="padding:11px 2px;" id="billTitle">
										${caseInfo.billTitle}
									</li>
							    </div>
						    </div> --%>
			        </div>
			        </div>
			        <div class="photomessage" style="display:none;">
			        	<div class="timeline-container timeline-style2">
							<div class="timeline-items" id="timeItems">
								<%-- <c:forEach items="${operateList}" var="userOperatelist">
									<div class="timeline-item clearfix">
										<div class="timeline-info" style="overflow:hidden;">
											<span class="timeline-date"  style="width:auto;margin-right:15px;font-size:15px;">
												${userOperatelist.operateTimeStr}
											</span>
											<i class="timeline-indicator btn btn-info no-hover"></i>
										</div>
										<div class="widget-box transparent">
											<div class="widget-body">
												<div class="widget-main no-padding" style="font-size:16px;">
													${userOperatelist.content}
													<div class="space-2"> </div>
												</div>
											</div>
										</div>
									</div>									
								</c:forEach> --%>
							</div>
						</div>
			        </div>
			      </div>
			    </div>  
		   		<div class="mui-off-canvas-backdrop"></div>
		  </div>
		</div>
</body>

<script >
mui('.mui-scroll-wrapper').scroll();
$('.mui-title1').hide();
	/*详细动态*/
	$("#anjianmessage").on('tap',function(){
		$(".messagetoase").show();
		$(".dongtaimessage").hide();
		$(".photomessage").hide();
		$('.mui-title1').hide();
		$("#actionfon").removeClass('mui-active');
		$("#offCanvasSide").css({
			'visibility':'visible',
			'transform': 'translate3d(-290px, 0px, 0px)'
		});
		$('#header h1').eq(0).html($('#anjianmessage a').html() );
	});
	$("#dynamicinformation").on('tap',function(){
		$(".messagetoase").hide();
		$(".dongtaimessage").show();
		$(".photomessage").hide();
		$('.mui-title1').hide();
		$("#actionfon").removeClass('mui-active');
		$("#offCanvasSide").css({
			'visibility':'visible',
			'transform': 'translate3d(-290px, 0px, 0px)'
		});
		$('#header h1').eq(0).html($('#dynamicinformation a').html() );
	});
	$("#Jobphoto").on('tap',function(){
		$(".messagetoase").hide();
		$(".dongtaimessage").hide();
		$('.mui-title1').hide();
		$(".photomessage").show();
		$("#actionfon").removeClass('mui-active');
		$("#offCanvasSide").css({
			'visibility':'visible',
			'transform': 'translate3d(-290px, 0px, 0px)'
		});
		$('#header h1').eq(0).html($('#Jobphoto a').html() );
	}); 
	$("#routeDetail").on('tap',function(){
		$(".messagetoase").hide();
		$(".dongtaimessage").hide();
		$(".photomessage").show();
		$("#actionfon").removeClass('mui-active');
		$("#offCanvasSide").css({
			'visibility':'visible',
			'transform': 'translate3d(-290px, 0px, 0px)'
		});
		$('#header h1').eq(0).html($('#routeDetail a').html() );//通过caseQueryNo获取案件编号
		$('.mui-title1 iframe').attr("src","http://eip.yuantongjy.com/eipots/searchGps.html?caseQueryNo="+$("#caseQueryNo").val());
		//$('.mui-title1 iframe').attr("src","http://www.baidu.com");
		$('.mui-title1').show();
		//$('#header h1').html("<a href='http://eip.yuantongjy.mycjj.com/eipots/searchGps.html?caseQueryNo="+$("#caseQueryNo").val()>+"</a >") //跳转到对应网址
	});
  
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
				console.log(platCaseInfo);
				
				if($.trim(caseInfo)) {//案件信息不为空
					var beginTime = caseInfo.beginTimetrs;//派遣至驾驶员时间
					if($.trim(beginTime)) {
						$("#beginTime").text(beginTime);
					}
					
					var expectCommunicateTime = caseInfo.expectCommunicateTime;//预计到达时间
					if($.trim(expectCommunicateTime)) {
						$("#expectedRescueTime").text(formatDate(expectCommunicateTime));
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
					
					var status = caseInfo.status;//案件状态为任务中才能显示驾驶员位置
					var pid = res.pid;
					var caseQueryNo = $("#caseQueryNo").val();
					if(status == "6") {
						$("#driverAddress").css("display","block");
						$("#driverAddress").on("tap",function() {
							location.href = "${ctx}/map/getMap?caseQueryNo="+caseQueryNo+"&pid="+pid;
						});
					} else {
						$("#driverAddress").css("display","none");
					}
					
					if(status == "7") {
						$("#wechatEvaluation").css("display","block");
						$("#wechatEvaluation").on("tap",function() {
							location.href = "${ctx}/platwechat/wechatEvaluation?caseQueryNo="+caseQueryNo+"&appId="+appId;
						});
					}
				}
				
				if($.trim(platCaseInfo)) {
					var entryTime = platCaseInfo.entryTime;
					if($.trim(entryTime)) {
						$("#entryTime").text(formatDate(entryTime));
					}
					
					var beginTime = platCaseInfo.beginTimetrs;//派遣至驾驶员时间
					if($.trim(beginTime)) {
						$("#beginTime").text(beginTime);
					}
					
					
					var caseQueryNo = platCaseInfo.caseQueryNo;
					//案件查询号
					if($.trim(caseQueryNo)) {
						$("#caseQueryNoShow").text(caseQueryNo);
					}
					
					var rescueLinkman = platCaseInfo.rescueLinkman;
					//现场联系人
					if($.trim(rescueLinkman)) {
						$("#rescueLinkman").text(rescueLinkman);
					}
					
					var rescuePhone = platCaseInfo.rescuePhone;
					if($.trim(rescuePhone)) {
						$("#rescuePhone").text(rescuePhone);
					}
					
					var carPlateName = platCaseInfo.carPlateName;//车牌简称
					var carPlateNumber = platCaseInfo.carPlateNumber;//车牌号
					var carNumber = "";
					if($.trim(carPlateName)) {
						carNumber += carPlateName;
					}
					if($.trim(carPlateNumber)) {
						carNumber += carPlateNumber;
					}
					$("#carPlate").text(carNumber);
					
					var rescueAddress = platCaseInfo.rescueAddress;
					if($.trim(rescueAddress)) {
						$("#rescueAddress").text(rescueAddress);
					}
					
					var desAddress = platCaseInfo.desAddress;
					if($.trim(desAddress)) {
						$("#desAddress").text(desAddress);
					}
					
					var serviceItemName = platCaseInfo.serviceItemName;
					if($.trim(serviceItemName)) {
						$("#serviceName").text(serviceItemName);
					}
					var platStatus = platCaseInfo.status;
					if(platStatus == "13") {
						$("#wechatEvaluation").unbind("tap");
						$("#wechatEvaluationLi").text("已回访");
					}
					
				}
				
				
				var timeItems = $("#timeItems");//时间轴元素
				
				
				var timeLine = [];
				
				var timeLine = res.timeLine;//供应商案件时间轴
				for(var i in timeLine) {
					var time = timeLine[i].operateTimeStr;//时间
					var content = timeLine[i].content;//内容
					var element = getTimeLineElement(time,content);
					timeItems.append(element);
				}
				
				
				/* for(var i in timeLine) {
					(timeLine[i]);
				} */
				
				
				
				
				
				
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
    
    function getTimeLineElement(time,content) {
    	var timeLineElement = "<div class=\"timeline-item clearfix\">"
								+"<div class=\"timeline-info\"style=\"overflow:hidden;\">"
									+"<span class=\"timeline-date\"style=\"width:auto;margin-right:15px;font-size:15px;\">"+time+"</span>"
									+"<i class=\"timeline-indicator btn btn-info no-hover\"></i>"
								+"</div>"
								+"<div class=\"widget-box transparent\">"
									+"<div class=\"widget-body\">"
										+"<div class=\"widget-main no-padding\"style=\"font-size:16px;\">"
											+content+"<div class=\"space-2\">"+"</div>"
										+"</div>"
									+"</div>"
								+"</div>"
							+"</div>";
		return timeLineElement;
    }
    
</script>
</html>