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
    <title>我要报案</title>
<%--     <link rel="stylesheet" href="${ctx}/static/wechat/css/mui.min.css"/> --%>
    <link rel="stylesheet" href="${ctx}/static/wechat/css/weui.css" />
<%--     <link rel="stylesheet" href="${ctx}/static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" /> --%>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
    <link rel="stylesheet" href="${ctx}/static/wechat/css/speedDating/report.css">
    <link rel='stylesheet' href='${ctx}/static/wechat/css/speedDating/lCalendar.css'>
</head>
<style type= "text/css">
#ul-info{
    z-index: 1;
    position: fixed;
    width: 100%;
    top: 82px;
    margin:0px -27px;
}
#ul-info li{
	padding:3px 0;
	background: white;
 	color:#333;
}
</style>
<body>
<div id="wrap">
<input type="hidden" id="ctx" value="${ctx}" />
<form id="wxreportcaseform" action="#" method="post">
 	<input type="hidden" id="appId" name="appId" value="${wechatInfo.appId}" />
	<input type="hidden" id="wechatinfoId" name="wechatinfoId" value="${weChatData.wechatinfoId}" /> 
 	<input type="hidden" id="pid" name="pid" value="${wechatInfo.pid}" />
 	<input type="hidden" id="weChatUserId" name="weChatUserId" value="${weChatData.weChatUserId}" />
    <input type="hidden" id="detailed" name="detailed" value="${detailed}" /> 
	<input type="hidden" id="rescueCity" name="rescueCity" value="${weChatData.rescueCity}" />
	<input type="hidden" id="rescueLatitude" name="rescueLatitude" value="${weChatData.rescueLatitude}" /> 
	<input type="hidden" id="rescueLongitude" name="rescueLongitude" value="${weChatData.rescueLongitude}" /> 
	<input type="hidden" id="desCity" name="desCity" value="${weChatData.desCity}" />
	<input type="hidden" id="desLatitude" name="desLatitude" value="${weChatData.desLatitude}" /> 
	<input type="hidden" id="desLongitude" name="desLongitude" value="${weChatData.desLongitude}" /> 
	<input type="hidden" id="helpTimeStr" value="${weChatData.helpTime}" />
 	<input type="hidden" id="customeIndex" name="customeIndex" value="${wechatUser.customeIndex}" />
	<input type="hidden" id="addressvalue" name="addressvalue" value="${weChatData.addressvalue}"/>
	<input type="hidden" id="customStatus" name="customStatus" value="${customStatus}"/>
	
	<!--  <input type="hidden" id="weChatUserId" name="weChatUserId" value="9" />  
		<input type="hidden" id="appId" name="appId" value="wxd10395e1e5441090" /> 
		<input type="hidden" id="pid" name="pid" value="31" /> 
<input type="hidden" id="customeIndex" name="customeIndex" value="ytfx" />  -->
    <div class="item">
        <em class="icon border-radius gray">项</em>
        <span class="item-title">服务项目</span>
        <i class="arrow fr">&gt;</i>
       <!-- <span class="item-name fr">拖车--故障</span>-->
        <select class="item-name fr" name="serviceItem" id="serviceItem">
          	<option value ="">请选择服务项目</option>
          	<c:forEach items="${serTypejson}" var="sel">
				<c:choose>
					<c:when test="${sel.id == '14'}">
						<option selected="selected" value="${sel.id}">${sel.text}</option>
					</c:when>
					<c:otherwise>
						<c:if test="${sel.id != 22 && sel.id != 23 && sel.id != 13 && sel.id != 16 && sel.id != 17 && sel.id != 11 && sel.id != 18}">	
							<option value="${sel.id}">${sel.text}</option>
						</c:if>
					</c:otherwise>
				</c:choose>
			</c:forEach>
        </select>
    </div>
    <div class="content">
        <h2 class="report-title"><em class="icon border-radius red icon-box-shadow icon-half">案</em>报案信息</h2>
        <ul class="report-intro">
            <li class="report-list">
            	<span class="fl">车辆类型</span><i class="arrow fr">&gt;</i>
                <!-- <input class="fl" id="style" name="style" readonly value="请选择车辆类型"/> -->
                <select class="fl input" id="carType" name="carType" value="请选择车辆类型">
                  	<c:forEach items="${carTypejson}" var="sel">
						<c:choose>
							<c:when test="${sel.id == '1'}">
								<option selected="selected" value="${sel.id}">${sel.text}</option>
							</c:when>
							<c:otherwise>
								<option value="${sel.id}">${sel.text}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
                </select>
            </li>
            <li class="report-list date"><span class="fl">预约时间</span>
