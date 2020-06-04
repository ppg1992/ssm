

function getUserLocation(){
	 
	 /*wx.getLocation({
	      success: function (res) {
	        alert(JSON.stringify(res));
	      },
	      cancel: function (res) {
	        alert('用户拒绝授权获取地理位置');
	      }
	    }); */
	WeixinJSBridge.call('closeWindow');	
}

 
 
