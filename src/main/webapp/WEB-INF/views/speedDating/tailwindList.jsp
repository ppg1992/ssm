<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>顺风车列表</title>
    <link rel="stylesheet" href="${ctx}/static/wechat/css/weui.css" />
    <link rel="stylesheet" href="${ctx}/static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="${ctx}/static/wechat/css/speedDating/order-list.css">
    <link rel='stylesheet' href='${ctx}/static/wechat/css/speedDating/lCalendar.css'>
    <style type="text/css">
    	.tabs .tab_item{width: 16%;}
    	#tab_1{width: 20%;}
    	.tabs .moving_bg{width: 14%;margin: 0px 1.5%;}
    </style>
</head>
<body>
<div id="wrap">
	<input type="hidden" id="ctx" value="${ctx}" />
	<input type="hidden" id="pid" name="pid" value="${wechatInfo.pid}" />
	<input type="hidden" id="customeIndex" name="customeIndex" value="${wechatUser.customeIndex}" />
	<input type="hidden" id="userId" name="userId" value="${wechatUser.bundUserId}" /> 
	<input type="hidden" id="phone" name="phone" value="${WechatCustomerLinkman.phone}" /> 
    <div class="tabbed_content">
		<div class="tabs">
			<div class="moving_bg">&nbsp;</div>
			<span class="tab_item" id="tab_1">全部状态</span>
			<span class="tab_item" id="tab_2">已完成</span>
			<span class="tab_item" id="tab_3">进行中</span>
			<span class="tab_item" id="tab_4">未匹配</span>
			<span class="tab_item" id="tab_5">已转出</span>
			<span class="tab_item" id="tab_6">已取消</span>
		</div>
		<div class="slide_content">						
			<div class="tabslider" >
				<ul class="selected ul_tab_1 tabUl">
				</ul>
				<ul class = "ul_tab_2 tabUl">
				</ul>
				<ul class="ul_tab_3 tabUl">
				</ul>
				<ul class="ul_tab_4 tabUl">
				</ul>
				<ul class="ul_tab_5 tabUl">
				</ul>
				<ul class="ul_tab_6 tabUl">
				</ul>
			</div>
			<p class="clear"><p>
		</div>
	</div>
</div>
<p class="filter">筛选</p>
<div class="layer none">
    <div class="bg"></div>
    <div class="layer-con">
    	<p class="layer-title">
	        <span class="title-name">案件筛选</span>
	    	<span class="close">×</span>
	    </p>
	    <div class="layer-time">
	    	<p class="layer-con-title">报案时间：</p>
	    	<input id="start_date" class="input" type="text" readonly="" name="start_date" placeholder="开始日期"  />
	    	<em>-</em>
	    	<input id="end_date" class="input" type="text" readonly="" name="end_date" placeholder="结束日期"  />
	    </div>
	    <div class="layer-words">
	    	<p class="layer-con-title">快速查找：</p>
	    	<input id="key_words" class="input" type="text" name="key_words" placeholder="请输入案件编号或者开始地址"  />
	    </div>
	    <div class="layer-items">
	    	<p class="layer-con-title">服务类型：</p>
	    	<select class="item-name" name="serviceItem" id="serviceItem" value="">
              	<option value ="">请选择服务类型</option>
              	<c:forEach items="${serTypejson}" var="sel">
					<c:choose>
						<c:when test='${sel.selected}'>
							<option value="${sel.id}">${sel.text}</option>
						</c:when>
						<c:otherwise>
							<option value="${sel.id}">${sel.text}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
            </select>
	    </div>
	    <span class="down_btn fl check-list">查询</span>
	    <span class="down_btn reset fl">重置</span>
    </div>
</div>   
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
        <p class="weui_toast_content">查询中，请稍后</p>
    </div>
</div>
</body>
<script src="${ctx}/static/wechat/js/mui.min.js"></script>
<script src="${ctx}/static/wechat/js/speedDating/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/static/wechat/js/speedDating/lCalendar.js" type="text/javascript" charset="utf-8"></script>
<script>
var curpage=1;
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
			curpage=1;
			$(".ul_"+id).empty();
			getBigBoardCaseInfo(id);
			$(".tabslider .ul_"+id).addClass("selected");
			
		}
	}
    TabbedContent.init();
/* <!--============== 选项卡结束 =================== --> */	
//筛选按钮
	$(".filter").on('click',function(){
		$(".layer").show()
	});
//选择日期
   var calendardatetime = new lCalendar();
	calendardatetime.init({
		'trigger': '#start_date',
		'type': 'date'
	});
	var calendardatetime2 = new lCalendar();
	calendardatetime2.init({
		'trigger': '#end_date',
		'type': 'date'
	});
	$("#start_date").attr('value',getNowFormatDate());
//关闭弹窗
	$(".close").on('click',function(){
		$(".layer").hide()
	});
//重置按钮
	$(".reset").on('click',function(){
		$("#start_date").val('');
		$("#end_date").val('');
		$("#key_words").val('');
		$(".item-name").each(function (i, j) {
		    $(j).find("option:selected").attr("selected", false);
		    $(j).find("option").first().attr("selected", true);
		});
	});
//查询订单列表
	$(".check-list").on('click',function(){
		curpage=1;
		$(".ul_"+tab).empty();
		getBigBoardCaseInfo(tab);
	});
});