<%--            	<input id="helpTime" class="fl input" type="text" readonly="" name="helpTime" placeholder="前选择预约时间"  />--%>
            	<input id="helpTime1" class="fl input" type="datetime-local"  name="helpTime1"  />
            	<!--<input class="fl input" id="start_date" name="date" readonly value="2019年1月18日 13:54" />-->
           	</li>
            <li class="report-list"><span class="fl">作业地点</span><i class="arrow fr">&gt;</i><input class="fl input" id="rescueAddress" name="rescueAddress" readonly value="${weChatData.rescueAddress}" placeholder="请选择作业地点"/></li>
            <li class="report-list"><span class="fl">联 系 人</span><input class="fl input" id="linkman" name="linkman" value="${weChatData.linkman}" placeholder="请输入姓名" /></li>
            <li class="report-list"><span class="fl">联系电话</span><input class="fl input" id="phone" name="phone" oninput="value=value.replace(/[^\d\s]/ig,'')" value="${weChatData.phone}" placeholder="请输入联系电话"/></li>
            <%-- <li class="report-list car"><span class="fl">车牌号码</span>
            	<div class="fl input" id="pn">
            		<input type="text" readonly="" class="province fl"  name="pshortName" value = '浙' id="T-province" />
	    			<input class="input fr plate_number" maxlength="7" name="carNumbers" value="${weChatData.carNumbers}" placeholder="请输入车牌号码" onkeyup="this.value=this.value.toUpperCase()"/>
            	</div>
            </li> --%>
            <li class="report-list car"  >
                <span class="fl">车架号码</span>
                <input class="fr input" id="carFrameNumber" name="carFrameNumber" value="" placeholder="请输入车架号码"/>
            </li>
<%--            <li class="report-list bd0" hidden>
            	<span class="fl">案件数量</span>
            	<span class="fl input case-number">
            		<em class="fl sub">-</em>
            		<input class="fl input" id="case_number" name=caseNum  readonly="" type="number" value="1" />
            		<em class="fl add">+</em>
            	</span>
            </li>--%>
        </ul>
        <ul class="province_center">
			<li>京</li><li>津</li><li>冀</li><li>晋</li><li>蒙</li><li>辽</li><li>吉</li><li>黑</li><li>沪</li><li>苏</li><li>浙</li>
			<li>皖</li><li>闽</li><li>赣</li><li>鲁</li><li>豫</li><li>鄂</li><li>湘</li><li>粤</li><li>桂</li><li>琼</li><li>渝</li>
			<li>川</li><li>黔</li><li>云</li><li>藏</li><li>陕</li><li>甘</li><li>青</li><li>宁</li><li>新</li><li>台</li><li>港</li><li>澳</li>
		</ul>
