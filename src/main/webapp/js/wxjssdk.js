function getWxConfig(){
	var ctx = $('#ctx').val();
	var appId = $('#appId').val();
	var url=location.href.split('#')[0];
	var wxsjsdkurl=ctx+"/platwechat/getWxConfig";
	$.ajax({
		"type" : "POST",
		"url" : wxsjsdkurl,
		"data" : {
			"appId" : appId,
			"url" : url
		},
		"dataType" : "json",
		"success" : function(result) {
			  
			 var wxConfig = result.wxConfig;
			 var appId = wxConfig.appId;
			 var timestamp = wxConfig.timestamp;;
			 var noncestr = wxConfig.noncestr;
			 var signature = wxConfig.signature;
			 /*$('#appId').val(appId);
			 $('#timestamp').val(timestamp);
			 $('#noncestr').val(noncestr);
			 $('#signature').val(signature); */
			 wx.config({
				    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				    appId: appId,//'wxd2643a9d66392e86', // 必填，公众号的唯一标识
				    timestamp:timestamp,//'1435629844' , // 必填，生成签名的时间戳
				    nonceStr: noncestr,//'02f0164a-0220-476f-a01c-eca78dc3c178', // 必填，生成签名的随机串
				    signature: signature,//'7bbd4b2a68b8df7bb9678590d11e80d764e756bc',// 必填，签名，见附录1
				    jsApiList: [
						'checkJsApi',
						'onMenuShareTimeline',
						'onMenuShareAppMessage',
						'onMenuShareQQ',
						'onMenuShareWeibo',
						'hideMenuItems',
						'showMenuItems',
						'hideAllNonBaseMenuItem',
						'showAllNonBaseMenuItem',
						'translateVoice',
						'startRecord',
						'stopRecord',
						'onRecordEnd',
						'playVoice',
						'pauseVoice',
						'stopVoice',
						'uploadVoice',
						'downloadVoice',
						'chooseImage',
						'previewImage',
						'uploadImage',
						'downloadImage',
						'getNetworkType',
						'openLocation',
						'getLocation',
						'hideOptionMenu',
						'showOptionMenu',
						'closeWindow',//关闭窗口
						'scanQRCode',
						'chooseWXPay',
						'openProductSpecificView',
						'addCard',
						'chooseCard',
						'openCard'
				              ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
				}); 
		}
	});
}


//关闭微信窗口
function closeWin(){
	WeixinJSBridge.call('closeWindow');	
}
//接口处理失败验证
wx.error(function (res) {
	   alert(res.errMsg);
});
		
		 

		
