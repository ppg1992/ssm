<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>汽车救援</title>
    <link rel="stylesheet" href="${ctx}/static/wechat/css/mui.min.css"/>
    <link rel="stylesheet" href="${ctx}/static/wechat/css/weui.css" />
   <%--  <link rel="stylesheet" href="${ctx}/static/wechat/css/bootstrap.css" /> --%>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" />
    <script src="${ctx}/static/wechat/js/mui.min.js"></script>
    <script src="${ctx}/static/wechat/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" charset="utf-8">
      	mui.init();
    </script>
    <style>
    	ul,li{
    		text-decoration: none;
    		list-style-type: none;
    		
    	}
    	.active{
    		color:#33B294;
    	}
    	.photos_active{
    		border-bottom: 1px solid gainsboro;
    	}
    	.active_mic li{
    		float:left;
    		margin:0 2px;
    	}
    	.mui-input-row label {
		    font-family: '微软雅黑';
		    line-height: 1.1;
		    float: left;
		    width: 25%;
		    padding: 11px 5px;
		}
		#messa{
		color:#fff;
		font-size: 18px;
		line-height: 40px;
		text-align: center;
		width:100%;
		height: 40px;
		background:#F3A374;
		cursor: pointer;
		font-weight: bold;
		border-radius: 3px;
	}
	#messasblock{
		color:#fff;
		font-size: 18px;
		line-height: 40px;
		text-align: center;
		width:100%;
		height: 40px;
		background:#F3A374;
		cursor: pointer;
		font-weight: bold;
		border-radius: 3px;
	}
	
    </style>