<!-- 		默认车牌  浙 -->
<!-- 		<input type="hidden" id="pshortName" name="pshortName" value="浙">  -->
        <p class="clear"><p>
        <div id="datePlugin"></div> 
    </div> 
    <div class="footer">
        <div class="item">
            <div class="footer-con">
                <em class="icon border-radius gray">地</em>
                <span class="item-title">目的地</span>
                <input type="hidden" id="desAddress" name="desAddress" value="${weChatData.desAddress}"> 
                <i class="arrow fr">&gt;</i>
                <span class="item-name fr destination">请选择目的地</span> 
            </div>
            <textarea class="remark" id="remark" name="remark" value="${weChatData.remark}" placeholder="请输入备注内容"></textarea>
            <p class="submit wxSubmit">提     交</p>
        </div>
    </div>
</form>
</div>
<div class="layer">
	<div id="container"></div>
	<div class="info">
		<div>
			<h4>您选择的位置</h4>
			<input type="text" id="searchInput" placeholder="请输入您的位置">
			<ul id="ul-info"></ul>
			<input type="button" value="默认地址" class="addressButton" id="addressButton" style="position: fixed;top: 2em;right: 2%;width: 20%;height: 3em;border: 1px solid #ced4da;color:#8086FF;">
			<!-- <div class="addressDiv" style="position: absolute;
				width: 95%;
				height: 100%;
				left: 50%;
				top: 50%;
				margin-left: -200px;
				margin-top: -200px;
				border: 1px solid #00F;
				display: none;background-color: white;"> -->
				<ul class="addressUl" style="position: fixed;top: 6em;right: 2%;width: 96%;background-color: #FFF;display: none;font-size: 14px;line-height: 2;">
					<c:forEach items="${platWechatAddressList}" var="sel">
						<li onclick="address('${sel.detailed}',${sel.latitude},${sel.longitude})">${sel.detailed }</li>
					</c:forEach>
				</ul>
			<!-- </div> -->
	    	<span id="map-center"></span>
		</div>
		<span class="layer-btn choose-btn">确定</span>
		<span class="layer-btn destination-btn">确定</span>
		
	</div>
	<!--<div id="panel"></div>-->
</div>

<div id="panelDiv"></div> 
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
        <p class="weui_toast_content">报案中，请稍后</p>
    </div>
</div>  
<!-- <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"> </script> -->
<%-- <script src="${ctx}/static/wechat/js/mui.min.js"></script> --%>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.12&key=ff1fefcaeeade810ed7b37c9770eb0ab&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Geocoder,AMap.Geolocation"></script>
<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
<script src="${ctx}/js/wxjssdk.js" type="text/javascript"></script>
<script type="text/javascript">

//初始化地图
var map = new AMap.Map('container', {
    resizeEnable: true, //是否监控地图容器尺寸变化
    zoom: 13, //初始地图级别
    center: [120.133663,30.282123] //初始地图中心点
  });
//获取输入提示信息
var resultarray;
function autoInput() {
	var keywords = document.getElementById("searchInput").value;
	AMap.plugin('AMap.Autocomplete', function() {
		// 实例化Autocomplete
		var autoOptions = {
			city: '全国'
		}
		var autoComplete = new AMap.Autocomplete(autoOptions);
		autoComplete.search(keywords, function(status, result) {
			// 搜索成功时，result即是对应的匹配数据
			$("#ul-info").empty();
			resultarray = new Array();
			var con = 0;
			if(result.info == "OK") {
				$.each(result.tips, function(i, item) {
					if(item.id != "") {
						$("#ul-info").append("<li onclick="+"addressDetail('"+item.id+"')><p style = 'font-size:12px;height:16px;text-indent:10px;line-height:16px'>"+item.name+"</p><p style = 'font-size:12px;height:16px;text-indent:10px;line-height:16px;color:#c1c1c1'>"+item.district+item.address+"</p></li>");
						resultarray[con] = item;
						con++;
					}
				});
			}else{
				$("#ul-info").append("<li>没有数据</li>");
			}
		})
	})
}
function addressDetail(id){
	$.each(resultarray, function(i, item) {
		if(id == item.id){
			onComplete(item.district+item.address+item.name,item.location);
			$("#ul-info").empty();
			$("#searchInput").val('');
			return false;
		}
	});
}
document.getElementById("searchInput").oninput = autoInput;