// 滚动到底部加载下一页
var fanye = true;
$(window).bind("scroll",function(){
	var window_height = getViewPortHeight();//浏览器当前的可视高度
    var scroll_top = $(window).scrollTop();
    var body_height = $('#wrap').height();
//     console.log(body_height-window_height-scroll_top);
    if(body_height-window_height-scroll_top <= -5){
    	if(fanye){
	        curpage = curpage + 1;
	        getBigBoardCaseInfo(tab);
    	}
    }
});
// ios返回原来位置
// ios客户端判断
function is_iphone(){
    var u = navigator.userAgent;
    var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
    var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
    if (isiOS) {
        return true;
    }else{
        return false;
    }
}
$(window).on('load',function(){ 
    if (is_iphone() && sessionStorage.scroll_top_num >= 0 && sessionStorage.page_num >=1) {
        $('#layout').height(sessionStorage.page_height_num);
        $(window).scrollTop(sessionStorage.scroll_top_num);
        getBigBoardCaseInfo(tab);
    }else{
    	getBigBoardCaseInfo("tab_1");
    }
})

// 获取浏览器窗口的可视区域的高度
function getViewPortHeight() {
   return document.documentElement.clientHeight || document.body.clientHeight;
}

var tab;
function getBigBoardCaseInfo(tab1){
	tab = tab1;
	var status = getStatus(tab);
	var startDate = $("#start_date").val();
	var endDate = $("#end_date").val();
	var serviceItem = $("#serviceItem").val();
	var keyWords = $("#key_words").val();
	var pid = $("#pid").val();
	var customeIndex = $("#customeIndex").val();
	var userId = $("#userId").val();
	var phone = $("#phone").val();
	
	ctx = $('#ctx').val();
	var wxaddresscouchList = ctx + "/speed/getSFCaseDataList";
	$('#loadingToast').show();
	$.ajax({
		type : "POST",
		url : wxaddresscouchList,
		data : {
			"status":status,
			"startDate":startDate,
			"endDate":endDate,
			"serviceItem":serviceItem,
			"search":keyWords,
			"searchtype":1,
			"pageSize":10,
			"pageNumber":curpage,
			"pid":pid,
			"customeIndex":customeIndex,
			"userId":userId,
			"phone":phone
		},
		dataType:"json",
		success : function(data) {
			$(".layer").hide();
			$('#loadingToast').hide();
			var str;
           	var timeColor;
			var serviceColor;
			var photoColor;
			if(data.length == 0){
				$("#beizhu").remove();
				str = '<p id="beizhu" class="none-date">没有数据啦,请不要再下滑啦！</p>';
				$(".ul_"+tab).append(str);
				fanye = false;
				return ;
			}
			//$(".ul_"+tab).empty();
			for(var i = 0 ; i < data.length ; i++){
				if(data[i].status == 5){//已完成
					timeColor = " state-down";
					photoColor = '<p class="list-state"><img src="${ctx}/static/wechat/img/speedDating/state-down.png" /></p>';
				}else if(data[i].status >= 2 && data[i].status <= 4 
						|| data[i].status == 6 || data[i].status == 10 
						|| data[i].status == 11
						){//已派出
					timeColor = " state-now";
					photoColor = '<p class="list-state state-now">进行中</p>';
				}else if(data[i].status == 7){//已取消
					timeColor = " state-cancel";
					photoColor = '<p class="list-state state-cancel">已取消</p>';
				}else if(data[i].status == 1){//待派遣
					timeColor = " state-none";
					photoColor = '<p class="list-state state-none">未匹配</p>';
				}else if(data[i].status == 14){//已改派
					timeColor = " state-trans";
					photoColor = '<p class="list-state state-trans">已转出</p>';
				}else{
					timeColor = " state-cancel";
					photoColor = '<p class="list-state state-cancel">草稿</p>';
				}
				str = "<li onclick='detail("+data[i].platCaseid+");'>";
				str += '<p class="list-title"><span class="fl">案件编号：'+data[i].casenumber+'</span>';
				if(data[i].serviceItem == 1){
					if(data[i].status == 7){
						str += '<span class="item-class">';
					}else{
						str += '<span class="item-class trouble-trailer">'; 
					}
				}else if(data[i].status == 7){
					str += '<span class="item-class">';
				}else{
					str += '<span class="item-class trans-newCar">';
				}
				if (typeof(data[i].serviceitemname) != "undefined") {
					str += data[i].serviceitemname+'</span></p>';
				}
				str += '<p class="list-address">地址：'+data[i].rescueAddress+'</p>';
				str += '<p class="list-time'+timeColor+'">报案时间：'+getDateStr(data[i].expectedRescueTime)+'</p>';
				str += '<p class="list-remark">备注：'
				if (typeof(data[i].remark) != "undefined") {
					str += data[i].remark;
				}
				str += '</p>';
				str += photoColor;
				str += "</li>";
				$(".ul_"+tab).append(str);
				
			}
		},
		"error" : function(request){
			$('#loadingToast').hide();
			/* mui.confirm('<p>'+'系统出错,请重试！'+'</p>',"错误",['确定'],function(e){
				
			}); */
		}
	}); 
}
function detail(id){
	window.location.href = ctx +"/speed/getSFCaseDetail?id="+id;
}
function getStatus(tab){
	if(tab == "tab_1"){
		tab = "";
	}else if(tab == "tab_2"){
		tab = 5;
	}else if(tab == "tab_3"){
		tab = "2,3,4,6,10,11";
	}else if(tab == "tab_4"){
		tab = 1;
	}else if(tab == "tab_5"){
		tab = 14;
	}else if(tab == "tab_6"){
		tab = 7;
	}
	return tab
}
/* 
 * 函数功能： 时间戳获取时间
 * 返回值：  默认：Y + M + D + h + m + s 
 *
*/ 	
function getDateStr(data){
	var now = new Date(data)
    y = now.getFullYear(),
    m = now.getMonth() + 1,
    d = now.getDate();
	return y + "-" + (m < 10 ? "0" + m : m) + "-" + (d < 10 ? "0" + d : d) + " " + now.toTimeString().substr(0, 8);
}
//获取当前时间，格式YYYY-MM-DD
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}
</script>
</html>