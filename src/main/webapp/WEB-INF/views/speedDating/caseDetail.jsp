<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimal-ui, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>案件详情</title>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
    <link rel="stylesheet" href="${ctx}/static/wechat/css/speedDating/case-detail.css">
    <style type="text/css">
    	#container{
    		height: 100%;
    	}
    </style>
</head>
<body>
<div id="wrap">
	<input type="hidden" id="ctx" value="${ctx}" />
    <div class="tabbed_content">
		<div class="tabs">
			<div class="moving_bg">&nbsp;</div>
			<span class="tab_item" id="tab_1">案件信息</span>
			<span class="tab_item" id="tab_2">派遣信息</span>
			<span class="tab_item" id="tab_3">时间轴</span>
			<span class="tab_item" id="tab_4">实时地图</span>
		</div>
		<div class="slide_content">						
			<div class="tabslider" >
				<div class="selected ul_tab_1 tabUl case-intro">
					<ul class="report-intro">
					<c:choose> 
					     <c:when test="${not empty sfcasedata}">    <!--如果 顺风车 --> 
							<li class="report-list"><span class="fl">案件编号</span><span class="input">${sfcasedata.caseNumber}</span></li>
				            <li class="report-list"><span class="fl">现场联系人</span><sapn class="input">${sfcasedata.rescueLinkman}</span></li>
				            <li class="report-list"><span class="fl">联系电话</span><span class="input">${sfcasedata.rescuePhone}</span></li>
				            <li class="report-list bd0"><span class="fl">被救援车牌号</span><span class="input">${sfcasedata.carPlateName}${sfcasedata.carPlateNumber}</span></li>
				            <li class="report-list bd0"><span class="fl">救援地点</span><span class="input">${sfcasedata.rescueAddress}</span></li>
				            <li class="report-list bd0"><span class="fl">目的点</span><span class="input">${sfcasedata.desAddress}</span></li>
				            <li class="report-list bd0"><span class="fl">救援类型</span><span class="input">${sfcasedata.serviceItemName}</span></li>
				            <li class="report-list bd0"><span class="fl">备注</span><span class="input">${sfcasedata.remark}</span></li>
				            <li class="report-list bd0"><span class="fl">评价</span>
				            <span class="input">
				            	<c:choose> 
				            		<c:when test="${not empty sfcasedata.evaluateRemark}">
				            			${sfcasedata.evaluateRemark}
				            		</c:when>
				            		<c:otherwise>
				            			<c:if test="${sfcasedata.status == 5}">
				            				<a href="${ctx }/speed/getPlatevaluation?id=${sfcasedata.id}" style="color: #5A59FF;text-decoration: underline;">点击评价</a>
				            			</c:if>
				            		</c:otherwise>
				            	</c:choose>
				            </span>
				            </li>
					 	 </c:when>       
					
					     <c:otherwise>  <!--否则  大板车 -->    
							<li class="report-list"><span class="fl">案件编号</span><span class="input">${casedata.caseNumber}</span></li>
				            <li class="report-list"><span class="fl">现场联系人</span><sapn class="input">${casedata.rescueLinkman}</span></li>
				            <li class="report-list"><span class="fl">联系电话</span><span class="input">${casedata.rescuePhone}</span></li>
				            <li class="report-list bd0"><span class="fl">被救援车牌号</span><span class="input">${casedata.carPlateName}</span></li>
				            <li class="report-list bd0"><span class="fl">救援地点</span><span class="input">${casedata.rescueAddress}</span></li>
				            <li class="report-list bd0"><span class="fl">目的点</span><span class="input">${casedata.desAddress}</span></li>
				            <li class="report-list bd0"><span class="fl">救援类型</span><span class="input">${casedata.serviceitemname}</span></li>
				            <li class="report-list bd0"><span class="fl">备注</span><span class="input">${casedata.remark}</span></li>
					     </c:otherwise> 
					
					</c:choose>
			            
			        </ul>
			        <p class="clear"><p>
				</div>
				<c:choose> 
				    <c:when test="${not empty sfcasedata}">    <!--如果 --> 
						<div class = "ul_tab_2 tabUl send-intro">
							<ul class="report-intro">
					            <li class="report-list"><span class="fl">接收时间</span><span class="input">
					            <c:if test="${not empty sfcasedata.entryTime}">
						            <jsp:useBean id="entryTimee" class="java.util.Date"/>
									<jsp:setProperty name="entryTimee" property="time" value="${sfcasedata.entryTime}"/>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${entryTimee}"/> 
								</c:if>
					            </span></li>
					            <li class="report-list"><span class="fl">派出时间</span><sapn class="input">
					            <c:if test="${not empty sftaskdata.trscStm}">
						            <jsp:useBean id="trscStm" class="java.util.Date"/>
									<jsp:setProperty name="trscStm" property="time" value="${sftaskdata.trscStm}"/>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${trscStm}"/> 
								</c:if>
					            </span></li>
					            <li class="report-list"><span class="fl">预计到达</span><span class="input">
					            <c:if test="${not empty sftaskdata.trscEat}">
						            <jsp:useBean id="trscEat" class="java.util.Date"/>
									<jsp:setProperty name="trscEat" property="time" value="${sftaskdata.trscEat}"/>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${trscEat}"/> 
								</c:if>
					            </span></li>
					            <li class="report-list bd0"><span class="fl">技师姓名</span><span class="input">${sftaskdata.trscDriverName}</span></li>
					            <li class="report-list bd0"><span class="fl">技师车牌号</span><span class="input">${sftaskdata.trscCarNumber}</span></li>
					            <li class="report-list bd0"><span class="fl">联系电话</span><span class="input">${sftaskdata.trscDriverPhone}</span></li>
					        </ul>
					        <p class="clear"><p>
						</div>
				 	</c:when>      
				    <c:otherwise>  <!--否则 -->    
						<div class = "ul_tab_2 tabUl send-intro">
							<ul class="report-intro">
					            <li class="report-list"><span class="fl">接收时间</span><span class="input">
					            <c:if test="${not empty casedata.entryTime}">
						            <jsp:useBean id="entryTime" class="java.util.Date"/>
									<jsp:setProperty name="entryTime" property="time" value="${casedata.entryTime}"/>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${entryTime}"/>
								</c:if> 
					            </span></li>
					            <li class="report-list"><span class="fl">派出时间</span><sapn class="input">
					            <c:set var="exitId" value="1"></c:set>
					            <c:forEach items="${historydata}" var="sel">
					            	<c:if test="${exitId == 1}">		
					            		<c:if test="${sel.currCaseStatus == 3}">		
						            		<jsp:useBean id="createTimeBig" class="java.util.Date"/>
											<jsp:setProperty name="createTimeBig" property="time" value="${sel.createTime}"/>
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${createTimeBig}"/>
											<c:set var="exitId" value="0"></c:set>
					            		</c:if> 
					            	</c:if>
					            </c:forEach>
					          <%--   <c:if test="${not empty casedata.reserveTimeStart}">
						            <jsp:useBean id="reserveTimeStart" class="java.util.Date"/>
									<jsp:setProperty name="reserveTimeStart" property="time" value="${casedata.reserveTimeStart}"/>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${reserveTimeStart}"/> 
								</c:if>  --%>
					            </span></li>
					            <li class="report-list"><span class="fl">预计到达</span><span class="input">
					            <c:if test="${not empty casedata.workStartTime}">
						            <jsp:useBean id="workStartTime" class="java.util.Date"/>
									<jsp:setProperty name="workStartTime" property="time" value="${casedata.workStartTime}"/>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${workStartTime}"/> 
								</c:if> 
					            </span></li>
					            <li class="report-list bd0"><span class="fl">技师姓名</span><span class="input">${casedata.workDriverName}</span></li>
					            <li class="report-list bd0"><span class="fl">技师车牌号</span><span class="input">${casedata.workCarPlateNumber}</span></li>
					            <li class="report-list bd0"><span class="fl">联系电话</span><span class="input">${casedata.workDriverPhone}</span></li>
					        </ul>
					        <p class="clear"><p>
						</div>
				  	</c:otherwise> 
				
				</c:choose>
				<div class="ul_tab_3 tabUl time-line">
					<ul class="report-intro">
						<c:forEach items="${historydata}" var="sel" varStatus="index">
							<c:choose> 
				    			<c:when test="${index.index == 0}">    <!--如果 --> 
				    				<li class="time-line-list">
					    			<em class="line-icon down"><img src="${ctx}/static/wechat/img/speedDating/time-line.png"/></em>
									<p class="time-line-intro down">${sel.content}</p>
				    			</c:when>      
				    			<c:when test="${fn:length(historydata)-1 == index.index}">
				    				<li class="time-line-list bd0">
				    				<em class="line-icon"><img src="${ctx}/static/wechat/img/speedDating/time-line.jpg"/></em>
									<p class="time-line-intro">${sel.content}</p>
								</c:when>  
					    		<c:otherwise>  <!--否则 -->  
					    			<li class="time-line-list">
					    			<em class="line-icon"><img src="${ctx}/static/wechat/img/speedDating/time-line.jpg"/></em>
									<p class="time-line-intro">${sel.content}</p>
					    		</c:otherwise> 
							</c:choose>
								<p class="time-line-time">
								<c:if test="${not empty sel.createTime}">
									<jsp:useBean id="dateValue" class="java.util.Date"/>
									<jsp:setProperty name="dateValue" property="time" value="${sel.createTime}"/>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${dateValue}"/> 
								</c:if> 
								</p>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="ul_tab_4 tabUl map">
					<c:choose> 
					 	<c:when test="${not empty sfcasedata}">  
							<div style="height:100%"><iframe src="http://eip.yuantongjy.com/eipots/searchGps.html?caseNumber=${sfcasedata.caseNumber}" width="100%" height="100%" ></iframe></div>
						</c:when>  
						<c:otherwise>  <!--否则  大板车 -->
							<div style="height:100%"><iframe src="http://eip.yuantongjy.com/eipots/searchGps.html?caseNumber=${casedata.caseNumber}" width="100%" height="100%" ></iframe></div>
						</c:otherwise> 
					</c:choose>
				</div>
			<p class="clear"><p>
		</div>
	</div>
</div>
<script src="${ctx}/static/wechat/js/speedDating/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
 <script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.12&key=ff1fefcaeeade810ed7b37c9770eb0ab&plugin=AMap.Driving"></script>
<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
<script type="text/javascript">

</script>
</body>
<script>
$(function(){
	
/* <!--============== 选项卡开始 =================== --> */
	var TabbedContent = {
		init: function() {	
			$(".tab_item").mouseover(function() {
				$(".tab_item .hidden").hide();
				$(".click_more").show();
				var background = $(this).parent().find(".moving_bg");
				
				$(background).stop().animate({
					left: $(this).position()['left']
				}, {
					duration: 300
				});
				TabbedContent.slideContent($(this));			
			});
		},
		slideContent: function(obj) {
			$(".tabslider .tabUl").removeClass("selected");
			var id = $(obj).attr("id");
			
			$(".tabslider .ul_"+id).addClass("selected");
			if(id=='tab_4'){
				$(".slide_content").height($("body").height()-$(".tabs").height()-2).css("top",0);
			}else{
				$(".slide_content").height("auto").css("top","0.4em");
			}
		}
	}
    TabbedContent.init();
/* <!--============== 选项卡结束 =================== --> */	
});
</script>
</html>