//解析定位结果
  function onComplete(address,latlng) {       
		document.querySelector("#map-center").innerText = address;
		document.querySelector("#map-center").setAttribute("data-local",latlng.lat+','+latlng.lng);
		marker.setPosition([latlng.lng,latlng.lat]); //更新点标记位置
		map.setCenter([latlng.lng,latlng.lat]); //设置地图中心点
  }
  //解析定位错误信息
  function onError(data) {
     alert("定位失败,请手动搜索定位");//+data.message);
   //  defaultMarker();
  }



map.plugin('AMap.Geolocation', function() {
var geolocation = new AMap.Geolocation({
	enableHighAccuracy: true, //是否使用高精度定位，默认:true
	timeout: 10000, //超过10秒后停止定位，默认：无穷大
	maximumAge: 0, //定位结果缓存0毫秒，默认：0
	convert: true, //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
	showButton: true, //显示定位按钮，默认：true
	buttonPosition: 'LB', //定位按钮停靠位置，默认：'LB'，左下角
	buttonOffset: new AMap.Pixel(10, 20), //定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
	showMarker: false, //定位成功后在定位到的位置显示点标记，默认：true
	showCircle: false, //定位成功后用圆圈表示定位精度范围，默认：true
	panToLocation: true, //定位成功后将定位到的位置作为地图中心点，默认：true
	zoomToAccuracy: true //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
})

  map.addControl(geolocation);
	geolocation.getCurrentPosition(function(status,result){
		if(status=='complete'){
			document.getElementById("rescueAddress").value = result.formattedAddress;
			document.getElementById("rescueAddress").setAttribute("data-local",result.position.lat+','+result.position.lng);
			onComplete(result.formattedAddress,result.position);
		}else{
			onError(result)
		}
	});
})

// 实例化点标记
	var geocoder;
	var marker = new AMap.Marker({
		position: map.getCenter(),
		offset: new AMap.Pixel(-13, -30),
        // 设置是否可以拖拽
	    cursor: 'move',
	});
	marker.src = "//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-red.png";
	map.add(marker);
  //无法定位默认给个位置
  /*function defaultMarker(){
	  	var center = map.getCenter().toString();
	    geocoder = new AMap.Geocoder({
			radius: 1000,
			extensions: "all"
		});
		geocoder.getAddress(center, function(status, result) {
			if(status === 'complete' && result.info === 'OK') {
				geocoder_CallBack(result);
			}	
		});
		marker = new AMap.Marker({ //加点
			map: map
		});
		marker.src = "//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-red.png";
		map.add(marker);
		//map.setFitView();
  }
	function geocoder_CallBack(data) {
		document.getElementById("rescueAddress").value = data.regeocode.formattedAddress;
		var poi = map.getCenter().toString().split(',');
		document.getElementById("rescueAddress").setAttribute("data-local",poi[1]+','+poi[0]);
		document.querySelector("#map-center").innerText = data.regeocode.formattedAddress;
		document.querySelector("#map-center").setAttribute("data-local",poi[1]+','+poi[0]);
		//var address = data.regeocode.formattedAddress; //返回地址描述
		//document.getElementById("result").innerHTML = address;
	}*/