</head>
<body>
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
		<input type="hidden" id="addressvalue" name="addressvalue" value="${weChatData.addressvalue}"/>
		<input type="hidden" id="helpTimeStr" value="${weChatData.helpTime}" />
		<input type="hidden" id="serviceItem" name="serviceItem" value="${weChatData.serviceItem}" />
		<input type="hidden" id="carType" name="carType" value="${weChatData.carType}" />
		<input type="hidden" id="customeIndex" name="customeIndex" value="${weChatData.customeIndex}" />
		<div class="mui-input-group" style="margin-bottom:50px;">	
			<div class="content">
			  <div class="mui-input-row">
			    <label style="font-weight:700;">联系电话:</label>
			    <input id="phone" name="phone" value="${weChatData.phone}" type="text" class="mui-input-clear"  placeholder="请输入联系电话">
			  </div>
			  <div class="mui-input-row" style="border:none ! important;">
				    <label style="font-weight: bold;">联&nbsp;&nbsp;系&nbsp;&nbsp;人:</label>
				    <input name="linkman" value="${weChatData.linkman}" type="text" class="mui-input-clear"  placeholder="请输入联系人姓名">
			  </div>
			  <div class="mui-input-row" style="border:none ! important;">
				    <label style="font-weight: bold;">车&nbsp;&nbsp;牌&nbsp;&nbsp;号:</label>
				    <div id="carnumber"  style="float:left;height:40px;width:10%;text-align: center;border:1px solid red;border-radius:50%;color:#33B294;cursor: pointer;">
				    	 <li class="mui-table-view-cell" style="padding:8px 2px;">
						               浙
						</li>
				    </div>
				    <input name="carNumbers" value="${weChatData.carNumbers}" type="text"  class="mui-input-clear"  placeholder="请输入车牌号">
			  </div>
			  <div class="mui-input-row" style="position:relative">
			    <label style="font-weight: bold;"><a href="" class="mui-navigate-right"></a>服务项目:</label>
			    <div id="cofor">
			    	<li class="mui-table-view-cell" style="padding:11px 38 px;cursor:pointer;">
					          --请选择--
					</li>
			    </div>
			  </div>
			  
			  <div class="mui-input-row">
			    <label style="font-weight: bold;">作业地址:</label>
			    <textarea id="rescueAddress" name="rescueAddress" readonly="readonly" class="mui-input-clear"  placeholder="请选择作业地址" onclick="wxaddress('rescueAddress');">${weChatData.rescueAddress}</textarea>
			  	<span class="mui-icon mui-icon-location" onclick="wxaddress('rescueAddress');" style="color:red;font-size:25px;width:5%;cursor:pointer;position:absolute;right:15px;top:8px;"></span>
			  </div>
			  <div class="mui-input-row">
			    <label style="font-weight: bold;">预约时间:</label>
			    <input id="helpTime" name="helpTime" type="datetime-local" class="mui-input-clear"  placeholder="请输入预约时间">
			  </div>
			  <div class="mui-input-row">
				    <label style="font-weight: bold;"><a href="" class="mui-navigate-right"></a>车辆类型:</label>
				    <div id="cartypesmall">
				    	<li class="mui-table-view-cell" style="padding:11px 38px;cursor:pointer;">
						                请选择车辆类型
						 </li>
				    </div>
			  </div>
		 	</div>
			<div id="messa">
				更&nbsp;&nbsp;多&nbsp;&nbsp;信&nbsp;&nbsp;息 >>
			</div>
			<div id="messasblock" style="display:none;">
				收&nbsp;&nbsp;起&nbsp;&nbsp;信&nbsp;&nbsp;息 <<
			</div>
			<div class="content" id="blockform"  style="margin-bottom:80px;display:none;">
				  <div class="mui-input-row" style="border:none ! important;">
				    <label style="font-weight: bold;">目&nbsp;&nbsp;的&nbsp;&nbsp;地:</label>
				    <input id="desAddress" name="desAddress" value="${weChatData.desAddress}" type="text" class="mui-input-clear" placeholder="请选择目的地" readonly="readonly" onclick="wxaddress('desAddress');">
				    <span class="mui-icon mui-icon-location" onclick="wxaddress('desAddress');" style="color:red;font-size:25px;width:5%;cursor:pointer;position:absolute;right:15px;top:8px;"></span>
				  </div>
				  <div class="mui-input-row" style="border:none ! important;">
				    <label style="font-weight: bold;">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>
				    <input name="remark" value="${weChatData.remark}" type="text" class="mui-input-clear" placeholder="请输入备注">
			  	  </div>
				  <div class="mui-input-row" style="border:none ! important;">
				    <label style="font-weight: bold;">案件数量:</label>
				    <%-- <input name="caseNum" id="caseNum" value="${weChatData.caseNum}" type="text" class="mui-input-clear"  placeholder="请输入案件数量"> --%>
				    <div class="mui-numbox" data-numbox-min='1' data-numbox-max='10' style="float:left;margin:2px 37px">
					  <!-- "-"按钮，点击可减小当前数值 -->
					  <button class="mui-btn mui-numbox-btn-minus" type="button">-</button>
					  <input class="mui-numbox-input" type="number" name="caseNum" id="caseNum" value="${weChatData.caseNum}"/>
					  <!-- "+"按钮，点击可增大当前数值 -->
					  <button class="mui-btn mui-numbox-btn-plus" type="button">+</button>
					</div>
				  </div>	
			</div>
			
			 	<div id="severvices" class="severs" style="position:absolute;top:10px;left:0; width:100%;height:auto;z-index:15; display: none;">
					<div class="contents" style=" width:90%;margin:0 auto;">
						<div style="background:#33B294;width:100%;height:44px;color:#fff;border-radius:5px 5px 0 0;text-align: center;line-height: 44px;">服&nbsp;&nbsp;务&nbsp;&nbsp;类&nbsp;&nbsp;型</div>
						<div class="mui-content"  style="background:#fff;width:100%;color:#000;border:2px solid #33B294;text-align: center;cursor:pointer;height:400px;overflow-y:scroll;">
						    <div class="mui-row">
						    <c:forEach items="${serTypejson}" var="sel">
								<c:choose>
									<c:when test='${sel.selected}'>
										<div class="mui-col-sm-6 mui-col-xs-12 function active">
											<li class="mui-table-view-cell " style="padding:11px 35px;background:none;">
												${sel.text}
											</li>
											<input type="hidden" value="${sel.id}" >
										</div>
									</c:when>
									<c:otherwise>
										<div class="mui-col-sm-6 mui-col-xs-12 function ">
											<li class="mui-table-view-cell " style="padding:11px 35px;background:none;">
												${sel.text}
											</li>
											<input type="hidden" value="${sel.id}" >
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						    </div>
						</div>
					</div>		
				</div>
				<div id="cartype" class="cartype" style="position:absolute;top:0px;left:0; width:100%;height:auto;z-index:15;display:none;">
					<div class="contents" style=" width:90%;margin:0 auto;">
						<div id="" style="background:#33B294;width:100%;height:44px;color:#fff;border-radius:5px 5px 0 0;text-align: center;line-height: 44px;">车&nbsp;&nbsp;辆&nbsp;&nbsp;类&nbsp;&nbsp;型</div>
						<div class="mui-content"  style="background:#fff;width:100%;color:#000;border:2px solid #33B294;text-align: center;cursor:pointer;">
						    <div class="mui-row">
						        <c:forEach items="${carTypejson}" var="sel">
						        	<c:choose>
						        		<c:when test='${sel.selected}'>
						        			<div class="mui-col-sm-6 mui-col-xs-12 function active">
						        				<li class="mui-table-view-cell " style="padding:11px 35px;background:none;">
						        					${sel.text}
						        				</li>
						        				<input type="hidden" value="${sel.id}" >
						        			</div>
						        		</c:when>
						        		<c:otherwise>
						        			<div class="mui-col-sm-6 mui-col-xs-12 function ">
						        				<li class="mui-table-view-cell " style="padding:11px 35px;background:none;">
						        					${sel.text}
						        				</li>
						        				<input type="hidden" value="${sel.id}" >
						        			</div>
						        		</c:otherwise>
						        	</c:choose>
						        </c:forEach>
						    </div>
						</div>
					</div>		
				</div>
				<div  id="platenumber"  style="position:absolute;top:10px;left:0; width:100%;height:auto;z-index:99;display:none;">
					<input type="hidden" id="pshortName" name="pshortName" value="${weChatData.pshortName}" />
					<div class="contents" style=" width:90%;margin:0 auto;">
						<div id="" style="background:#33B294;width:100%;height:44px;color:#fff;border-radius:5px 5px 0 0;text-align: center;line-height: 44px;">车&nbsp;&nbsp;牌&nbsp;&nbsp;号&nbsp;&nbsp;</div>
						<div class="mui-content"  style="background:#fff;width:100%;color:#000;border:2px solid #33B294;text-align: center;cursor:pointer;">
						    <div class="mui-row">
						        <div class="mui-col-sm-2 mui-col-xs-3 function active">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	浙
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                   		鲁  
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function ">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                   	 	皖
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	京
						            </li>
						        </div> 
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	渝
						            </li>
						        </div><div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	蒙
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	新
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	藏
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	宁
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						             <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	桂
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	港
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	澳
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	黑
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	吉
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						             <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	辽
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						             <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	晋
						            </li>
						        </div>
						       <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	冀
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	青
						            </li>
						        </div>
						       <div class="mui-col-sm-2 mui-col-xs-3 function">
						             <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	沪
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	豫
						            </li>
						        </div>
						       <div class="mui-col-sm-2 mui-col-xs-3 function">
						             <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	苏
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	闽
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	赣
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	湘
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						             <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	鄂
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						             <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	粤
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	琼
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						           <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	甘
						            </li>
						        </div>
						       <div class="mui-col-sm-2 mui-col-xs-3 function">
						           <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	陕
						           </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	甘
						            </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	黔
						            </li>
						        </div>
						       <div class="mui-col-sm-2 mui-col-xs-3 function">
						             <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	滇
						             </li>
						        </div>
						        <div class="mui-col-sm-2 mui-col-xs-3 function">
						            <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	川
						            </li>
						        </div>
						       <div class="mui-col-sm-2 mui-col-xs-3 function">
						           <li class="mui-table-view-cell" style="padding:8px 2px;background:none;">
						                    	云
						           </li>
						        </div>
						    </div>
						</div>
					</div>		
				</div>
		</div>
	</form>
	<nav class="mui-bar mui-bar-tab" >  
	    <button type="button" onclick="wxportcasesubmit();" style="border:none;background:#33B294;width:100%;color:#fff;font-size:18px;border-radius:0;">提&nbsp;&nbsp;交</button>
	</nav>
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
</body>
<script type="text/javascript" src='http://webapi.amap.com/maps?v=1.3&test=true&plugin=AMap.ToolBar&key=0940ad2955c9bf7146da628dae5d523a'></script>
<script type='text/javascript' src='${ctx}/static/wechat/js/zepto.min.js'></script>
<script src="//webapi.amap.com/ui/1.0/main.js"></script>
<script >
  /*   $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'}); */
  
	$(function() {
		var geolocationFlag = "${geolocationFlag}";//是否自动定位
		//页面加载自动定位到当前位置
		mapObj = new AMap.Map('iCenter');
		mapObj.plugin('AMap.Geolocation', function () {
		    geolocation = new AMap.Geolocation({
		        enableHighAccuracy: true,//是否使用高精度定位，默认:true
		        timeout: 10000,          //超过10秒后停止定位，默认：无穷大
		        maximumAge: 0,           //定位结果缓存0毫秒，默认：0
		        convert: true,           //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
		        showButton: true,        //显示定位按钮，默认：true
		        buttonPosition: 'LB',    //定位按钮停靠位置，默认：'LB'，左下角
		        buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
		        showMarker: true,        //定位成功后在定位到的位置显示点标记，默认：true
		        showCircle: true,        //定位成功后用圆圈表示定位精度范围，默认：true
		        panToLocation: true,     //定位成功后将定位到的位置作为地图中心点，默认：true
		        zoomToAccuracy:true      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
		    });
			
		    if(geolocationFlag!="false"){
		    	mui.confirm('<p>您是否需要自动定位作业点到当前位置？</p>',"提示",['确定','取消'],function(e){
					if(e.index==0){
						geolocation.getCurrentPosition();
					}
				});
		   	 	
		   	}
		    AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
		    AMap.event.addListener(geolocation, 'error', onError);//返回定位失败信息
		})
	})
	
	 //解析定位结果
    function onComplete(data) {
        var lng = data.position.getLng();
        var lat = data.position.getLat();
        var address = data.formattedAddress;
        console.log(data);
        $("#rescueAddress").val(address);
		$("#rescueLatitude").val(lat);
		$("#rescueLongitude").val(lng);
        console.log(data.addressComponent.city);
    }
        
	function onError(data) {
		console.log(data);
		mui.confirm('<p>自动定位失败，请手动点击故障车位置选择您所在的位置！</p>',"提示",['确定'],function(e){
			if(e.index==0){
			}
		});
	 }
</script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"> </script>
<script src="${ctx}/js/wxjssdk.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.form.js" type="text/javascript"></script>
<script src="${ctx}/js/wxcasereport.js"></script>
</html>