</script>
</body>
<script src="${ctx}/static/wechat/js/speedDating/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/static/wechat/js/speedDating/lCalendar.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/static/wechat/js/speedDating/reportCase.js" type="text/javascript" charset="utf-8"></script>
<script>
$(function(){
	var count = 1,$plateObj; 
	var plateHtml = '<li class="report-list car"  ><span class="fl">车牌号码</span>'+
	           			'<div class="fl input" id="pn">'+
	           				'<input type="text" readonly="" class="province fl" name="pshortName"  value = "浙" id="T-province"  />'+
	    					'<input class="input fr plate_number" maxlength="7" id="carNumbers" name="carNumbers" value="" placeholder="请输入车牌号码" required onkeyup="this.value=this.value.toUpperCase()"/>'+
	           			'</div>'+
	           		'</li>';
	var plateHtml2 = '<li class="report-list car"  >'+
						'<span class="fl">车架号码</span>'+
						'<input class="fr input" id="carFrameNumber" name="carFrameNumber" value="" placeholder="请输入车架号码"/>'+
	       			'</li>';
//选择作业地址
	$("#rescueAddress").on('click',function(){
		$('.layer').show();
		$('.choose-btn').show();
		$(".destination-btn").hide();
	});
	$("#addressButton").on('click',function(){
		$('.addressUl').show();
	});
	$("#searchInput").on('click',function(){
		$('.addressUl').hide();
	});
//选择目的地
	$(".destination").on('click',function(){
		$('.layer').show();
		$(".destination-btn").show();
		$('.choose-btn').hide();
		$("#searchInput").focus();
		//console.log($("#map-center").attr("data-local"));
	});
//选择日期
   var calendardatetime = new lCalendar();
	calendardatetime.init({
		'trigger': '#helpTime',
		'type': 'datetime'
	});
	$("#helpTime").attr('value',getNowFormatDate());
//关闭地图
	$(".choose-btn").on('click',function(){
		$('.layer').hide();
// 		$("#rescueAddress").val($("#map-center").html());
		$("#rescueAddress").val($("#map-center").html()).attr('data-local',$("#map-center").attr('data-local'));
		if($("#desAddress").attr("data-local")){
			distance();
		}
	});
	$(".destination-btn").on('click',function(){
		$('.layer').hide();
 		$(".destination").html($("#map-center").html());
// 		$("#desAddress").val($("#map-center").html());
		$("#desAddress").val($("#map-center").html()).attr('data-local',$("#map-center").attr('data-local'));
		distance();
	});

	//减去案件数量
	$(".sub").on('click',function(){
		if(count>1){
			count --;
			$(".report-list.bd0").prev(".report-list").remove();
		}
		$("#case_number").val(count)
	})
//加上案件数量
/* var plate_area='$(".province").eq(0).html()'; */
	$(".add").on('click',function(){
		if(count < 10){
			count ++;
			$("#case_number").val(count);
			var serviceItem = $("#serviceItem").val();
			if(serviceItem == 14 || serviceItem == 15){
				$(".report-list.bd0").before(plateHtml2);
			}else{
				$(".report-list.bd0").before(plateHtml);
			}
			/* plate_area = plate_area+","+$(".province").eq(count-2).html(); */
		}
	})	
	$("#serviceItem").on('change',function(){
     	$("[class='report-list car']").remove();
    	var serviceItem = $("#serviceItem").val();
    	if($("#rescueAddress").val() && serviceItem){
    		distance();
    	}
    	var str ='';
    	for(var i = 0 ; i < count ; i++){
	    	if(serviceItem == 14 || serviceItem == 15){
	    		str	+= '<li class="report-list car"><span class="fl">车架号码</span>';
	    		str += '<input class="fr input" id="carFrameNumber" name="carFrameNumber" value="" placeholder="请输入车架号码"/></li>';    		
	    	}else{
	    		str	+= '<li class="report-list car"><span class="fl">车牌号码</span>'+
       			'<div class="fl input" id="pn">'+
       				'<input type="text" readonly="" class="province fl" name="pshortName"  value = "浙" id="T-province"  />'+
					'<input class="input fr plate_number" maxlength="7" id="carNumbers" name="carNumbers" value="" placeholder="请输入车牌号码" onkeyup="this.value=this.value.toUpperCase()"/>'+
       			'</div>'+
       			'</li>';
	    	}
    	}
    	$(".report-list.bd0").before(str);
    });
//选择车牌号
	$('.report-intro').on('click','.province',function(){
		$plateObj = $(this);
		$('.province_center').show().animate({"bottom":0},300);
	});
	$('.province_center li').on('click',function(){
		var val1 = $(this).html();
		$("#T-province").val(val1);
		$plateObj.val(val1);
		$('.province_center').animate({"bottom":'-12em'},300).hide();
	});
});
function distance(){
	var locationArray=new Array();
	var desAddressArray=new Array();
	var rs = $("#rescueAddress").attr("data-local");
	if(rs){
		var location  = $("#rescueAddress").attr("data-local").toString().split(',');
		locationArray[0]=location[1];
		locationArray[1]=location[0];
		$("#rescueLongitude").val(location[1]);
		$("#rescueLatitude").val(location[0]);
	}
	var dd = $("#desAddress").attr("data-local");
	if(dd){
		var desAddress  = $("#desAddress").attr("data-local").toString().split(',');
		desAddressArray[0]=desAddress[1];
		desAddressArray[1]=desAddress[0];
		$("#desLongitude").val(desAddress[1]);
		$("#desLatitude").val(desAddress[0]);
	}
}


$(".wxSubmit").on('click',function(){
    var phone_reg = /^1[34578]\d{9}$/;
    var serviceItem = $("#serviceItem").val();
    var phone = $('#phone').val();
    if(!$("#customeIndex").val()){
   		return alert('请去个人中心注册或绑定客户！');
   	}else if(!$("#customStatus").val()){
   		return alert('请重新绑定客户！');
   	}else if($("#customStatus").val() != 1){
   		return alert('无法报案，客户未合作！');
   	}else if(!$("#helpTime").val()){
        alert('请选择预约时间！');
    }else if(!$("#rescueAddress").val()){
        alert('请选择作业地点！');
    }else if(!$('#linkman').val()){
        alert('请输入您的姓名！');
    }else if(!phone_reg.test(phone.replace(/[^0-9]/ig,""))){
        alert('请输入正确的手机号！');
    }else if((serviceItem == 1 || serviceItem == 8) && !$(".plate_number").val()){
    	return alert('请输入车牌号码！');
    }else if(!$('#case_number').val()){
        alert('请输入案件数量！');
    }else if((serviceItem == 1 || serviceItem == 8 || serviceItem == 14 || serviceItem == 15) && !$('#desAddress').val()){
        alert('请选择目的地！');
    }else{
    	var isReturn = true;
    	$("input[name='carNumbers']").each(function(j,item){
    		if(!item.value){
    			alert('请输入第'+(j+1)+'个车牌号');
    			isReturn = false;
    			return false;
    		}
    	});
    	if(!isReturn){
    		return ;
    	}
       	ctx = $('#ctx').val();
       	var wxreporturl = ctx + "/platwechat/sendreportOrdinarycase";
       	var helpTime = $('#helpTime').val();
       	helpTime =  helpTime.replace(" ", "T");
    	$('#helpTime').val(helpTime);
    	var phone = $('#phone').val();
    	$("#phone").val(phone.replace(/[^0-9]/ig,""));
  			$('#loadingToast').show();
  			 $.ajax({
			"type" : "POST",
			"url" : wxreporturl,
			data : $('#wxreportcaseform').serialize(),
			"dataType" : "json",
			"success" : function(data) {
				var result = data.result;
				if(result == "failed") {
					$('#loadingToast').hide();
					alert("错误："+data.msg);
					/*mui.confirm('<p>'+data.msg+'</p>',"错误",['确定'],function(e){
						if(e.index==0){
							closeWin();
						} 
					});*/
					return;
				}
				$('#loadingToast').hide();
				alert("报案成功!");
				closeWin();
				/*mui.confirm('<p>'+"报案成功！"+'</p>',"提示",['确定'],function(e){
				    if(e.index==0){
						closeWin();
					} 
				});*/
			},
			"error" : function(request){
				$('#loadingToast').hide();
				alert("系统出错,请重试！");
				/* mui.confirm('<p>'+'系统出错,请重试！'+'</p>',"错误",['确定'],function(e){
					
				}); */
			}
		}); 
        
        
        
    }
})
/* window.onbeforeunload = onbeforeunload_handler;   
    window.onunload = onunload_handler;   
    function onbeforeunload_handler()
	{   
    	var report = "report";
    	var serviceItem = localStorage.getItem("serviceItem");
    	var carType = localStorage.getItem("carType");
    	var helpTime = localStorage.getItem("helpTime");
    	var rescueAddress = localStorage.getItem("rescueAddress");
    	var linkman = localStorage.getItem("linkman");
    	var phone = localStorage.getItem("phone");
    	var carFrameNumber = localStorage.getItem("carFrameNumber");
    	var caseNumber = localStorage.getItem("case_number");
    	var pshortName = localStorage.getItem("pshortName");
    	var carNumbers = localStorage.getItem("carNumbers");
    	var desAddress = localStorage.getItem("desAddress");
    	var remark = localStorage.getItem("remark");
    	
        localStorage.setItem("serviceItem"+report,serviceItem);
        localStorage.setItem("carType"+report,carType);
        localStorage.setItem("helpTime"+report,helpTime);
        localStorage.setItem("rescueAddress"+report,rescueAddress);
        localStorage.setItem("linkman"+report,linkman);
        localStorage.setItem("phone"+report,phone);
        localStorage.setItem("carFrameNumber"+report,carFrameNumber);
        localStorage.setItem("caseNumber"+report,caseNumber);
        localStorage.setItem("pshortName"+report,pshortName);
        localStorage.setItem("carNumbers"+report,carNumbers);
        localStorage.setItem("desAddress"+report,desAddress);
        localStorage.setItem("remark"+report,remark);
        var warning="确认退出?";           
        return warning;   
    }   
       
    function onunload_handler()
	{   
    	
    } 
$(window).unload(function(){
	alert(11);
	
}); 

$(document).ready(function (){
	var report = "report";
	var serviceItem = localStorage.getItem("serviceItem"+report);
	var carType = localStorage.getItem("carType"+report);
	var helpTime = localStorage.getItem("helpTime"+report);
	var rescueAddress = localStorage.getItem("rescueAddress"+report);
	var linkman = localStorage.getItem("linkman"+report);
	var phone = localStorage.getItem("phone"+report);
	var carFrameNumber = localStorage.getItem("carFrameNumber"+report);
	var caseNumber = localStorage.getItem("case_number"+report);
	var pshortName = localStorage.getItem("pshortName"+report);
	var carNumbers = localStorage.getItem("carNumbers"+report);
	var desAddress = localStorage.getItem("desAddress"+report);
	var remark = localStorage.getItem("remark"+report);
	$("#serviceItem").val(serviceItem);
	$("#carType").val(carType);
	$("#helpTime").val(helpTime);
	$("#rescueAddress").val(rescueAddress);
	$("#linkman").val(linkman);
	$("#phone").val(phone);
	$("#carFrameNumber").val(carFrameNumber);
	$("#caseNumber").val(caseNumber);
	$("#pshortName").val(pshortName);
	$("#carNumbers").val(carNumbers);
	$("#desAddress").val(desAddress);
	$("#remark").val(remark);
    console.log(helpTime);
    console.log(linkman);
}); */

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
    var currentdate = year + seperator1 + month + seperator1 + strDate + " " + hours + ":" + minutes;
    return currentdate;
}

function address(address,lat,lon){
	document.querySelector("#map-center").innerText = address;
	document.querySelector("#map-center").setAttribute("data-local",lat+','+lon);
	marker.setPosition([lon,lat]); //更新点标记位置
	map.setCenter([lon,lat]); //设置地图中心点
	$('.addressUl').hide();
}
</script>
</html>